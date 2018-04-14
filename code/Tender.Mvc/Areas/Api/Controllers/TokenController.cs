

using Tender.Mvc.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Infrastructure;
using Tender.App.SSO;
using Tender.App.ViewModel;
using Tender.App;
using System.IO;

namespace Tender.Mvc.Controllers
{
    /// <summary>
    /// 基础控制器
    /// <para>用于控制登录用户是否有权限访问指定的Action</para>
    /// <para>ZhuPeng新增于2018-07-19 11:12:09</para>
    /// </summary>
    public class TokenController : SSOController
    {
        protected Response Result = new Response();
        protected ModuleView CurrentModule;
        protected string Controllername;   //当前控制器小写名称
        protected string Actionname;        //当前Action小写名称
        private AuthorizeApp _appauth;

        protected UserWithAccessedCtrls BaseUserInfo;

        public TokenController()
        {
            _appauth = AutofacExt.GetFromFac<AuthorizeApp>();
            BaseUserInfo = AuthUtil.GetCurrentUser();
        }
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);

            if (!AuthUtil.CheckLogin())
            {
                filterContext.HttpContext.Response.StatusCode = 401;
                filterContext.HttpContext.Response.End();
                return;
            }

            CurrentModule = BaseUserInfo.Modules.FirstOrDefault(u => u.Url.ToLower().Contains(Controllername));

            if (CurrentModule == null)
            {
                LogHelper.Debug(new LogContent(filterContext.RequestContext.HttpContext.Request.UserHostAddress, BaseUserInfo.User.Name, Controllername + Actionname, Controllername + Actionname));
            }
            else
            {
                LogHelper.Debug(new LogContent(filterContext.RequestContext.HttpContext.Request.UserHostAddress, BaseUserInfo.User.Name, CurrentModule.Name, CurrentModule.Url));
            }
        }

        
    }
}