// ***********************************************************************
// Assembly         : Tender.App
// Author           : zhu.peng
// Created          : 07-08-2016
//
// Last Modified By : zhu.peng
// Last Modified On : 07-08-2016
// Contact : Microsoft
// File: AuthUtil.cs
// ***********************************************************************


using System;
using System.Configuration;
using System.Web;
using Infrastructure;
using Tender.App.ViewModel;
using Infrastructure.Cache;
using System.Web.Mvc;

namespace Tender.App.SSO
{
    /// <summary>
    /// ��������վ��¼��֤��
    /// <para>��¼ʱ��</para>
    /// <code>
    ///  var result = AuthUtil.Login(AppKey, username, password);
    ///  if (result.Success)
    ///       return Redirect("/home/index?Token=" + result.Token);
    /// </code>
    /// </summary>
    public class AuthUtil
    {
        //static HttpHelper _helper = new HttpHelper(ConfigurationManager.AppSettings["SSOPassport"]);
        private static ObjCacheProvider<UserAuthSession> _objCacheProvider = new ObjCacheProvider<UserAuthSession>();
        private AuthorizeApp _app = (AuthorizeApp)DependencyResolver.Current.GetService(typeof(AuthorizeApp));
        private static string GetToken()
        {
            string token = HttpContext.Current.Request.QueryString["Token"];
            if (!String.IsNullOrEmpty(token)) return token;

            var cookie = HttpContext.Current.Request.Cookies["Token"];
            return cookie == null ? String.Empty : cookie.Value;
        }

        public static bool CheckLogin(string token, string remark = "")
        {
            if (String.IsNullOrEmpty(token) || String.IsNullOrEmpty(GetToken()))
                return false;
            try
            {
                var value = GetStatus(token, remark);
                return value;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private static bool GetStatus(string token, string requestid = "")
        {
            if (_objCacheProvider.GetCache(token) != null)
            {
                return true;
            }

            return false;
        }

        public static string GetUserName(string token, string requestid = "")
        {
            var user = _objCacheProvider.GetCache(token);
            if (user != null)
            {
                return user.UserName;
            }

            return string.Empty;
        }
        /// <summary>
        /// ����û���¼״̬
        /// <para>ͨ��URL�е�Token������Cookie�е�Token</para>
        /// </summary>
        /// <param name="remark">��ע��Ϣ</param>
        public static bool CheckLogin(string remark = "")
        {
            return CheckLogin(GetToken(), remark);
        }

        /// <summary>
        /// ��ȡ��ǰ��¼���û���Ϣ
        /// <para>ͨ��URL�е�Token������Cookie�е�Token</para>
        /// </summary>
        /// <param name="remark">The remark.</param>
        /// <returns>LoginUserVM.</returns>
        public static UserWithAccessedCtrls GetCurrentUser(string remark = "")
        {

            try
            {
                var value = new AuthUtil().GetUser(GetToken(), remark);
                return value;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private UserWithAccessedCtrls GetUser(string token, string requestid = "")
        {
            string userName = GetUserName(token, requestid);
            if (!string.IsNullOrEmpty(userName))
            {
                return _app.GetAccessedControls(userName);
            }

            return null;
        }
        public UserWithAccessedCtrls GetUser(string userName)
        {
            if (!string.IsNullOrEmpty(userName))
            {
                return _app.GetAccessedControls(userName);
            }
            return null;
        }
        /// <summary>
        /// ��ȡ��ǰ��¼���û���
        /// <para>ͨ��URL�е�Token������Cookie�е�Token</para>
        /// </summary>
        /// <param name="remark">The remark.</param>
        /// <returns>System.String.</returns>
        public static string GetUserName(string remark = "")
        {
            //var requestUri = String.Format("/api/Check/GetUserName?token={0}&requestid={1}", GetToken(), remark);

            try
            {
                //var value = _helper.Get<string>(null, requestUri);
                var value = GetUserName(GetToken(), remark);
                return value;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// ��½�ӿ�
        /// </summary>
        /// <param name="appKey">Ӧ�ó���key.</param>
        /// <param name="username">�û���</param>
        /// <param name="pwd">����</param>
        /// <returns>System.String.</returns>
        public static LoginResult Login(string username, string pwd)
        {
            try
            {
                var request = new PassportLoginRequest()
                {
                    UserName = username,
                    Password = pwd
                };
                var result = SSOAuthUtil.Parse(request);
                return result;
            }
            catch (Exception ex)
            {
                return new LoginResult() { Success = false, ErrorMsg = ex.Message };
            }
        }

        public static bool CheckUserPowerByKey(string key)
        {
            var user = GetCurrentUser();
            return user.Resources.Exists(r => r.Key == key);
        }

        /// <summary>
        /// ע��
        /// </summary>
        public static bool Logout()
        {
            var token = GetToken();
            if (String.IsNullOrEmpty(token)) return true;

            //var requestUri = String.Format("/api/Check/Logout?token={0}&requestid={1}", token, "");

            try
            {
                //var value = _helper.Post(null, requestUri);

                //return true;
                _objCacheProvider.Remove(token);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}