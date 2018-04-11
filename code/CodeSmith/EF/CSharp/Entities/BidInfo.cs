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
    public partial class BidInfo
    {
        public BidInfo()
        {
          this.TenderTitle= string.Empty;
          this.UserName= string.Empty;
          this.TenderPrice= 0;
          this.CreateDate= DateTime.Now;
          this.EndTime= DateTime.Now;
          this.State= 0;
        }

        /// <summary>
	    /// 
	    /// </summary>
        public System.Guid Id { get; set; }
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
        /// <summary>
	    /// 投标时间
	    /// </summary>
        public System.DateTime CreateDate { get; set; }
        /// <summary>
	    /// 
	    /// </summary>
        public System.DateTime EndTime { get; set; }
        /// <summary>
	    /// 投标状态，0竞标中，1中标，2未中标，3作废
	    /// </summary>
        public int State { get; set; }

    }
}