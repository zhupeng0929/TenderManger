using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TenderManger.Models
{
    public class TreeItem<T>
    {
        public T Item { get; set; }
        public IEnumerable<TreeItem<T>> Children { get; set; }
    }
    /// <summary>
    /// jqGrid的返回值
    /// </summary>
    public class GridData
    {
        /// <summary>
        /// 页码
        /// </summary>
        public int page;
        /// <summary>
        /// 总页数
        /// </summary>
        public int total;
        /// <summary>
        /// 总记录条数
        /// </summary>
        public int records;

        /// <summary>
        /// 数据内容
        /// </summary>
        public dynamic rows;
    }
}