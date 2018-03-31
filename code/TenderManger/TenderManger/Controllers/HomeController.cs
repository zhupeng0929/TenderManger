using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;


namespace TenderManger.Mvc.Controllers
{
    public class HomeController : BaseController
    {

        public ActionResult Index()
        {
            //ViewBag.NavBar = GetNavBar();
            return View();
        }

    }
}