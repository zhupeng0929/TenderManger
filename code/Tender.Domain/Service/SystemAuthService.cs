﻿// ***********************************************************************
// Assembly         : Tender.Domain
// Author           : zhu.peng
// Created          : 04-21-2016
//
// Last Modified By : zhu.peng
// Last Modified On : 04-21-2016
// Contact : Microsoft
// File: AuthenService.cs
// ***********************************************************************

using Tender.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Tender.Domain.Service
{
    /// <summary>
    /// 领域服务
    /// <para>超级管理员权限</para>
    /// </summary>
    public class SystemAuthService : AuthoriseService
    {
        public SystemAuthService(IUnitWork unitWork):base(unitWork)
        {
            _user = new User { Account = "System", Id = Guid.Empty, Name = "System管理员" };
        }

       

        public override IQueryable<Org> GetOrgsQuery()
        {
            return _unitWork.Find<Org>(null);
        }

        public override IQueryable<Resource> GetResourcesQuery()
        {
            return _unitWork.Find<Resource>(null);
        }

        public override IQueryable<ModuleElement> GetModuleElementsQuery()
        {
            return _unitWork.Find<ModuleElement>(null);
        }

        public override IQueryable<Module> GetModulesQuery()
        {
            return _unitWork.Find<Module>(null);
        }

        public override IQueryable<Role> GetRolesQuery()
        {
            //用户角色
            return _unitWork.Find<Role>(null);
        }
    }
}