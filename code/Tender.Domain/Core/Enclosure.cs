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
using System.Text;

namespace Tender.Domain
{
    /// <summary>
	/// 
	/// </summary>
    public partial class Enclosure : Entity
    {
        public Enclosure()
        {
            this.Path = string.Empty;
            this.Type = 0;
        }
        private string _path = string.Empty;
        /// <summary>
	    /// 关联id
	    /// </summary>
        public System.Guid RelationId { get; set; }
        /// <summary>
	    /// 附件路径
	    /// </summary>
        public string Path
        {
            get { return _path; }
            set { _path =  value; }
        }
        /// <summary>
	    /// 附件类型0图片，1视频
	    /// </summary>
        public int Type { get; set; }

    }
}