
using System;

using System.Web.Mvc;
using TenderManger.Models;

namespace TenderManger.Mvc.Controllers
{
    public class RoleManagerController : BaseController
    {


        public ActionResult Index()
        {
            return View();
        }

        //添加或修改角色
        [HttpPost]
        public ActionResult Add(RoleVM obj)
        {
            try
            {
                roleService.AddOrUpdate(obj);
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return Json(Result);
        }

        /// <summary>
        /// 加载角色下面的所有用户
        /// </summary>
        public string Load(Guid orgId, int pageCurrent = 1, int pageSize = 30)
        {
            return JsonHelper.SerializerObject(roleService.Load(orgId, pageCurrent, pageSize));
        }

        [System.Web.Mvc.HttpPost]
        public string Delete(Guid[] ids)
        {
            try
            {
                foreach (var obj in ids)
                {
                    roleService.Delete(obj);
                }
            }
            catch (Exception e)
            {
                Result.Status = false;
                Result.Message = e.Message;
            }

            return JsonHelper.SerializerObject(Result);
        }

        #region 为用户设置角色界面
        public ActionResult LookupMulti(Guid firstId, string key)
        {
            ViewBag.FirstId = firstId;
            ViewBag.ModuleType = key;
            return View();
        }

        public string LoadForOrgAndUser(Guid orgId, Guid userId)
        {
            return JsonHelper.SerializerObject(roleService.LoadForOrgAndUser(orgId, userId));
        }

        #endregion 为用户设置角色界面
    }
}