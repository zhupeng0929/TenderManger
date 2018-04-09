using System;
using System.Collections.Generic;
using System.Linq;
using Tender.Domain;
using Tender.Domain.Interface;

namespace Tender.Repository
{
    public class TenderInfoRepository : BaseRepository<TenderInfo>, ITenderInfoRepository
    {

        public IEnumerable<TenderInfo> LoadTenderInfos(Guid userid, int pageindex, int pagesize)
        {
            return Context.TenderInfos.Where(u => u.CreateUser == userid).OrderBy(u => u.Id).Skip((pageindex - 1) * pagesize).Take(pagesize);
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

        public void AddTenderUser(Guid tenderid, List<Guid> tenderuser)
        {
            if (tenderuser != null & tenderid != Guid.Empty)
            {
                tenderuser.ForEach(t =>
                {
                    Context.Set<Relevance>().Add(new Relevance() { FirstId = tenderid, SecondId = t, Key = "TenderUser" });
                });
            }
        }
        //public void UpdataTenderUser(Guid tenderid, List<Guid> tenderuser)
        //{
        //    using (var tarans = Context.Database.BeginTransaction())
        //    {
        //        try
        //        {
        //            Delete(t => tenderuser.Contains(t.Id));
        //            Add
        //        }
        //        catch
        //        {

        //        }
        //    }
        //}

        public void AddTrans(TenderInfo tenderInfo, List<Enclosure> list, List<Guid> tenderuser)
        {
            using (var tarans = Context.Database.BeginTransaction())
            {
                try
                {
                    var id = AddTrans(tenderInfo);//添加基本标书信息
                    if (list != null)
                    {
                        list.ForEach(e =>
                        {
                            e.RelationId = id;
                            AddEnclosureTrans(e);
                        });//添加附件

                    }
                    AddTenderUser(id, tenderuser);//添加参与投标人
                    Context.SaveChanges();
                    tarans.Commit();
                }
                catch (Exception ex)
                {
                    tarans.Rollback();
                    throw new Exception("添加失败");
                }
            }
        }
    }
}
