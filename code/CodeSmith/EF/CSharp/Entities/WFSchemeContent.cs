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
    public partial class WFSchemeContent
    {
        public WFSchemeContent()
        {
          this.SchemeVersion= string.Empty;
          this.SchemeContent= string.Empty;
          this.CreateDate= DateTime.Now;
          this.CreateUserId= string.Empty;
          this.CreateUserName= string.Empty;
        }

        /// <summary>
	    /// 
	    /// </summary>
        public System.Guid Id { get; set; }
        /// <summary>
	    /// 
	    /// </summary>
        public System.Guid SchemeInfoId { get; set; }
        /// <summary>
	    /// 
	    /// </summary>
        public string SchemeVersion { get; set; }
        /// <summary>
	    /// 
	    /// </summary>
        public string SchemeContent { get; set; }
        /// <summary>
	    /// 
	    /// </summary>
        public System.DateTime CreateDate { get; set; }
        /// <summary>
	    /// 
	    /// </summary>
        public string CreateUserId { get; set; }
        /// <summary>
	    /// 
	    /// </summary>
        public string CreateUserName { get; set; }

    }
}