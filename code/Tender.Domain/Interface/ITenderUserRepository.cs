using System;
using System.Collections.Generic;
using System.Linq;

namespace Tender.Domain.Interface
{
    public interface ITenderUserRepository : IRepository<TenderUser>
    {
        //IEnumerable<TenderUser> LoadTendeUsers(int pageindex, int pagesize);
        void Addentity(TenderUser entity);
    }
}
