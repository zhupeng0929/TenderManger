﻿using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

using Newtonsoft.Json.Linq;
using TenderManger.Mvc.Controllers;
using TenderManger.Models;

namespace TenderManger.Mvc
{
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }


        //protected void Application_Error(object sender, EventArgs e)
        //{
        //    var app = (MvcApplication)sender;
        //    var context = app.Context;
        //    var ex = app.Server.GetLastError();
        //    LogHelper.Fatal(ex.Message);

        //    context.Response.Clear();
        //    context.ClearError();
        //    var httpException = ex as HttpException;
        //    var routeData = new RouteData();
        //    routeData.Values["controller"] = "error";
        //    routeData.Values["exception"] = ex;
        //    routeData.Values["action"] = "http500";
        //    if (httpException != null)
        //    {


        //        switch (httpException.GetHttpCode())
        //        {
        //            case 404:
        //                routeData.Values["action"] = "http404";
        //                break;
        //            case 401:  //没有登录
        //                routeData.Values["action"] = "http401";
        //                break;
        //            case 400:  //演示版本，没有执行的权限
        //                routeData.Values["action"] = "DemoError";
        //                break;
        //        }
        //    }
        //    IController controller = new ErrorController();
        //    controller.Execute(new RequestContext(new HttpContextWrapper(context), routeData));
        //}
    }
}
