
using Tender.Domain;
using Tender.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using Tender.App.ViewModel;
using Tender.App.SSO;

namespace Tender.App
{
    public class BidInfoManagerApp
    {
        private IBidInfoRepository _repository;
        private ITenderInfoRepository _tenderInfoRepository;

        public BidInfoManagerApp(IBidInfoRepository repository,
            ITenderInfoRepository tenderInfoRepository)
        {
            _repository = repository;
            _tenderInfoRepository = tenderInfoRepository;
        }


        public List<BidInfo> LoadAll()
        {
            return _repository.Find(null).ToList();
        }

        public List<TenderInfo> LoadTenderInfoList(Guid userid)
        {
            if (userid == Guid.Empty)
            {
                return _tenderInfoRepository.Find(null).ToList();
            }
            else
            {
                return _tenderInfoRepository.Find(r => r.CreateUser == userid).ToList();
            }
        }


        /// <summary>
        /// 加载一个节点下面的一个或全部BidInfos
        /// </summary>
        public GridData Load(Guid tenderid, int pageindex, int pagesize)
        {
            List<BidInfo> BidInfos;
            int records = 0;
            if (tenderid == Guid.Empty)
            {
                if (AuthUtil.CheckUserPowerByKey("LOOK"))
                {
                    BidInfos = _repository.LoadBidInfos(pageindex, pagesize).ToList();
                    records = _repository.GetCount();
                }
                else
                {
                    BidInfos = new List<BidInfo>();
                    records = 0;
                }
            }
            else
            {
                BidInfos = _repository.LoadByTenderid(tenderid, pageindex, pagesize).ToList();
                records = _repository.GetBidInfoCntByTenderid(tenderid);
            }
            //BidInfos.ForEach(b =>
            //{
            //    if (b.EndTime >= DateTime.Now)//标书未结束，
            //    {
            //        b.TenderPriceDes = "***";
            //    }
            //    else
            //    {
            //        b.TenderPriceDes = b.TenderPrice.ToString();
            //    }
            //});
            return new GridData
            {
                records = records,
                total = (int)Math.Ceiling((double)records / pagesize),
                rows = BidInfos,
                page = pageindex
            };
        }

        ///// <summary>
        ///// 获取当前节点的所有下级节点
        ///// </summary>
        //private int[] GetSubOrgIds(int orgId)
        //{
        //    var org = _orgRepository.FindSingle(u => u.Id == orgId);
        //    var orgs = _orgRepository.Find(u => u.CascadeId.Contains(org.CascadeId)).Select(u => u.Id).ToArray();
        //    return orgs;
        //}

        public BidInfo Find(Guid id)
        {
            var bidinfo = _repository.FindSingle(u => u.Id == id);
            if (bidinfo == null) return new BidInfo();

            return bidinfo;
        }

        public void Delete(Guid id)
        {
            _repository.Delete(id);
        }
        /// <summary>
        /// 发布中标
        /// </summary>
        /// <param name="tenderid">标书id</param>
        /// <param name="bidinfoid">竞标id</param>
        public void UpdateBidinfoState(Guid tenderid, Guid bidinfoid)
        {
            _repository.UpdateBidinfoState(tenderid, bidinfoid);
        }

        public void AddOrUpdate(BidInfo model)
        {
            //BidInfo bidinfo = new BidInfo();
            //model.CopyTo(bidinfo);

            //if (model.Id == Guid.Empty)
            //{
            //    _repository.Add(model);
            //}
            //else
            //{
            //    _repository.Update(model);
            //}
            _repository.Update(b => b.Id, model);
        }


    }
}
