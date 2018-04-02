using System;
using System.ComponentModel;
using Dapper;

namespace TenderManger.Models
{
    /// <summary>
    /// 角色表实体
    /// </summary>
    [Table("Role")]
    public partial class RoleEntity
    {
        private Guid _id = Guid.Empty;
        private string _name = String.Empty;
        private int _status = 0;
        private int _type = 0;
        private DateTime _createTime = DateTime.Parse("1900-1-1");
        private string _createId = String.Empty;


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
        /// 角色名称
        /// </summary>
        [Description("角色名称")]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
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
        /// 角色类型
        /// </summary>
        [Description("角色类型")]
        public int Type
        {
            get { return _type; }
            set { _type = value; }
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
        public string CreateId
        {
            get { return _createId; }
            set { _createId = value; }
        }


    }
}