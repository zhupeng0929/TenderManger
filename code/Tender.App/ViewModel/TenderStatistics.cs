using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tender.App.ViewModel
{
    public class TenderStatistics
    {
        public TenderStatistics()
        {
            this.Title = string.Empty;
            this.Persons = 0;
            this.Price = 0;
        }
        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 投标人数
        /// </summary>
        public int Persons { get; set; }

        /// <summary>
        /// 中标金额
        /// </summary>
        public decimal Price { get; set; }
    }
}
