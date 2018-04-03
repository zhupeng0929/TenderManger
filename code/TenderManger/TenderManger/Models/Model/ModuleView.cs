using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TenderManger.Models
{
    public class ModuleView
    {

        public ModuleEntity moduleEntity { get; set; }

        public bool Checked { get; set; }

        /// <summary>
        /// 模块中的元素
        /// </summary>
        public List<ModuleElementEntity> Elements = new List<ModuleElementEntity>();

        //public static implicit operator ModuleView(ModuleEntity module)
        //{
        //    return module;
        //}

        //public static implicit operator ModuleEntity(ModuleView view)
        //{
        //    return view;
        //}
    }
}