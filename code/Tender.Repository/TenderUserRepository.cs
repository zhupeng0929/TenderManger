using Tender.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Transactions;
using EntityFramework.Extensions;
using Tender.Domain;

namespace Tender.Repository
{
    public class TenderUserRepository : BaseRepository<TenderUser>, ITenderUserRepository
    {
    }
}
