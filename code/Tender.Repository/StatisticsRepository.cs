using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tender.Domain.Core;
using Tender.Repository.Models;

namespace Tender.Repository
{
    public class StatisticsRepository
    {
        protected TenderDBContext Context = new TenderDBContext();

        public List<TenderStatistics> GetTenderStatistics()
        {
            var strSql = @"select ti.Title,COUNT(*) Persons,SUM(case when bi.[State]=1 then bi.TenderPrice else 0 end)Price from [dbo].[TenderInfo] ti(nolock) inner join [dbo].[BidInfo] bi with(nolock)
on ti.Id = bi.TenderId
where ti.[State]<>3
group by ti.Title";

            var result = Context.Database.SqlQuery<TenderStatistics>(strSql).ToList();
            try
            {
                Context.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                throw new Exception(e.EntityValidationErrors.First().ValidationErrors.First().ErrorMessage);
            }
            return result;

        }
    }
}
