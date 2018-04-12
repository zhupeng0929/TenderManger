﻿using Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tender.App.SSO;
using Tender.Mvc.Controllers;

namespace Tender.Mvc.Areas.Api.Controllers
{
    public class TenderInfoController : BaseController
    {
        // GET: Api/TenderInfo
        public string GetTenderList()
        {
            var user = AuthUtil.GetCurrentUser();
            var list = user.TenderInfos;
            Result.Result = list;
            return JsonHelper.Instance.Serialize(Result);
        }
    }
}