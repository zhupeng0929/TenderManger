﻿// ***********************************************************************
// Assembly         : Tender.Mvc
// Author           : yubaolee
// Created          : 07-11-2016
//
// Last Modified By : yubaolee
// Last Modified On : 07-19-2016
// Contact : www.cnblogs.com/yubaolee
// File: BaseController.cs
// ***********************************************************************


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

namespace Tender.Mvc.Controllers
{
    /// <summary>
    /// 基础控制器
    /// <para>用于控制登录用户是否有权限访问指定的Action</para>
    /// <para>李玉宝新增于2016-07-19 11:12:09</para>
    /// </summary>
    public class BaseController : SSOController
    {
        protected Response Result = new Response();
        protected ModuleView CurrentModule;
        protected string Controllername;   //当前控制器小写名称
        protected string Actionname;        //当前Action小写名称

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);

            if (!AuthUtil.CheckLogin()) return;

            Controllername = Request.RequestContext.RouteData.Values["controller"].ToString().ToLower();
            Actionname = filterContext.ActionDescriptor.ActionName.ToLower();

            var function = this.GetType().GetMethods().FirstOrDefault(u => u.Name.ToLower() == Actionname);
            if (function == null)
                throw new Exception("未能找到Action");

            var authorize = function.GetCustomAttribute(typeof(AuthenticateAttribute));
            CurrentModule = AuthUtil.GetCurrentUser().Modules.FirstOrDefault(u => u.Url.ToLower().Contains(Controllername));
            //当前登录用户没有Action记录&&Action有authenticate标识
            if (authorize != null && CurrentModule == null)
            {
                filterContext.Result = new RedirectResult("/Login/Index");
                return;
            }

            var version = ConfigurationManager.AppSettings["version"];
            if (version == "demo" && Request.HttpMethod == "POST")
            {
                throw new HttpException(400, "演示版本，不能进行该操作，当前模块:" + Controllername + "/" + Actionname);
            }

        }
    }
}