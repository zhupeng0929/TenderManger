using System;
using System.Collections.Generic;
using System.Web.Mvc;
using TenderManger.Models;

namespace TenderManger.Mvc.Controllers
{
    public class UserManagerController : BaseController
    {
       
        public ActionResult Index()
        {
            return View();
        }

        //添加或修改组织
        [HttpPost]
        public string Add(UserView view)
        {
            try
            {
                _userService.AddOrUpdate(view);
                
            }
            catch (Exception ex)
            {
                 Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.SerializerObject(Result);
        }

        /// <summary>
        /// 加载组织下面的所有用户
        /// </summary>
        public string Load(Guid orgId, int page = 1, int rows = 30)
        {
            return JsonHelper.SerializerObject(_userService.Load(orgId, page, rows));
        }

        [HttpPost]
        public string Delete(Guid[] ids)
        {
            try
            {
                _userService.Delete(ids);
            }
            catch (Exception e)
            {
                 Result.Status = false;
                Result.Message = e.Message;
            }

            return JsonHelper.SerializerObject(Result);
        }

        #region 获取权限数据

        /// <summary>
        /// 获取用户可访问的账号
        /// <para>李玉宝于2017-02-28 15:12:19</para>
        /// </summary>
        public string GetAccessedUsers()
        {
            IEnumerable<UserView> users = _userService.Load(Guid.Empty, 1, 10).rows;
            var result = new Dictionary<string , object>();
            foreach (var user in users)
            {
                var item = new
                {
                    Account = user.Account,
                    RealName = user.Name,
                    id = user.Id.ToString(),
                    text = user.Name,
                    value = user.Account,
                    parentId = "0",
                    showcheck = true,
                    img = "fa fa-user",
                };
                result.Add(user.Id.ToString(), item);
            }

            return JsonHelper.SerializerObject(result);
        }
        #endregion
    }
}