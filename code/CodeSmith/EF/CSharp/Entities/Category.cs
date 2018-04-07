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
	/// 分类表
	/// </summary>
    public partial class Category
    {
        public Category()
        {
          this.CascadeId= string.Empty;
          this.Name= string.Empty;
          this.Status= 0;
          this.SortNo= 0;
          this.RootKey= string.Empty;
          this.RootName= string.Empty;
        }

        /// <summary>
	    /// 分类表ID
	    /// </summary>
        public System.Guid Id { get; set; }
        /// <summary>
	    /// 节点语义ID
	    /// </summary>
        public string CascadeId { get; set; }
        /// <summary>
	    /// 名称
	    /// </summary>
        public string Name { get; set; }
        /// <summary>
	    /// 当前状态
	    /// </summary>
        public int Status { get; set; }
        /// <summary>
	    /// 排序号
	    /// </summary>
        public int SortNo { get; set; }
        /// <summary>
	    /// 分类所属科目
	    /// </summary>
        public string RootKey { get; set; }
        /// <summary>
	    /// 分类所属科目名称
	    /// </summary>
        public string RootName { get; set; }
        /// <summary>
	    /// 父节点流水号
	    /// </summary>
        public System.Guid? ParentId { get; set; }

    }
}