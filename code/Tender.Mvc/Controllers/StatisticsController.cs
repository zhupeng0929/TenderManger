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
    public class StatisticsController : BaseController
    {
        public TenderStatisticsService App { get; set; }
        public ActionResult Index()
        {
            
            return View();
        }
        /// <summary>
        /// 加载角色下面的所有用户
        /// </summary>
        public string Load()
        {
            return JsonHelper.Instance.Serialize(App.Load(orgId, pageCurrent, pageSize));
        }
    }
}