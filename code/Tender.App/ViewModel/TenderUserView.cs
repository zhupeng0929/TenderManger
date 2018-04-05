using Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tender.Domain;

namespace Tender.App.ViewModel
{
   public class TenderUserView:TenderUser
    {
        /// <summary>
        /// </summary>
        /// <returns></returns>
        public string Account { get; set; }
        
    }
}
