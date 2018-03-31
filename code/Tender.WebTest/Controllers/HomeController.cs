using System.Configuration;
using System.Web.Mvc;
using Tender.App;
using Tender.App.SSO;

namespace Tender.WebTest.Controllers
{
    public class HomeController :Controller
    {

        [SSOAuth]
        public ActionResult Index()
        {
            var currentUser = AuthUtil.GetCurrentUser();
            ViewBag.CurrentUser = currentUser;
            return View();
        }

        /// <summary>
        /// 跳转到后台管理页面
        /// </summary>
        public ActionResult Admin()
        {
            return Redirect(ConfigurationManager.AppSettings["TenderURL"] + "?token=" + Request.Cookies["Token"].Value);
        }
       
    }
}