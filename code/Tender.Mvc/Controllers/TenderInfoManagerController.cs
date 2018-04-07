
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.App.ViewModel;
using Tender.Domain;

namespace Tender.Mvc.Controllers
{
    public class TenderInfoManagerController : BaseController
    {
        private TenderInfoManagerApp _app;

        public TenderInfoManagerController()
        {
            _app = AutofacExt.GetFromFac<TenderInfoManagerApp>();
        }

        //
        // GET: /UserManager/
        public ActionResult Index()
        {
            List<SelectListItem> userSelectlist = new List<SelectListItem>();
            var userList = _app.GetTenderUser();
            if (userList != null)
            {
                userList.ForEach(u => { userSelectlist.Add(new SelectListItem() { Text = u.Company, Value = u.Id.ToString() }); });
            }
            ViewBag.userSelect = userSelectlist;
            return View();
        }

        public ActionResult Add(Guid id)
        {
            return View(_app.Find(id));
        }

        //添加或修改TenderInfo
        [HttpPost]
        public string Add(TenderInfoView model)
        {
            var files = Request.Files;

            if (files != null && files.Count > 0)
            {
                for (int i = 0; i < files.Count; i++)
                {
                    var curFile = Request.Files[i];
                    if (curFile != null && curFile.ContentLength < 1)
                        continue;
                    var result = Addfile(curFile);
                    var type = curFile.ContentType.StartsWith("image") ? 0 : 1;
                    if (result.Status)
                    {
                        model.EnclosurePic.Add(new Enclosure
                        {
                            Path = result.Result,
                            Type = type
                        });
                    }

                }
            }
            try
            {
                _app.AddOrUpdate(model);

            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }

        /// <summary>
        /// 加载节点下面的所有TenderInfos
        /// </summary>
        public string Load(int page = 1, int rows = 1)
        {
            return JsonHelper.Instance.Serialize(_app.Load(page, rows));
        }


        public string Delete(Guid Id)
        {
            try
            {
                _app.Delete(Id);
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }

            return JsonHelper.Instance.Serialize(Result);
        }

        public ActionResult GetFiles(Guid id)
        {
            var list = _app.GetFiles(id);
            return View(list);
        }
        [HttpPost]
        public string DelFile(Guid id)
        {

            try
            {
                _app.DeleteFile(id);
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