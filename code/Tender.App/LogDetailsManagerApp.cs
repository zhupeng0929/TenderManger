
using Tender.Domain;
using Tender.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using Tender.App.ViewModel;

namespace Tender.App
{
    public class LogDetailsManagerApp
    {
        private ILogDetailsRepository _repository;
        public LogDetailsManagerApp(ILogDetailsRepository repository)
        {
            _repository = repository;

        }
        /// <summary>
        /// 加载一个节点下面的一个或全部LogDetailss
        /// </summary>
        public dynamic Load(string LogLevel, string LogActionClick, string UserName, int pageindex, int pagesize)
        {
            IEnumerable<LogDetails> LogDetailss;
            int total = 0;

            LogDetailss = _repository.LoadLogDetailss(LogLevel, LogActionClick, UserName,pageindex, pagesize);
            total = _repository.GetCount();
            return new GridData
            {
                records = total,
                total = (int)Math.Ceiling((double)total / pagesize),
                rows = LogDetailss,
                page = pageindex
            };
        }

    }
}
