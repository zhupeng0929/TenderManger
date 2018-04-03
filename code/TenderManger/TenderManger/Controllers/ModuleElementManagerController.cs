
using TenderManger.Models;
using System;
using System.Web.Mvc;

namespace TenderManger.Mvc.Controllers
{
    public class ModuleElementManagerController : BaseController
    {

        public ActionResult Index(Guid id)
        {
            ViewBag.ModuleId = id;
            return View();
        }
        public ActionResult Get(Guid moduleId)
        {
            return Json(moduleElementService.LoadByModuleId(moduleId, UserInfo.Id), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public string AddOrEditButton(ModuleElementEntity button)
        {
            try
            {
                moduleElementService.AddOrUpdate(button);
            }
            catch (Exception e)
            {

                Result.Status = false;
                Result.Message = e.Message;
            }
            return JsonHelper.SerializerObject(Result);
        }
        public string Del(Guid[] ids)
        {
            try
            {
                moduleElementService.DelModuleElementBatch(ids);
            }
            catch (Exception e)
            {
                Result.Status = false;
                Result.Message = e.Message;
            }
            return JsonHelper.SerializerObject(Result);
        }

        /// <summary>
        /// 分配模块菜单（按钮）界面
        /// <para>可以为用户/角色分配，同过key（UserElement/RoleElement）区分</para>
        /// </summary>
        /// <param name="firstId">The first identifier.</param>
        /// <param name="key">The key.</param>
        /// <returns>ActionResult.</returns>
        public ActionResult AssignModuleElement(Guid firstId, string key)
        {
            ViewBag.FirstId = firstId;
            ViewBag.ModuleType = key;
            return View();
        }
        public string LoadWithAccess(Guid tId, Guid firstId, string key)
        {
            return JsonHelper.SerializerObject(moduleElementService.LoadWithAccess(UserInfo.Id, key, firstId, tId));
        }
    }
}