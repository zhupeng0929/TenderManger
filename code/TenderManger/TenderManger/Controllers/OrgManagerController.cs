using System;
using System.Web.Mvc;
using TenderManger.Mvc.Controllers;

namespace TenderManger.Mvc.Controllers
{
    public class OrgManagerController : BaseController
    {
       
        //
        // GET: /OrgManager/
        //[Authenticate]
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Assign(Guid firstId, string key)
        {
            ViewBag.FirstId = firstId;
            ViewBag.ModuleType = key;
            return View();
        }

        public JsonResult LoadOrg()
        {
            //return JsonHelper.Serialize(AuthUtil.GetCurrentUser().Orgs);
            return Json("");
        }

        public JsonResult LoadForUser(Guid firstId)
        {
            //var orgs = OrgApp.LoadForUser(firstId);
            //return JsonHelper.Instance.Serialize(orgs);
            return Json("");
        }

        public JsonResult LoadForRole(Guid firstId)
        {
            //var orgs = OrgApp.LoadForRole(firstId);
            //return JsonHelper.Instance.Serialize(orgs);
            return Json("");
        }


        //添加组织提交
        [HttpPost]
        public JsonResult AddOrg(/*Org org*/)
        {
            //try
            //{
            //    OrgApp.AddOrUpdate(org);
            //}
            //catch (Exception ex)
            //{
            //     Result.Status = false;
            //    Result.Message = ex.Message;
            //}
            //return JsonHelper.Instance.Serialize(Result);
            return Json("");
        }
        
        public JsonResult LoadChildren(Guid id)
        {
            //return JsonHelper.Instance.Serialize(OrgApp.LoadAllChildren(id));
            return Json("");
        }

        /// <summary>
        /// 删除指定ID的组织
        /// <para>Id为逗号分开的字符串</para>
        /// </summary>
        /// <returns>System.String.</returns>
        [HttpPost]
        public JsonResult DelOrg(Guid[] ids)
        {
            //try
            //{
            //    OrgApp.DelOrg(ids);
            //}
            //catch (Exception e)
            //{
            //     Result.Status = false;
            //    Result.Message = e.Message;
            //}

            //return JsonHelper.Instance.Serialize(Result);
            return Json("");
        }
    }
}