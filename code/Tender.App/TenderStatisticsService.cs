using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tender.App.ViewModel;
using Tender.Domain.Interface;

namespace Tender.App
{

    public class TenderStatisticsService
    {
        private IBidInfoRepository _bidInfoRepository;
        private ITenderInfoRepository _tenderInforepository;
        public TenderStatisticsService(ITenderInfoRepository repository,
            IBidInfoRepository bidInfoRepository)
        {
            _tenderInforepository = repository;
            _bidInfoRepository = bidInfoRepository;
        }

        public List<TenderStatistics> GetTenderStatistics()
        {
            var tenderInfo = _tenderInforepository.Find(t => t.State != 3).ToList();
            var bid = _bidInfoRepository.Find(b => b.State != 3).ToList();
            var result = new List<TenderStatistics>();
            tenderInfo.ForEach(t =>
            {
                result.Add(new TenderStatistics() { Title = t.Title, Persons = bid.Count(b => b.TenderId == t.Id), Price = bid.Where(b => b.TenderId == t.Id && b.State == 1).Sum(b => b.TenderPrice) });
            });
            result.Add(new TenderStatistics() { Title = "总计:", Persons = result.Sum(t => t.Persons), Price = result.Sum(t => t.Price) });

            return result;
        }
    }
}
