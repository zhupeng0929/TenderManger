﻿// ***********************************************************************
// Assembly         : Tender.App
// Author           : ZhuPeng
// Created          : 12-02-2015
//
// Last Modified By : ZhuPeng
// Last Modified On : 12-02-2015
// ***********************************************************************
// <copyright file="ModuleElementManagerApp.cs" company="">
//     Copyright (c) . All rights reserved.
// </copyright>
// <summary>模块元素</summary>
// ***********************************************************************

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Infrastructure;
using Tender.App.SSO;
using Tender.App.ViewModel;
using Tender.Domain;
using Tender.Domain.Interface;
using Tender.Domain.Service;

namespace Tender.App
{
    public class ModuleElementManagerApp
    {
        private ModuleEleManService _moduleEleManService;

        public ModuleElementManagerApp(ModuleEleManService moduleEleManService)
        {
            _moduleEleManService = moduleEleManService;
        }

        public void AddOrUpdate(ModuleElement model)
        {
            var newbtn = new ModuleElement();
            model.CopyTo(newbtn);
            _moduleEleManService.AddOrUpdate(newbtn);
        }

        public IEnumerable<ModuleElement> LoadByModuleId(Guid id)
        {
            string username = AuthUtil.GetUserName();
            return _moduleEleManService.LoadByModuleId(username, id);
        }

        /// <summary> 
        /// 获取带有授权状态的菜单列表
        /// </summary>
        /// <param name="accessType">授权类型，当前有RoleElement/UserElement</param>
        /// <param name="firstId">
        /// 当为RoleElement时，表示RoleId
        /// 当为UserElement时，表示UserId
        /// </param>
        /// <param name="moduleId">模块ID</param>
        public List<dynamic> LoadWithAccess(string accessType, Guid firstId, Guid moduleId)
        {
            string username = AuthUtil.GetUserName();
           return _moduleEleManService.LoadWithAccess(username, accessType, firstId, moduleId);
        }

        public void Delete(Guid[] objs)
        {
            _moduleEleManService.Delete(objs);
        }
    }
}
