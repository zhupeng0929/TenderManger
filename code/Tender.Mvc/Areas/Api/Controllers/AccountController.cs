using System;
using System.Linq;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.App.SSO;
using Tender.Domain;
using Tender.Mvc.Controllers;

namespace Tender.Mvc.Areas.Api.Controllers
{

    public class AccountController : Controller
    {
        [HttpPost]
        public string Login(string username, string password)
        {
            var resp = new Response();
            try
            {
                var result = AuthUtil.Login(username, password);
                resp.Status = result.Success;
                if (result.Success)
                {
                    resp.Result = result.Token;
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
        [HttpPost]
        public string CheckLogin()
        {
            var resp = new Response();
            var token = Request.Headers["Token"];
            try
            {
                
                if (AuthUtil.CheckLogin(token,""))
                {
                    resp.Status = true;
                   
                }
                else
                {
                    resp.Status = false;
                }
            }
            catch (Exception e)
            {
                resp.Status = false;
                resp.Message = e.Message;
            }
            return JsonHelper.Instance.Serialize(resp);
        }

        public bool Logout()
        {
            return AuthUtil.Logout();
        }

    }
}
