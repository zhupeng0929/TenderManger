using System;
using System.Collections.Generic;
using System.Linq;
using Tender.Domain;
using Tender.Domain.Interface;

namespace Tender.Repository
{
    public class TenderInfoRepository : BaseRepository<TenderInfo>, ITenderInfoRepository
    {

        public IEnumerable<TenderInfo> LoadTenderInfos(int pageindex, int pagesize)
        {
            return Context.TenderInfos.OrderBy(u => u.Id).Skip((pageindex - 1) * pagesize).Take(pagesize);
        }

        public void Delete(Guid id)
        {
            Delete(u => u.Id == id);
        }
        public Guid AddTrans(TenderInfo tenderInfo)
        {
            tenderInfo.Id = Guid.NewGuid();
            var id = Context.Set<TenderInfo>().Add(tenderInfo).Id;
            return id;
        }
        public void AddEnclosureTrans(Enclosure enclosure)
        {
            enclosure.Id = Guid.NewGuid();
            Context.Set<Enclosure>().Add(enclosure);

        }

        public void AddTrans(TenderInfo tenderInfo, List<Enclosure> list)
        {
            using (var tarans = Context.Database.BeginTransaction())
            {
                try
                {
                    var id = AddTrans(tenderInfo);
                    if (list != null)
                    {
                        list.ForEach(e =>
                        {
                            e.RelationId = id;
                            AddEnclosureTrans(e);
                        });

                    }
                    Context.SaveChanges();
                    tarans.Commit();
                }
                catch (Exception ex)
                {
                    tarans.Rollback();
                    throw new Exception("ÃÌº” ß∞‹");
                }
            }
        }
    }
}
