using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.App.ViewModel;
using Tender.Domain;
using Tender.Mvc.Models;

namespace Tender.Mvc.Controllers
{
    public class TenderUserManagerController : BaseController
    {
        public TenderUserManagerApp App { get; set; }

        //
        // GET: /UserManager/
        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }
        public string LoadForTree()
        {
            return JsonHelper.Instance.Serialize(App.LoadAll());
        }
        public string Load(int pageCurrent = 1, int pageSize = 30)
        {
            var list = App.Load(pageCurrent, pageSize);
            return JsonHelper.Instance.Serialize(list);
        }
        //添加或修改组织
        [HttpPost]
        public string Add(TenderUser view)
        {
            try
            {
                App.AddOrUpdate(view);

            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }

        [HttpPost]
        public string Delete(Guid[] ids)
        {
            try
            {
                App.Delete(ids);
            }
            catch (Exception e)
            {
                Result.Status = false;
                Result.Message = e.Message;
            }

            return JsonHelper.Instance.Serialize(Result);
        }
    }
}