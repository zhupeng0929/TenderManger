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
            tendetusers=_repository.Find(pageindex, pagesize, "id");
            records = _repository.GetCount();
            var userviews = new List<UserView>();
            

            return new GridData
            {
                records = records,
                total = (int)Math.Ceiling((double)records / pagesize),
                rows = tendetusers,
                page = pageindex
            };
        }

    }
}