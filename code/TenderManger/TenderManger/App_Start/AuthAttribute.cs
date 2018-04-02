using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TenderManger;
using TenderManger.Models;


namespace TenderManger
{
    public class AuthAttribute : ActionFilterAttribute
    {
        /// <summary> 
        /// 验证权限
        /// </summary> 
        /// <param name="filterContext"></param> 
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            UserEntity userLogin = GetUserInfo(filterContext);

            if (userLogin == null || userLogin.Id == Guid.Empty)
            {
                string returnUrl = filterContext.HttpContext.Request.Url.PathAndQuery;

                filterContext.Result = LoginResult();
                return;
            }

            //TODO:暂时去除页面权限验证
            //if (string.IsNullOrEmpty(Code)) return;

            //LogHelper.WriteCommonLog("SSOLogin", "GetUserInfo", JsonHelper.SerializerObject(userLogin), EnumState.LogLevel.Info);

            //List<MenuInfo> menuList = UserInfoService.GetUserMenu(userLogin.UserId_Common.ToString());
            //if (menuList == null || !menuList.ExistOneSubMenuModel(Code))
            //    filterContext.Result = new ContentResult() { Content = "无访问此页面权限！" };

        }
        private UserEntity GetUserInfo(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Session[CommonHelper.SessionUserKey] != null)
                return filterContext.HttpContext.Session[CommonHelper.SessionUserKey] as UserEntity;

            return GetUser(filterContext);
        }
        private UserEntity GetUser(ActionExecutingContext filterContext)
        {
            string key = CommonHelper.Md5(CommonHelper.COOKIE_KEY_USERINFO);
            string data = CookieHelper.GetCookieValue(key);
            if (!string.IsNullOrEmpty(data))
            {
                try
                {
                    data = CommonHelper.DesDecrypt(data, CommonHelper.COOKIE_KEY_ENCRYPT);
                    var userInfo = JsonHelper.Deserialize<UserEntity>(data);
                    filterContext.HttpContext.Session[CommonHelper.SessionUserKey] = userInfo;
                    return userInfo;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
            return null;
        }

        public virtual ActionResult LoginResult()
        {
            return new RedirectResult("/Login/index");
        }
    }
}