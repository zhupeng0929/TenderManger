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
    public class TenderInfoController : TokenController
    {
        public TenderInfoManagerApp _app { get; set; }
        public BidInfoManagerApp _appbid { get; set; }
        public TenderUserManagerApp _appUser { get; set; }
        // GET: Api/TenderInfo
        public string GetTenderList()
        {
            var result = new List<TenderInfoView>();
            var list = BaseUserInfo.TenderInfos.Where(t => t.State == 1).ToList();//正在招标
            var bidList = BaseUserInfo.BidInfos;
            list.ForEach(t =>
            {
                var tendervm = new TenderInfoView();
                tendervm = AutoMapperExt.MapTo<TenderInfoView>(t);
                tendervm.EnclosurePic = _app.GetFiles(t.Id);
                var bidinfo = bidList.FirstOrDefault(b => b.TenderId == t.Id);
                if (bidinfo != null)
                {
                    tendervm.TenderPrice = bidinfo.TenderPrice;
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
            var bidinfo = bidList.FirstOrDefault(b => b.TenderId == id);
            if (bidinfo != null)
            {
                tendervm.TenderPrice = bidinfo.TenderPrice;
            }
            Result.Result = tendervm;
            return JsonHelper.Instance.Serialize(Result);
        }
        [HttpPost]
        public string AddBid(Guid id, decimal price)
        {
            if (id == Guid.Empty || price <= 0)
            {
                Result.Status = false;
                Result.Message = "参数错误";
            }
            else
            {
                var model = new BidInfo();
                model.UserId = BaseUserInfo.User.Id;
                model.UserName = BaseUserInfo.User.Name;
                model.TenderPrice = price;
                try
                {
                    _appbid.Add(id, model);
                }
                catch (Exception ex)
                {
                    Result.Status = false;
                    Result.Message = ex.Message;
                }
            }



            return JsonHelper.Instance.Serialize(Result);
        }

        public string GetTenderHostory()
        {
            var result = new List<TenderInfoView>();
            var list = BaseUserInfo.TenderInfos.Where(t => t.State > 1).ToList();//历史招标
            var bidList = BaseUserInfo.BidInfos;
            list.ForEach(t =>
            {
                var tendervm = new TenderInfoView();
                tendervm = AutoMapperExt.MapTo<TenderInfoView>(t);
                tendervm.EnclosurePic = _app.GetFiles(t.Id);
                var bidinfo = bidList.FirstOrDefault(b => b.TenderId == t.Id);
                if (bidinfo != null)
                {
                    tendervm.TenderPrice = bidinfo.TenderPrice;
                    tendervm.BidInfoState = bidinfo.StateDes;
                }

                result.Add(tendervm);
            });
            Result.Result = result;
            return JsonHelper.Instance.Serialize(Result);
        }

        public string GetUser()
        {
            Result.Result = _appUser.Find(BaseUserInfo.User.Id);
            return JsonHelper.Instance.Serialize(Result);
        }
    }
}