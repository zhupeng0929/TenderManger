// ***********************************************************************
// Assembly         : TenderManger.Mvc
// Author           : yubaolee
// Created          : 07-11-2016
//
// Last Modified By : yubaolee
// Last Modified On : 07-19-2016
// Contact : www.cnblogs.com/yubaolee
// File: BaseController.cs
// ***********************************************************************


using TenderManger.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using TenderManger.Services;

namespace TenderManger.Mvc.Controllers
{
    [Auth]
    public class BaseController : Controller
    {
        public UserService _userService = new UserService();
    }
}