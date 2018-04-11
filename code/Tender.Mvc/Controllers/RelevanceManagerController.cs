using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.Mvc.Models;

namespace Tender.Mvc.Controllers
{
    public class RelevanceManagerController : BaseController
    {
        public RevelanceManagerApp App { get; set; }

        [HttpPost]
        public string Assign(string type, Guid firstId, Guid[] secIds)
        {
            try
            {
                App.Assign(type, firstId, secIds);
                Log("分配权限模块/菜单/资源", JsonHelper.Instance.Serialize(new { type = type, firstId = firstId, secIds = secIds }));
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }
        [HttpPost]
        public string UnAssign(string type, Guid firstId, Guid[] secIds)
        {
            try
            {
                App.UnAssign(type, firstId, secIds);
                Log("取消权限模块/菜单/资源", JsonHelper.Instance.Serialize(new { type = type, firstId = firstId, secIds = secIds }));
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }
    }
}