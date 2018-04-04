using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using TenderManger.Models;

namespace TenderManger.Mvc.Controllers
{
    public class RelevanceManagerController : BaseController
    {

        [HttpPost]
        public string Assign(string type, Guid firstId, Guid[] secIds)
        {
            try
            {
                relevanceService.AddRelevance(type, secIds.ToLookup(u => firstId));
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.SerializerObject(Result);
        }
        [HttpPost]
        public string UnAssign(string type, Guid firstId, Guid[] secIds)
        {
            try
            {
                relevanceService.DeleteBy(type, secIds.ToLookup(u => firstId));
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.SerializerObject(Result);
        }
    }
}