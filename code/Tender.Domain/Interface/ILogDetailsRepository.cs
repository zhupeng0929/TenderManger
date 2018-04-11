using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Tender.Domain.Interface
{
    public interface ILogDetailsRepository
    {
        IEnumerable<LogDetails> LoadLogDetailss(string LogLevel, string LogActionClick, string UserName, int pageindex, int pagesize);
        int GetCount(Expression<Func<LogDetails, bool>> exp = null);
    }
}
