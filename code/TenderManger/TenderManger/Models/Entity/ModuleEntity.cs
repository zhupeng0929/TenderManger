using System;
using System.ComponentModel;
using Dapper;

namespace TenderManger.Models
{
    /// <summary>
	/// 功能模块表实体
	/// </summary>
	[Table("Module")]
    public partial class ModuleEntity
    {
        private Guid _id = Guid.Empty;
        private string _cascadeId = String.Empty;
        private string _name = String.Empty;
        private string _url = String.Empty;
        private string _hotKey = String.Empty;
        private bool _isLeaf = false;
        private bool _isAutoExpand = false;
        private string _iconName = String.Empty;
        private int _status = 0;
        private string _parentName = String.Empty;
        private string _vector = String.Empty;
        private int _sortNo = 0;
        private Guid _parentId = Guid.Empty;


        /// <summary>
        /// 功能模块流水号
        /// </summary>
        [Key]
        [Description("功能模块流水号")]
        public Guid Id
        {
            get { return _id; }
            set { _id = value; }
        }

        /// <summary>
        /// 节点语义ID
        /// </summary>
        [Description("节点语义ID")]
        public string CascadeId
        {
            get { return _cascadeId; }
            set { _cascadeId = value; }
        }

        /// <summary>
        /// 功能模块名称
        /// </summary>
        [Description("功能模块名称")]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        /// <summary>
        /// 主页面URL
        /// </summary>
        [Description("主页面URL")]
        public string Url
        {
            get { return _url; }
            set { _url = value; }
        }

        /// <summary>
        /// 热键
        /// </summary>
        [Description("热键")]
        public string HotKey
        {
            get { return _hotKey; }
            set { _hotKey = value; }
        }

        /// <summary>
        /// 是否叶子节点
        /// </summary>
        [Description("是否叶子节点")]
        public bool IsLeaf
        {
            get { return _isLeaf; }
            set { _isLeaf = value; }
        }

        /// <summary>
        /// 是否自动展开
        /// </summary>
        [Description("是否自动展开")]
        public bool IsAutoExpand
        {
            get { return _isAutoExpand; }
            set { _isAutoExpand = value; }
        }

        /// <summary>
        /// 节点图标文件名称
        /// </summary>
        [Description("节点图标文件名称")]
        public string IconName
        {
            get { return _iconName; }
            set { _iconName = value; }
        }

        /// <summary>
        /// 当前状态
        /// </summary>
        [Description("当前状态")]
        public int Status
        {
            get { return _status; }
            set { _status = value; }
        }

        /// <summary>
        /// 父节点名称
        /// </summary>
        [Description("父节点名称")]
        public string ParentName
        {
            get { return _parentName; }
            set { _parentName = value; }
        }

        /// <summary>
        /// 矢量图标
        /// </summary>
        [Description("矢量图标")]
        public string Vector
        {
            get { return _vector; }
            set { _vector = value; }
        }

        /// <summary>
        /// 排序号
        /// </summary>
        [Description("排序号")]
        public int SortNo
        {
            get { return _sortNo; }
            set { _sortNo = value; }
        }

        /// <summary>
        /// 父节点流水号
        /// </summary>
        [Description("父节点流水号")]
        public Guid ParentId
        {
            get { return _parentId; }
            set { _parentId = value; }
        }


    }
}