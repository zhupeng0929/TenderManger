using System;
using System.Collections.Generic;
using System.Linq;

namespace Tender.Domain.Interface
{
    public interface IEnclosureRepository : IRepository<Enclosure>
    {
        
        void Delete(Guid id);

    }
}