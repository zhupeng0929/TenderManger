using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tender.Domain
{
    public partial class TenderUser : Entity
    {
        public TenderUser()
        {
            Id = Guid.Empty;
            Name = String.Empty;
            Company = String.Empty;
            ContactPerson = String.Empty;
            ContactNum = String.Empty;
            BusinessLicense = String.Empty;
            CashDeposit = 0;
        }

        /// <summary>
        /// 名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 公司名称，发票抬头
        /// </summary>
        public string Company { get; set; }

        /// <summary>
        /// 联系人
        /// </summary>
        public string ContactPerson { get; set; }

        /// <summary>
        /// 联系方式
        /// </summary>
        public string ContactNum { get; set; }

        /// <summary>
        /// 营业执照
        /// </summary>
        public string BusinessLicense { get; set; }
        public string psth
        {
            get
            {
                return "upload/" + BusinessLicense;
            }
        }
        /// <summary>
        /// 保证金
        /// </summary>
        public decimal CashDeposit { get; set; }
    }
}
