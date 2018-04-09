using System;
using System.Collections.Generic;
using System.Linq;
using Tender.Domain;
using Tender.Domain.Interface;

namespace Tender.Repository
{
    public class BidInfoRepository : BaseRepository<BidInfo>, IBidInfoRepository
    {

        public IEnumerable<BidInfo> LoadBidInfos(int pageindex, int pagesize)
        {
            return Context.BidInfos.OrderBy(u => u.Id).Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        public IEnumerable<BidInfo> LoadByTenderid(Guid tenderid, int pageindex, int pagesize)
        {
            return Context.BidInfos.Where(b => b.TenderId == tenderid).OrderBy(u => u.Id).Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        public int GetBidInfoCntByTenderid(Guid tenderid)
        {
            return Context.BidInfos.Count(b => b.TenderId == tenderid);
        }
        public void Delete(Guid id)
        {
            Delete(u => u.Id == id);
        }

        public void UpdateBidinfoState(Guid tenderid, Guid bidinfoid)
        {
            using (var tarans = Context.Database.BeginTransaction())
            {
                try
                {
                    Update(b => b.TenderId == tenderid && b.Id == bidinfoid, b => new BidInfo { State = 1 });//跟新为中标
                    Update(b => b.TenderId == tenderid && b.Id != bidinfoid, b => new BidInfo { State = 1 });//其他所有人更新成未中标
                    Context.SaveChanges();
                    tarans.Commit();
                }
                catch (Exception ex)
                {
                    tarans.Rollback();
                    throw new Exception("发布失败");
                }
            }
        }
    }
}
