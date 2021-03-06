using System;
using System.Web;
using System.Web.Mvc;
using Infrastructure;
using Infrastructure.Cache;
using Tender.Domain;



namespace Tender.App.SSO
{
    public class SSOAuthUtil
    {
        public static LoginResult Parse(PassportLoginRequest model)
        {
            var result = new LoginResult();
            try
            {
                model.Trim();
                
                //获取用户信息
                User userInfo = null;
                if (model.UserName == "System")
                {
                    userInfo = new User
                    {
                        Id = Guid.Empty,
                        Account = "System",
                        Name = "超级管理员",
                        Password = "E1ADC3949BA59ABBE56E057F2F883E"
                    };
                }
                else
                {
                    var usermanager = (UserManagerApp)DependencyResolver.Current.GetService(typeof(UserManagerApp));
                    userInfo = usermanager.Get(model.UserName);
                }

                if (userInfo == null)
                {
                    throw new Exception("用户不存在");
                }
                if (userInfo.Password != Md5.Encrypt(model.Password))
                {
                    throw new Exception("密码错误");
                }

                var currentSession = new UserAuthSession
                {
                    UserName = model.UserName,
                    Token = Guid.NewGuid().ToString().GetHashCode().ToString("x"),
                    AppKey = model.AppKey,
                    CreateTime = DateTime.Now,
                    IpAddress = HttpContext.Current.Request.UserHostAddress
                };

                //创建Session
                new ObjCacheProvider<UserAuthSession>().Create(currentSession.Token, currentSession, DateTime.Now.AddDays(10));

                result.Success = true;
                result.ReturnUrl = "/home/index";
                result.Token = currentSession.Token;
            }
            catch (Exception ex)
            {
                result.Success = false;
                result.ErrorMsg = ex.Message;
            }

            return result;
        }
    }
}