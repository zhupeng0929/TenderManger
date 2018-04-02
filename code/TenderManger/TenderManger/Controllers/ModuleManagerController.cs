
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using TenderManger.Models;
namespace TenderManger.Mvc.Controllers
{
    public class ModuleManagerController : BaseController
    {

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Assign(Guid firstId, string key)
        {
            ViewBag.FirstId = firstId;
            ViewBag.ModuleType = key;

            var moduleWithChildren = GetAccessedControls().ModuleWithChildren;
            var modules = key == "UserModule" ? moduleService.LoadForUser(firstId) : moduleService.LoadForRole(firstId);

            CheckModule(moduleWithChildren, modules);

            ViewBag.Modules = BuilderModules(moduleWithChildren);

            return View();
        }

        private void CheckModule(IEnumerable<TreeItem<ModuleView>> moduleWithChildren, List<ModuleEntity> modules)
        {
            foreach (var module in moduleWithChildren)
            {
                if (module.Children.Any())
                {
                    CheckModule(module.Children, modules);
                }

                if (modules.Select(u => u.Id).Contains(module.Item.moduleEntity.Id))
                {
                    module.Item.Checked = true;
                }

            }
        }

        public string BuilderModules(IEnumerable<TreeItem<ModuleView>> modules)
        {
            StringBuilder sb = new StringBuilder();
            foreach (var moduleView in modules)
            {
                if (moduleView.Children.Any())
                {
                    sb.Append("<fieldset class=\"layui-elem-field\">\r\n");
                    sb.Append("<legend>");
                    BuildCheckbox(sb, moduleView);
                    sb.Append("</legend>\r\n");
                    sb.Append("<div class=\"layui-field-box\">\r\n");
                    sb.Append(BuilderModules(moduleView.Children));
                    sb.Append("</div>\r\n");
                    sb.Append("</fieldset>\r\n");

                    //sb.Append("<div class=\"layui-form-item\">\r\n");
                    //BuildCheckbox(sb, moduleView);
                    //sb.Append("<div class=\"layui-input-block\">\r\n");
                    //sb.Append(BuilderModules(moduleView.Children));
                    //sb.Append("</div>\r\n");
                    //sb.Append("</div>\r\n");
                }
                else
                {
                    BuildCheckbox(sb, moduleView);
                }
            }
            return sb.ToString();
        }

        private void BuildCheckbox(StringBuilder sb, TreeItem<ModuleView> moduleView)
        {
            sb.Append("<input type=\"checkbox\" value=\"" + moduleView.Item.moduleEntity.Id + "\" title=\"" + moduleView.Item.moduleEntity.Name + "\"");
            if (moduleView.Item.Checked)
            {
                sb.Append(" checked");
            }
            sb.Append(">\r\n");
        }

        /// <summary>
        /// 加载模块下面的所有模块
        /// </summary>
        public string Load(Guid orgId, int page = 1, int rows = 30)
        {
            return JsonHelper.SerializerObject(moduleService.Load(UserInfo.Id, orgId, page, rows));
        }

        /// <summary>
        /// 加载用户模块
        /// </summary>
        /// <param name="firstId">The user identifier.</param>
        /// <returns>System.String.</returns>
        public string LoadForUser(Guid firstId)
        {
            var orgs = moduleService.LoadForUser(firstId);
            return JsonHelper.SerializerObject(orgs);
        }

        /// <summary>
        /// 加载角色模块
        /// </summary>
        /// <param name="firstId">The role identifier.</param>
        /// <returns>System.String.</returns>
        public string LoadForRole(Guid firstId)
        {
            var orgs = moduleService.LoadForRole(firstId);
            return JsonHelper.SerializerObject(orgs);
        }

        public string LoadModule()
        {
            var orgs = moduleService.GetModulesQuery(UserInfo.Id);
           
            return JsonHelper.SerializerObject(orgs);
        }

        #region 添加编辑模块

        //添加或修改模块
        [HttpPost]
        public string Add(ModuleEntity model)
        {
            try
            {
                moduleService.AddOrUpdate(model);
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.SerializerObject(Result);
        }

        [HttpPost]
        public string Delete(Guid[] ids)
        {
            try
            {
                foreach (var obj in ids)
                {
                    moduleService.Delete(obj);
                }
            }
            catch (Exception e)
            {
                Result.Status = false;
                Result.Message = e.Message;
            }

            return JsonHelper.SerializerObject(Result);
        }

        #endregion 添加编辑模块
    }
}