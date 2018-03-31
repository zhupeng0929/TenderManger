
using System;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.Domain;
using Tender.Mvc.Models;

namespace Tender.Mvc.Controllers
{
 public class CategoryManagerController : BaseController
    {
        public CategoryManagerApp App { get; set; }

        //
        // GET: /UserManager/
        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 加载分类下面的所有分类
        /// </summary>
        public string Load(Guid parentId, int page = 1, int rows = 30)
        {
            return JsonHelper.Instance.Serialize(App.Load(parentId, page, rows));
        }

     public string LoadForTree()
     {
         return JsonHelper.Instance.Serialize(App.LoadAll());
     }

        //添加或修改Category
        [HttpPost]
        public string Add(Category model)
        {
            try
            {
                App.AddOrUpdate(model);
                
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }
        [HttpPost]
        public string Delete(Guid[] ids)
        {
            try
            {
                App.Delete(ids);
            }
            catch (Exception e)
            {
                 Result.Status = false;
                Result.Message = e.Message;
            }

            return JsonHelper.Instance.Serialize(Result);
        }

        
    }
}