using Dapper;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace TenderManger.Models
{
    /// <summary>
    /// 实体
    /// </summary>
    [Table("UserInfo")]
    public partial class UserEntity
    {
        private int _id = 0;
        private string _account = String.Empty;
        private string _password = String.Empty;
        private string _name = String.Empty;
        private int _status = 0;
        private DateTime _createTime = DateTime.Parse("1900-1-1");


        /// <summary>
        /// 
        /// </summary>
        [Key]
        [Description("")]
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        /// <summary>
        /// 账号
        /// </summary>
        [Description("账号")]
        public string Account
        {
            get { return _account; }
            set { _account = value; }
        }

        /// <summary>
        /// 密码
        /// </summary>
        [Description("密码")]
        public string Password
        {
            get { return _password; }
            set { _password = value; }
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
        /// 状态
        /// </summary>
        [Description("状态")]
        public int Status
        {
            get { return _status; }
            set { _status = value; }
        }

        /// <summary>
        /// 添加时间
        /// </summary>
        [Description("添加时间")]
        [IgnoreUpdate]
        [IgnoreInsert]
        public DateTime CreateTime
        {
            get { return _createTime; }
            set { _createTime = value; }
        }


    }
}