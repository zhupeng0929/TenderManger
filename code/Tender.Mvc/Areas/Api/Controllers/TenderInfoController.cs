using Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tender.App;
using Tender.App.SSO;
using Tender.App.ViewModel;
using Tender.Domain;
using Tender.Mvc.Controllers;

namespace Tender.Mvc.Areas.Api.Controllers
{
    public class TenderInfoController : BaseController
    {
        public TenderInfoManagerApp _app { get; set; }
        public BidInfoManagerApp _appbid { get; set; }
        // GET: Api/TenderInfo
        public string GetTenderList()
        {
            var result = new List<TenderInfoView>();
            var list = BaseUserInfo.TenderInfos;
            var bidList = BaseUserInfo.BidInfos;
            list.ForEach(t =>
            {
                var tendervm = new TenderInfoView();
                tendervm = AutoMapperExt.MapTo<TenderInfoView>(t);
                tendervm.EnclosurePic = _app.GetFiles(t.Id);
                if (t.State == 1)
                {
                    tendervm.TenderPrice = bidList.FirstOrDefault(b => b.TenderId == t.Id).TenderPrice;
                }
                result.Add(tendervm);
            });
            Result.Result = result;
            return JsonHelper.Instance.Serialize(Result);
        }

        public string GetTenderInfo(Guid id)
        {
            var baseinfo = _app.Find(id);
            var bidList = BaseUserInfo.BidInfos;
            var tendervm = new TenderInfoView();
            tendervm = AutoMapperExt.MapTo<TenderInfoView>(baseinfo);
            tendervm.EnclosurePic = _app.GetFiles(baseinfo.Id);
            if (baseinfo.State == 1)
            {
                tendervm.TenderPrice = bidList.FirstOrDefault(b => b.TenderId == baseinfo.Id).TenderPrice;
            }
            Result.Result = tendervm;
            return JsonHelper.Instance.Serialize(Result);
        }
        public string AddBid(Guid id,decimal price)
        {
            var model = new BidInfo();
            model.UserId = BaseUserInfo.User.Id;
            model.UserName = BaseUserInfo.User.Name;
            try
            {
                _appbid.Add(id, model);
            }
            catch(Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.ToString();
            }
         
            return JsonHelper.Instance.Serialize(Result);
        }
    }
}