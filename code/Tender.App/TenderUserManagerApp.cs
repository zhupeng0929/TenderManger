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

        
    }
}