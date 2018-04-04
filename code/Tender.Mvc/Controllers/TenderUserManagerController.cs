﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.App.ViewModel;
using Tender.Mvc.Models;

namespace Tender.Mvc.Controllers
{
    public class TenderUserManagerController : BaseController
    {
        public TenderUserManagerApp App { get; set; }

        //
        // GET: /UserManager/
        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }

        public string Load(int pageCurrent = 1, int pageSize = 30)
        {
            var list = App.Load(pageCurrent, pageSize);
            return JsonHelper.Instance.Serialize(list);
        }

    }
}