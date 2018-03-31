using System;
using System.Configuration;
using System.Web.Mvc;
using TenderManger.Models;
using TenderManger.Services;

namespace TenderManger.Mvc.Controllers
{
    public class LoginController : Controller
    {
        public UserService _userService = new UserService();
        // GET: Login
        public ActionResult Index()
        {
            
            return View();
        }

        [HttpPost]
        public ActionResult Index(string username, string password)
        {
            UserEntity loginUserInfo = new UserEntity { Name = username, Password = password };

            if (!ModelState.IsValid)
            {
                return View(loginUserInfo);
            }

            var userInfo = UserLogin(loginUserInfo.Name, loginUserInfo.Password);
            if (userInfo != null)
            {
                //写入cookie
                string key = CommonHelper.Md5(CommonHelper.COOKIE_KEY_USERINFO);
                string data = JsonHelper.Serializer<UserEntity>(userInfo);

                CookieHelper.SetCookie(key, CommonHelper.DesEncrypt(data, CommonHelper.COOKIE_KEY_ENCRYPT));
                Session[CommonHelper.SessionUserKey] = userInfo;

                return Request["ReturnUrl"] == null ? Redirect("~") : Redirect(Request["ReturnUrl"]);
            }

            return View(userInfo);
        }

        private UserEntity UserLogin(string userName, string password)
        {
            var user = _userService.GetUser(userName);
            if (user != null && user.Password == CommonHelper.Md5(password))
            {
                return user;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 退出
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            Session[CommonHelper.SessionUserKey] = null;
            CookieHelper.ClearCookie(CommonHelper.Md5(CommonHelper.COOKIE_KEY_USERINFO));
            return RedirectToAction("Login");
        }
    }
}