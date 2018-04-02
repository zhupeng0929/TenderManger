using System;
using System.ComponentModel;
using Dapper;

namespace TenderManger.Models
{
    /// <summary>
	/// 组织表实体
	/// </summary>
	[Table("Org")]
    public partial class OrgEntity
    {
        private Guid _id = Guid.Empty;
        private string _cascadeId = String.Empty;
        private string _name = String.Empty;
        private string _hotKey = String.Empty;
        private string _parentName = String.Empty;
        private bool _isLeaf = false;
        private bool _isAutoExpand = false;
        private string _iconName = String.Empty;
        private int _status = 0;
        private int _type = 0;
        private string _bizCode = String.Empty;
        private string _customCode = String.Empty;
        private DateTime _createTime = DateTime.Parse("1900-1-1");
        private int _createId = 0;
        private int _sortNo = 0;
        private Guid _parentId = Guid.Empty;


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
        /// 节点语义ID
        /// </summary>
        [Description("节点语义ID")]
        public string CascadeId
        {
            get { return _cascadeId; }
            set { _cascadeId = value; }
        }

        /// <summary>
        /// 组织名称
        /// </summary>
        [Description("组织名称")]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
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
        /// 父节点名称
        /// </summary>
        [Description("父节点名称")]
        public string ParentName
        {
            get { return _parentName; }
            set { _parentName = value; }
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
        /// 组织类型
        /// </summary>
        [Description("组织类型")]
        public int Type
        {
            get { return _type; }
            set { _type = value; }
        }

        /// <summary>
        /// 业务对照码
        /// </summary>
        [Description("业务对照码")]
        public string BizCode
        {
            get { return _bizCode; }
            set { _bizCode = value; }
        }

        /// <summary>
        /// 自定义扩展码
        /// </summary>
        [Description("自定义扩展码")]
        public string CustomCode
        {
            get { return _customCode; }
            set { _customCode = value; }
        }

        /// <summary>
        /// 创建时间
        /// </summary>
        [Description("创建时间")]
        [IgnoreInsert]
        [IgnoreUpdate]
        public DateTime CreateTime
        {
            get { return _createTime; }
            set { _createTime = value; }
        }

        /// <summary>
        /// 创建人ID
        /// </summary>
        [Description("创建人ID")]
        public int CreateId
        {
            get { return _createId; }
            set { _createId = value; }
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