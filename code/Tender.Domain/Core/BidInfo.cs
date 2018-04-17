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
    public partial class BidInfo : Entity
    {
        public BidInfo()
        {
            this.TenderTitle = string.Empty;
            this.UserName = string.Empty;
            this.TenderPrice = 0;
            this.CreateDate = DateTime.Now;
            this.EndTime = DateTime.Now;
            this.State = 0;
        }

        /// <summary>
	    /// 标书id
	    /// </summary>
        public System.Guid TenderId { get; set; }
        /// <summary>
	    /// 标书标题
	    /// </summary>
        public string TenderTitle { get; set; }
        /// <summary>
	    /// 投标人id
	    /// </summary>
        public System.Guid UserId { get; set; }
        /// <summary>
	    /// 投标人名称
	    /// </summary>
        public string UserName { get; set; }
        /// <summary>
	    /// 投标金额
	    /// </summary>
        public decimal TenderPrice { get; set; }

        public string TenderPriceDes { get { if (State == 0 || State == 3) { return "***"; } else { return TenderPrice.ToString(); }; } }
        /// <summary>
	    /// 投标时间
	    /// </summary>
        public System.DateTime CreateDate { get; set; }

        /// <summary>
        /// 标书结束时间
        /// </summary>
        public DateTime EndTime { get; set; }
        /// <summary>
        /// 投标状态，0竞标中，1中标，2未中标，4已流标，5已作废
        /// </summary>
        public int State { get; set; }
        /// <summary>
        /// 投标状态，0竞标中，1中标，2未中标，4已流标，5已作废
        /// </summary>
        [NotMapped]
        public string StateDes
        {
            get
            {
                switch (State)
                {
                    case 0: return "竞标中";
                    case 1: return "中标";
                    case 2: return "未中标";
                    case 3: return "待公布";
                    case 4: return "已流标";
                    case 5: return "已作废";
                    default: return "未知";
                }
            }
        }
    }
}