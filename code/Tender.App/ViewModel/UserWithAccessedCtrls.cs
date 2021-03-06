﻿
using System.Collections.Generic;
using Infrastructure;
using Tender.Domain;


namespace Tender.App.ViewModel
{
    /// <summary>
    ///  视图模型
    /// <para>包括用户及用户可访问的机构/资源/模块</para>
    /// </summary>
    public class UserWithAccessedCtrls 
    {
        public User User { get; set; }
        /// <summary>
        /// 用户可以访问到的模块（包括所属角色与自己的所有模块）
        /// </summary>
        public List<ModuleView> Modules { get; set; }

        public IEnumerable<TreeItem<ModuleView>> ModuleWithChildren { get; set; }
        //用户可以访问的资源
        public List<Resource> Resources { get; set; }

        /// <summary>
        ///  用户所属机构
        /// </summary>
        public List<Org> Orgs { get; set; }


        public List<Role> Roles { get; set; }

        public List<TenderInfo> TenderInfos { get; set; }

        public List<BidInfo> BidInfos { get; set; }
    }

}
