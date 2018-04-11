
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.App.ViewModel;
using Tender.Domain;
using Tender.App.SSO;
using Tender.Mvc.Models;

namespace Tender.Mvc.Controllers
{
    public class TenderInfoManagerController : BaseController
    {
        public TenderInfoManagerApp _app { get; set; }
       
        //
        // GET: /UserManager/
        [Authenticate]
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
            if (model.State == 1)
            {
                Result.Status = false;
                Result.Message = "已开标禁止修改";
            }
            else
            {
                try
                {
                    _app.AddOrUpdate(model);
                    Log("添加或修改投标客户信息", JsonHelper.Instance.Serialize(model));
                }
                catch (Exception ex)
                {
                    Result.Status = false;
                    Result.Message = ex.Message;
                }
            }

            return JsonHelper.Instance.Serialize(Result);
        }

        /// <summary>
        /// 加载节点下面的所有TenderInfos
        /// </summary>
        public string Load(int page = 1, int rows = 1)
        {
            if (AuthUtil.CheckUserPowerByKey("LOOK"))
            {
                return JsonHelper.Instance.Serialize(_app.Load(Guid.Empty, page, rows));
            }
            else
            {
                return JsonHelper.Instance.Serialize(_app.Load(BaseUserInfo.User.Id, page, rows));
            }

        }
        /// <summary>
        /// 批量删除投标客户信息
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        public string Delete(Guid[] ids)
        {
            try
            {
                _app.Delete(ids);
                Log("批量删除投标单信息", JsonHelper.Instance.Serialize(ids));
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
        /// <summary>
        /// 删除附件
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public string DelFile(Guid id)
        {

            try
            {
                _app.DeleteFile(id);
                Log("删除附件", JsonHelper.Instance.Serialize(id));
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }

            return JsonHelper.Instance.Serialize(Result);
        }
        /// <summary>
        /// 发布招标
        /// </summary>
        /// <param name="id"></param>
        /// <param name="account"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpPost]
        public string PublishTender(Guid id, string account, string password)
        {
            if (account != BaseUserInfo.User.Account)
            {
                try
                {
                    _app.PublishTender(id, account, password);
                    Log("发布招标", JsonHelper.Instance.Serialize(new { id = id, account = account }));
                }
                catch (Exception ex)
                {
                    Result.Status = false;
                    Result.Message = ex.Message;
                }
            }
            else
            {
                Result.Status = false;
                Result.Message = "该账号已登录请更换！";
            }


            return JsonHelper.Instance.Serialize(Result);
        }
        /// <summary>
        /// 作废招标
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public string InvalidTender(Guid id)
        {
            try
            {
                _app.InvalidTender(id);
                Log("作废招标", JsonHelper.Instance.Serialize(id));
            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Message = ex.Message;
            }

            return JsonHelper.Instance.Serialize(Result);
        }

        [HttpPost]
        public string CheckDate(Guid id)
        {
            var tenderinfo = _app.Find(id);
            if (tenderinfo.EndTime >= DateTime.Now)//未截止招标
            {
                Result.Status = false;
                Result.Message = "招标未截止前无法发布中标人！";
            }
            if (tenderinfo.State == 0)//未截止招标
            {
                Result.Status = false;
                Result.Message = "暂未开标";
            }
            if (tenderinfo.State > 1)//未截止招标
            {
                Result.Status = false;
                Result.Message = "该标书已结束或已作废！";
            }
            return JsonHelper.Instance.Serialize(Result);
        }
    }
}