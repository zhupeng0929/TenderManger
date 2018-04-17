﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a CodeSmith Template.
//
//     DO NOT MODIFY contents of this file. Changes to this
//     file will be lost if the code is regenerated.
//     Author:ZhuPeng
// </autogenerated>
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Tender.Domain
{
    /// <summary>
	/// 
	/// </summary>
    public partial class TenderInfo : Entity
    {
        public TenderInfo()
        {
            this.Title = string.Empty;
            this.Description = string.Empty;
            this.StartTime = DateTime.Now;
            this.EndTime = DateTime.Now;
            this.Cycle = string.Empty;
            this.State = 0;
            this.FirstUser = string.Empty;
            this.SecondUser = string.Empty;
            this.CreateDate = DateTime.Now;
            this.CreateUser = Guid.Empty;
            
        }
        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
	    /// 描述
	    /// </summary>
        public string Description { get; set; }
        /// <summary>
	    /// 开始时间
	    /// </summary>
        public System.DateTime StartTime { get; set; }
        /// <summary>
	    /// 结束时间
	    /// </summary>
        public System.DateTime EndTime { get; set; }
        /// <summary>
	    /// 提货周期
	    /// </summary>
        public string Cycle { get; set; }
        /// <summary>
	    /// 0未开标，1已开标，2已截止，3已结束，4已流标，5已作废
	    /// </summary>
        public int State { get; set; }
        [NotMapped]
        public string StateDes
        {
            get
            {
                switch (State)
                {
                    case 0: return "未开标";
                    case 1: return "已开标";
                    case 2: return "已截止";
                    case 3: return "已结束";
                    case 4: return "已流标";
                    case 5: return "已作废";
                    default: return "无效";
                };
            }
        }
        /// <summary>
	    /// 第一开标人
	    /// </summary>
        public string FirstUser { get; set; }
        /// <summary>
	    /// 第二开标人
	    /// </summary>
        public string SecondUser { get; set; }
        /// <summary>
	    /// 添加时间
	    /// </summary>
        public System.DateTime CreateDate { get; set; }

        /// <summary>
        /// 创建人
        /// </summary>
        public Guid CreateUser { get; set; }

    }
}