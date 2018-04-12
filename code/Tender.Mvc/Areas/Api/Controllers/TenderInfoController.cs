using Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tender.App;
using Tender.App.SSO;
using Tender.App.ViewModel;
using Tender.Mvc.Controllers;

namespace Tender.Mvc.Areas.Api.Controllers
{
    public class TenderInfoController : BaseController
    {
        public TenderInfoManagerApp _app { get; set; }
        // GET: Api/TenderInfo
        public string GetTenderList()
        {
            var result = new List<TenderInfoView>();
            var list = BaseUserInfo.TenderInfos;
            list.ForEach(t=> 
            {
                var tendervm = new TenderInfoView();
                tendervm =AutoMapperExt.MapTo<TenderInfoView>(t);
                tendervm.EnclosurePic = _app.GetFiles(t.Id);
                result.Add(tendervm);
            });
            Result.Result = result;
            return JsonHelper.Instance.Serialize(Result);
        }
    }
}