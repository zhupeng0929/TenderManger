
using Tender.Domain;
using Tender.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using Tender.App.ViewModel;
using Infrastructure;
using System.IO;

namespace Tender.App
{
    public class TenderInfoManagerApp
    {
        private ITenderInfoRepository _repository;
        private ITenderUserRepository _renderUserRepository;
        private IEnclosureRepository _enclosureRepository;
        public TenderInfoManagerApp(ITenderInfoRepository repository,
            ITenderUserRepository renderUserRepository,
            IEnclosureRepository enclosureRepository)
        {
            _repository = repository;
            _renderUserRepository = renderUserRepository;
            _enclosureRepository = enclosureRepository;
        }
        public GridData Load(int pageindex, int pagesize)
        {
            if (pageindex < 1) pageindex = 1;  //TODO:如果列表为空新增加一个用户后，前端会传一个0过来，奇怪？？
            IEnumerable<TenderInfo> tenderinfos = new List<TenderInfo>();
            int records = 0;
            tenderinfos = _repository.Find(pageindex, pagesize, "id");
            records = _repository.GetCount();
            var infoviews = new List<TenderInfoView>();

            foreach (var info in tenderinfos)
            {
                TenderInfoView uv = AutoMapperExt.MapTo<TenderInfoView>(info);

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

        public void Delete(Guid id)
        {
            _repository.Delete(id);
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
            //TenderInfo tenderinfo  = new  TenderInfo();
            //model.CopyTo(tenderinfo);

            if (model.Id == Guid.Empty)
            {
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
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="tenderInfoView"></param>
        public void AddTrans(TenderInfoView tenderInfoView)
        {
            _repository.AddTrans(tenderInfoView.CopyTo<TenderInfo>(), tenderInfoView.EnclosurePic);
        }

        public List<TenderUser> GetTenderUser()
        {
            return _renderUserRepository.Find(u => u.Id != Guid.Empty).ToList();
        }
    }
}