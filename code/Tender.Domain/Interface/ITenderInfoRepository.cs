using System;
using System.Collections.Generic;
using System.Linq;

namespace Tender.Domain.Interface
{
    public interface ITenderInfoRepository : IRepository<TenderInfo>
    {
        IEnumerable<TenderInfo> LoadTenderInfos(Guid userid, int pageindex, int pagesize);


        void Delete(Guid id);
        void AddTrans(TenderInfo tenderInfo, List<Enclosure> list, List<Guid> tenderuser);
    }
}