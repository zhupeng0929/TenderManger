using Tender.App.ViewModel;
using Tender.Domain;
using Tender.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using Infrastructure;

namespace Tender.App
{
    public class TenderUserManagerApp
    {
        private IUserRepository _userRepository;
        private IOrgRepository _orgRepository;
        private IRelevanceRepository _relevanceRepository;
        private ITenderUserRepository _repository;
        public TenderUserManagerApp(IUserRepository userRepository,
            IOrgRepository orgRepository,
            IRelevanceRepository relevanceRepository,
            ITenderUserRepository tenderUserRepository)

        {
            _repository = tenderUserRepository;
            _userRepository = userRepository;
            _orgRepository = orgRepository;
            _relevanceRepository = relevanceRepository;
        }
        /// <summary>
        /// 加载一个部门及子部门全部用户
        /// </summary>
        public GridData Load(int pageindex, int pagesize)
        {
            if (pageindex < 1) pageindex = 1;  //TODO:如果列表为空新增加一个用户后，前端会传一个0过来，奇怪？？
            IEnumerable<TenderUser> tendetusers = new List<TenderUser>();
            int records = 0;
            tendetusers = _repository.Find(pageindex, pagesize, "id");
            records = _repository.GetCount();
            var userviews = new List<TenderUserView>();

            foreach (var user in tendetusers)
            {
                TenderUserView uv = AutoMapperExt.MapTo<TenderUserView>(user);
                var baseuser = _userRepository.FindSingle(u => u.Id == user.Id);
                if (baseuser == null)
                {
                    continue;
                }
                uv.Account = baseuser.Account;
                userviews.Add(uv);
            }



            return new GridData
            {
                records = records,
                total = (int)Math.Ceiling((double)records / pagesize),
                rows = userviews,
                page = pageindex
            };
        }
        public void AddOrUpdate(TenderUser view)
        {
            if (view.Id == Guid.Empty)
                throw new Exception("请关联用户");

            if (_repository.IsExist(u => u.Id == view.Id))//更新
            {
                _repository.Update(view);
            }
            else//添加
            {

                _repository.Addentity(view);
            }
        }
        public List<User> LoadAll()
        {
            var tenderuser = _repository.Find(null).Select(u=>u.Id).ToList();
            return _userRepository.Find(u=>!tenderuser.Contains(u.Id)).ToList();
        }

        public void Delete(Guid[] ids)
        {
            _repository.Delete(u => ids.Contains(u.Id));
        }
    }

}