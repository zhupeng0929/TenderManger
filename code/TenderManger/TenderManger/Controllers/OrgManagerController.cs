using System;
using System.Web.Mvc;
using TenderManger.Models;


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
            var Orgs = orgService.GetOrgsQuery(UserInfo.Id);
            return Json(Orgs, JsonRequestBehavior.AllowGet);
        }

        public JsonResult LoadForUser(Guid firstId)
        {
            var orgs = orgService.LoadForUser(firstId);
            return Json(orgs, JsonRequestBehavior.AllowGet);
        }

        public JsonResult LoadForRole(Guid firstId)
        {
            var orgs = orgService.LoadForRole(firstId);
            return Json(orgs, JsonRequestBehavior.AllowGet);
        }


        //添加组织提交
        [HttpPost]
        public JsonResult AddOrg(OrgEntity org)
        {
            try
            {
                orgService.AddOrUpdate(org);
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return Json(Result);
        }

        public JsonResult LoadChildren(Guid id)
        {
            return Json(orgService.LoadAllChildren(id),JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// 删除指定ID的组织
        /// <para>Id为逗号分开的字符串</para>
        /// </summary>
        /// <returns>System.String.</returns>
        [HttpPost]
        public JsonResult DelOrg(Guid[] ids)
        {
            try
            {
                orgService.DelOrg(ids);
            }
            catch (Exception e)
            {
                Result.Status = false;
                Result.Message = e.Message;
            }
            return Json(Result);
        }
    }
}