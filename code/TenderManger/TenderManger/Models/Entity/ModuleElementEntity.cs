using Dapper;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace TenderManger.Models
{
    /// <summary>
	/// 模块元素表(需要权限控制的按钮)实体
	/// </summary>
	[Table("ModuleElement")]
    public partial class ModuleElementEntity
    {
        private Guid _id = Guid.Empty;
        private string _domId = String.Empty;
        private string _name = String.Empty;
        private string _type = String.Empty;
        private string _attr = String.Empty;
        private string _script = String.Empty;
        private string _icon = String.Empty;
        private string _class = String.Empty;
        private string _remark = String.Empty;
        private int _sort = 0;
        private Guid _moduleId = Guid.Empty;


        /// <summary>
        /// 流水号
        /// </summary>
        [Key]
        [Description("流水号")]
        public Guid Id
        {
            get { return _id; }
            set { _id = value; }
        }

        /// <summary>
        /// DOM ID
        /// </summary>
        [Description("DOM ID")]
        public string DomId
        {
            get { return _domId; }
            set { _domId = value; }
        }

        /// <summary>
        /// 名称
        /// </summary>
        [Description("名称")]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        /// <summary>
        /// 类型
        /// </summary>
        [Description("类型")]
        public string Type
        {
            get { return _type; }
            set { _type = value; }
        }

        /// <summary>
        /// 元素附加属性
        /// </summary>
        [Description("元素附加属性")]
        public string Attr
        {
            get { return _attr; }
            set { _attr = value; }
        }

        /// <summary>
        /// 元素调用脚本
        /// </summary>
        [Description("元素调用脚本")]
        public string Script
        {
            get { return _script; }
            set { _script = value; }
        }

        /// <summary>
        /// 元素图标
        /// </summary>
        [Description("元素图标")]
        public string Icon
        {
            get { return _icon; }
            set { _icon = value; }
        }

        /// <summary>
        /// 元素样式
        /// </summary>
        [Description("元素样式")]
        public string Class
        {
            get { return _class; }
            set { _class = value; }
        }

        /// <summary>
        /// 备注
        /// </summary>
        [Description("备注")]
        public string Remark
        {
            get { return _remark; }
            set { _remark = value; }
        }

        /// <summary>
        /// 排序字段
        /// </summary>
        [Description("排序字段")]
        public int Sort
        {
            get { return _sort; }
            set { _sort = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        [Description("")]
        public Guid ModuleId
        {
            get { return _moduleId; }
            set { _moduleId = value; }
        }
    }
}