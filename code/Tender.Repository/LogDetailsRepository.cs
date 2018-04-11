using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Tender.Domain;
using Tender.Domain.Interface;
using Tender.Repository.Models;

namespace Tender.Repository
{
    public class LogDetailsRepository : ILogDetailsRepository
    {
        protected TenderDBContext Context = new TenderDBContext();
        public IEnumerable<LogDetails> LoadLogDetailss(string LogLevel, string LogActionClick, string UserName, int pageindex, int pagesize)
        {
            if (!string.IsNullOrWhiteSpace(LogLevel))
            {
                return Context.LogDetails.Where(l => l.LogLevel == LogLevel).OrderBy(u => u.LogID).Skip((pageindex - 1) * pagesize).Take(pagesize);
            }
            if (!string.IsNullOrWhiteSpace(LogActionClick))
            {
                return Context.LogDetails.Where(l => l.LogActionClick == LogActionClick).OrderBy(u => u.LogID).Skip((pageindex - 1) * pagesize).Take(pagesize);
            }
            if (!string.IsNullOrWhiteSpace(UserName))
            {
                return Context.LogDetails.Where(l => l.UserName == UserName).OrderBy(u => u.LogID).Skip((pageindex - 1) * pagesize).Take(pagesize);
            }
            return Context.LogDetails.OrderBy(u => u.LogID).Skip((pageindex - 1) * pagesize).Take(pagesize);
        }

        /// <summary>
        /// 根据过滤条件获取记录数
        /// </summary>
        public int GetCount(Expression<Func<LogDetails, bool>> exp = null)
        {
            return Filter(exp).Count();
        }
        private IQueryable<LogDetails> Filter(Expression<Func<LogDetails, bool>> exp)
        {
            var dbSet = Context.Set<LogDetails>().AsQueryable();
            if (exp != null)
                dbSet = dbSet.Where(exp);
            return dbSet;
        }
    }
}
