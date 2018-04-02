using System;
using System.ComponentModel;
using Dapper;

namespace TenderManger.Models
{
    /// <summary>
    /// 多对多关系集中映射实体
    /// </summary>
    [Table("Relevance")]
    public partial class RelevanceEntity
    {
        private Guid _id = Guid.Empty;
        private string _description = String.Empty;
        private string _key = String.Empty;
        private int _status = 0;
        private DateTime _operateTime = DateTime.Parse("1900-1-1");
        private int _operatorId = 0;
        private Guid _firstId = Guid.Empty;
        private Guid _secondId = Guid.Empty;


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
        /// 描述
        /// </summary>
        [Description("描述")]
        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        [Description("")]
        public string Key
        {
            get { return _key; }
            set { _key = value; }
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
        /// 授权时间
        /// </summary>
        [Description("授权时间")]
        public DateTime OperateTime
        {
            get { return _operateTime; }
            set { _operateTime = value; }
        }

        /// <summary>
        /// 授权人
        /// </summary>
        [Description("授权人")]
        public int OperatorId
        {
            get { return _operatorId; }
            set { _operatorId = value; }
        }

        /// <summary>
        /// 第一个表主键ID
        /// </summary>
        [Description("第一个表主键ID")]
        public Guid FirstId
        {
            get { return _firstId; }
            set { _firstId = value; }
        }

        /// <summary>
        /// 第二个表主键ID
        /// </summary>
        [Description("第二个表主键ID")]
        public Guid SecondId
        {
            get { return _secondId; }
            set { _secondId = value; }
        }


    }
}