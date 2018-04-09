
using Tender.Domain;
using Tender.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using Tender.App.ViewModel;
using Infrastructure;
using System.IO;
using Tender.App.SSO;

namespace Tender.App
{
    public class TenderInfoManagerApp
    {
        private ITenderInfoRepository _repository;
        private ITenderUserRepository _renderUserRepository;
        private IEnclosureRepository _enclosureRepository;
        private IRelevanceRepository _relevanceRepository;
        public TenderInfoManagerApp(ITenderInfoRepository repository,
            ITenderUserRepository renderUserRepository,
            IEnclosureRepository enclosureRepository, IRelevanceRepository relevanceRepository)
        {
            _repository = repository;
            _renderUserRepository = renderUserRepository;
            _enclosureRepository = enclosureRepository;
            _relevanceRepository = relevanceRepository;
        }
        public GridData Load(Guid userid, int pageindex, int pagesize)
        {
            if (pageindex < 1) pageindex = 1;  //TODO:如果列表为空新增加一个用户后，前端会传一个0过来，奇怪？？
            IEnumerable<TenderInfo> tenderinfos = new List<TenderInfo>();
            int records = 0;
            if (userid == Guid.Empty)
            {
                tenderinfos = _repository.Find(pageindex, pagesize);
            }
            else
            {
                tenderinfos = _repository.LoadTenderInfos(userid, pageindex, pagesize);
            }

            records = _repository.GetCount();
            var infoviews = new List<TenderInfoView>();

            foreach (var info in tenderinfos)
            {
                TenderInfoView uv = AutoMapperExt.MapTo<TenderInfoView>(info);
                uv.SelectUser = JsonHelper.Instance.Serialize(GetRelevace(uv.Id));
                infoviews.Add(uv);
            }



            return new GridData
            {
                records = records,
                total = (int)Math.Ceiling((double)records / pagesize),
                rows = infoviews,
                page = pageindex
            };
        }
        public List<TenderInfo> LoadAll()
        {
            return _repository.Find(null).ToList();
        }

        public List<Enclosure> GetFiles(Guid id)
        {
            return _enclosureRepository.Find(e => e.RelationId == id).ToList();
        }



        public TenderInfo Find(Guid id)
        {
            var tenderinfo = _repository.FindSingle(u => u.Id == id);
            if (tenderinfo == null) return new TenderInfo();

            return tenderinfo;
        }

        public void Delete(Guid[] ids)
        {
            _repository.Delete(u => ids.Contains(u.Id));
        }

        public void DeleteFile(Guid id)
        {
            var file = _enclosureRepository.FindSingle(f => f.Id == id);
            try { File.Delete(System.AppDomain.CurrentDomain.BaseDirectory + file.Path); }
            catch
            {

            }
            _enclosureRepository.Delete(id);
        }


        public void AddOrUpdate(TenderInfoView model)
        {

            if (model.Id == Guid.Empty)
            {
                var userid = AuthUtil.GetCurrentUser().User.Id;
                model.CreateUser = userid;
                AddTrans(model);
            }
            else
            {
                _repository.Update(model.CopyTo<TenderInfo>());
                if (model.EnclosurePic != null)
                {
                    model.EnclosurePic.ForEach(e => e.RelationId = model.Id);
                    _enclosureRepository.BatchAdd(model.EnclosurePic.ToArray());
                }
                _relevanceRepository.Delete(t => t.FirstId == model.Id);
                if (model.TenderUser != null)
                {
                    model.TenderUser.ForEach(t =>
                        {
                            _relevanceRepository.Add(new Relevance() { FirstId = model.Id, SecondId = t, Key = "TenderUser" });
                        });
                }
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="tenderInfoView"></param>
        public void AddTrans(TenderInfoView tenderInfoView)
        {
            _repository.AddTrans(tenderInfoView.CopyTo<TenderInfo>(), tenderInfoView.EnclosurePic, tenderInfoView.TenderUser);
        }

        public List<TenderUser> GetTenderUser()
        {
            return _renderUserRepository.Find(u => u.Id != Guid.Empty).ToList();
        }

        public List<SelectItem> GetRelevace(Guid id)
        {
            var result = new List<SelectItem>();
            var relevance = _relevanceRepository.Find(r => r.FirstId == id && r.Key == "TenderUser").ToList();
            var userList = GetTenderUser();
            if (userList != null)
            {
                userList.ForEach(u =>
                {
                    result.Add(new SelectItem() { label = u.Company, title = u.Company, value = u.Id.ToString(), selected = relevance.Exists(t => t.SecondId == u.Id) });
                });
            }
            return result;
        }

        public void PublishTender(Guid id)
        {
            _repository.Update(u => u.Id == id, u => new TenderInfo() { State = 1 });
            //todo
            //发送短信等通知

        }
    }
}