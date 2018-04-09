using System;
using System.Collections.Generic;
using System.Linq;

namespace Tender.Domain.Interface
{
    public interface IBidInfoRepository : IRepository<BidInfo>
    {
        IEnumerable<BidInfo> LoadBidInfos(int pageindex, int pagesize);

        IEnumerable<BidInfo> LoadByTenderid(Guid tenderid, int pageindex, int pagesize);
        int GetBidInfoCntByTenderid(Guid tenderid);

        void Delete(Guid id);

        void UpdateBidinfoState(Guid tenderid, Guid bidinfoid);

    }
}