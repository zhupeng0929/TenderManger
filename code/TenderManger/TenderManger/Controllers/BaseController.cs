// ***********************************************************************
// Assembly         : TenderManger.Mvc
// Author           : yubaolee
// Created          : 07-11-2016
//
// Last Modified By : yubaolee
// Last Modified On : 07-19-2016
// Contact : www.cnblogs.com/yubaolee
// File: BaseController.cs
// ***********************************************************************


using TenderManger.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using TenderManger.Services;
using TenderManger.Util;

namespace TenderManger.Mvc.Controllers
{
    [Auth]
    public class BaseController : Controller
    {
        protected ResponseModel Result = new ResponseModel();
        public UserEntity UserInfo
        {
            get
            {
                try
                {
                    if (Session[CommonHelper.SessionUserKey] != null)
                    {
                        return Session[CommonHelper.SessionUserKey] as UserEntity;
                    }
                }
                catch (Exception)
                {
                    //Session为空时，继续走，取Cookie
                }
                return GetUser();
            }
        }
        protected ModuleView CurrentModule;
        protected UserEntity GetUser()
        {
            string key = CommonHelper.Md5(CommonHelper.COOKIE_KEY_USERINFO);
            string data = CookieHelper.GetCookieValue(key);
            if (!string.IsNullOrEmpty(data))
            {
                try
                {
                    data = CommonHelper.DesDecrypt(data, CommonHelper.COOKIE_KEY_ENCRYPT);
                    var userInfo = JsonHelper.Deserialize<UserEntity>(data);
                    Session[CommonHelper.SessionUserKey] = userInfo;
                    return userInfo;
                }
                catch (System.Exception ex)
                {
                    return null;
                }
            }
            return null;
        }
        public UserService _userService = new UserService();
        public RelevanceService relevanceService = new RelevanceService();
        public ModuleElementService moduleElementService = new ModuleElementService();
        public ModuleService moduleService = new ModuleService();
        public OrgService orgService = new OrgService();
        public RoleService roleService = new RoleService();


        protected string Controllername;   //当前控制器小写名称
        protected string Actionname;        //当前Action小写名称
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);



            Controllername = Request.RequestContext.RouteData.Values["controller"].ToString().ToLower();
            Actionname = filterContext.ActionDescriptor.ActionName.ToLower();

            var function = this.GetType().GetMethods().FirstOrDefault(u => u.Name.ToLower() == Actionname);
            if (function == null)
                throw new Exception("未能找到Action");


            CurrentModule = GetAccessedControls().Modules.FirstOrDefault(u => u.moduleEntity.Url.ToLower().Contains(Controllername));


            var version = ConfigurationManager.AppSettings["version"];
            if (version == "demo" && Request.HttpMethod == "POST")
            {
                throw new HttpException(400, "演示版本，不能进行该操作，当前模块:" + Controllername + "/" + Actionname);
            }

        }

        public UserWithAccessedCtrls GetAccessedControls()
        {
            var baseuser = _userService.GetUser(UserInfo.Account);
            var baseModule = moduleService.GetModulesQuery(UserInfo.Id);
            var user = new UserWithAccessedCtrls
            {
                User = baseuser,
                //Orgs = service.Orgs,
                Modules = new List<ModuleView>(),
                //Resources = service.Resources,
                //Roles = service.Roles
            };
            baseModule.ForEach(m =>
            {
                user.Modules.Add(new ModuleView { moduleEntity = m });
            });
            foreach (var moduleView in user.Modules)
            {
                moduleView.Elements =
                   moduleElementService.GetList().Where(u => u.ModuleId == moduleView.moduleEntity.Id).OrderBy(u => u.Sort).ToList();
            }

            user.ModuleWithChildren = user.Modules.GenerateTree(c => c.moduleEntity.Id, c => c.moduleEntity.ParentId);

            return user;
        }
    }
}