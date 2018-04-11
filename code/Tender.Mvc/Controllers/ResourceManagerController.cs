using Infrastructure;
using Tender.App;
using Tender.Domain;
using System;
using System.Linq;
using System.Web.Mvc;
using Tender.App.SSO;
using Tender.Mvc.Models;

namespace Tender.Mvc.Controllers
{
    public class ResourceManagerController : BaseController
    {
        public ResourceManagerApp App { get; set; }

        //
        // GET: /UserManager/
        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }

        //添加或修改Resource
        [HttpPost]
        public string Add(Resource model)
        {
            try
            {
                App.AddOrUpdate(model);
                Log("添加或修改资源", JsonHelper.Instance.Serialize(model));
            }
            catch (Exception ex)
            {
                 Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }

        /// <summary>
        /// 加载某分类的所有Resources
        /// </summary>
        public string Load(Guid categoryId, int page = 1, int rows = 30)
        {
            return JsonHelper.Instance.Serialize(App.Load(AuthUtil.GetUserName(), categoryId, page, rows));
        }

        public string LoadForTree()
        {
            var models = App.LoadAll();
            return JsonHelper.Instance.Serialize(models);
        }
        /// <summary>
        /// 批量删除资源
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        public string Delete(Guid[] ids)
        {
            try
            {
                App.Delete(ids);
                Log("批量删除资源", JsonHelper.Instance.Serialize(ids));
            }
            catch (Exception e)
            {
                 Result.Status = false;
                Result.Message = e.Message;
            }

            return JsonHelper.Instance.Serialize(Result);
        }

        /// <summary>
        /// 为用户或角色分配权限
        /// </summary>
        /// <param name="firstId">关联表中的firstId.</param>
        /// <param name="key">关联表中的Key
        /// <para>如：UserResource/RoleResource</para>
        /// </param>
        /// <returns>ActionResult.</returns>
        public ActionResult AssignRes(Guid firstId, string key)
        {
            ViewBag.FirstId = firstId;
            ViewBag.ModuleType = key;
            return View();
        }

        /// <summary>
        /// 加载带有授权的资源信息
        /// </summary>
        /// <param name="cId">分类ID</param>
        /// <param name="firstId">关联表中的firstId</param>
        /// <param name="key">关联表中的key</param>
        /// <returns>System.String.</returns>
        public string LoadWithAccess(Guid cId, Guid firstId, string key)
        {
            return JsonHelper.Instance.Serialize(App.LoadWithAccess(AuthUtil.GetUserName(),key,firstId, cId));
        }
    }
}