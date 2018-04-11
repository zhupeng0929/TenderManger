using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.App.SSO;
using Tender.App.ViewModel;
using Tender.Mvc.Models;

namespace Tender.Mvc.Controllers
{
    public class LogController : BaseController
    {
        public LogDetailsManagerApp App { get; set; }
        [Authenticate]
        public ActionResult Index()
        {
            
            return View();
        }
        /// <summary>
        /// 加载角色下面的所有用户
        /// </summary>
        public string Load(string LogLevel="", string LogActionClick = "", string UserName = "", int page = 1, int rows = 1)
        {
            return JsonHelper.Instance.Serialize(App.Load(LogLevel, LogActionClick, UserName, page, rows));
        }
    }
}