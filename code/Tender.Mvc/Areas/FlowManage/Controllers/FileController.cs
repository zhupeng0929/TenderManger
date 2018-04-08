using System;
using System.Configuration;
using System.IO;
using System.Web;
using System.Web.Mvc;
using Infrastructure;
using Tender.Mvc.Controllers;

namespace Tender.Mvc.Areas.FlowManage.Controllers
{
    public class FileController : BaseController
    {

        [HttpPost]
        public string Add(HttpPostedFileBase Filedata)
        {
            Result = Addfile(Filedata);
            return JsonHelper.Instance.Serialize(Result);

        }

       
    }
}