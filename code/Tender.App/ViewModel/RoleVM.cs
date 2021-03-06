﻿// ***********************************************************************
// Assembly         : Tender.App
// Author           : zhu.peng
// Created          : 11-29-2015
//
// Last Modified By : zhu.peng
// Last Modified On : 11-29-2015
// ***********************************************************************
// <copyright file="RoleVM.cs" company="/zhu.peng">
//     Copyright (c) /zhu.peng. All rights reserved.
// </copyright>
// <summary>角色模型视图</summary>
// ***********************************************************************

using System;
using Infrastructure;
using Tender.Domain;

namespace Tender.App.ViewModel
{
    public partial class RoleVM
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        /// <returns></returns>
        public Guid Id { get; set; }

        /// <summary>
        /// 名称
        /// </summary>
        /// <returns></returns>
        public string Name { get; set; }

        /// <summary>
        /// 当前状态
        /// </summary>
        public int Status { get; set; }
        /// <summary>
	    /// 角色类型
	    /// </summary>
        public int Type { get; set; }


        /// <summary>
        /// 所属组织名称，多个可用，分隔
        /// </summary>
        public string Organizations { get; set; }

        /// <summary>
        /// 所属组织ID，多个可用，分隔
        /// </summary>
        public string OrganizationIds { get; set; }

        /// <summary>
        ///是否属于某用户 
        /// </summary>
        public bool Checked { get; set; }

        public static implicit operator RoleVM(Role role)
        {
            return role.MapTo<RoleVM>();
        }

        public static implicit operator Role(RoleVM rolevm)
        {
            return rolevm.MapTo<Role>();
        }

    }
}
