﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a CodeSmith Template.
//
//     DO NOT MODIFY contents of this file. Changes to this
//     file will be lost if the code is regenerated.
//     Author:Yubao Li
// </autogenerated>
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
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

        public string TenderPriceDes { get { if (EndTime >= DateTime.Now) { return "***"; } else { return TenderPrice.ToString(); }; } }
        /// <summary>
	    /// 投标时间
	    /// </summary>
        public System.DateTime CreateDate { get; set; }

        /// <summary>
        /// 标书结束时间
        /// </summary>
        public DateTime EndTime { get; set; }

    }
}