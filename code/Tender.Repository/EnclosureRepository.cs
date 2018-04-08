using System;
using System.Collections.Generic;
using System.Linq;
using Tender.Domain;
using Tender.Domain.Interface;

namespace Tender.Repository
{
    public class EnclosureRepository : BaseRepository<Enclosure>, IEnclosureRepository
    {


        public void Delete(Guid id)
        {
            Delete(u => u.Id == id);
        }
    }
}
