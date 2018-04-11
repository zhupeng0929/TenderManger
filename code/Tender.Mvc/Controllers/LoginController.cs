using System;
using System.Configuration;
using System.Web.Mvc;
using Infrastructure;
using Tender.App.SSO;
using Infrastructure.Cache;

namespace Tender.Mvc.Controllers
{
    public class LoginController : Controller
    {
        //private string _appKey = ConfigurationManager.AppSettings["SSOAppKey"];
        private ObjCacheProvider<UserAuthSession> _objCacheProvider = new ObjCacheProvider<UserAuthSession>();
        // GET: Login
        public ActionResult Index()
        {
            //ViewBag.AppKey = _appKey;
            return View();
        }

        [HttpPost]
        public string Index(string username, string password)
        {
            var resp = new Response();
            try
            {
                var result = AuthUtil.Login( username, password);
                resp.Status = result.Success;
                if (result.Success)
                {
                    resp.Result = "/home/index?Token=" + result.Token;
                    LogHelper.Info(new LogContent(Request.UserHostAddress, username, "登录系统", "登录成功"));
                }
                else
                {
                    resp.Message = "登陆失败";
                    LogHelper.Info(new LogContent(Request.UserHostAddress, username, "登录系统", "登陆失败"));
                }
            }
            catch (Exception e)
            {
                resp.Status = false;
                resp.Message = e.Message;
            }
            return JsonHelper.Instance.Serialize(resp);
        }

        ///// <summary>
        ///// 开发者登陆
        ///// </summary>
        //public ActionResult LoginByDev()
        //{
        //    try
        //    {
        //        var result = AuthUtil.Login("System","123456");
        //        if (result.Success)
        //            return Redirect("/home/index?Token=" + result.Token);
        //        else
        //        {
        //            return RedirectToAction("Index", "Login");

        //        }

        //    }
        //    catch (Exception e)
        //    {
        //        return RedirectToAction("Index", "Login");
        //    }
        //}

        public ActionResult Logout()
        {

            AuthUtil.Logout();

            return RedirectToAction("Index", "Login");
        }
    }
}