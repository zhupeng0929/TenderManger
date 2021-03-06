﻿
using System;
using System.Web.Mvc;
using Infrastructure;
using Tender.App;
using Tender.Domain;
using Tender.App.SSO;
using System.Collections.Generic;
using Tender.Mvc.Models;

namespace Tender.Mvc.Controllers
{
    public class BidInfoManagerController : BaseController
    {
        private BidInfoManagerApp App;

        public BidInfoManagerController()
        {
            App = AutofacExt.GetFromFac<BidInfoManagerApp>();
        }

        //
        // GET: /UserManager/
        [Authenticate]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(Guid id)
        {
            return View(App.Find(id));
        }

        //添加或修改BidInfo
        [HttpPost]
        public string Add(BidInfo model)
        {
            try
            {
                App.AddOrUpdate(model);

            }
            catch (Exception ex)
            {
                Result.Status = false;
                Result.Result = ex.Message;
            }
            return JsonHelper.Instance.Serialize(Result);
        }

        /// <summary>
        /// 加载节点下面的所有BidInfos
        /// </summary>
        public string Load(Guid parentId, int page = 1, int rows = 10)
        {
            return JsonHelper.Instance.Serialize(App.Load(parentId, page, rows));
        }

        public string LoadForTree()
        {
            var models = new List<TenderInfo>();
            if (AuthUtil.CheckUserPowerByKey("LOOK"))
            {
                models = App.LoadTenderInfoList(Guid.Empty);
                models.ForEach(t => t.Title += "【" + t.StateDes + "】");
                //添加根节点
                models.Insert(0, new TenderInfo
                {
                    Id = Guid.Empty,
                    Title = "查看所有",
                });
            }
            else
            {


                models = App.LoadTenderInfoList(BaseUserInfo.User.Id);
                models.ForEach(t => t.Title += "【" + t.StateDes + "】");
            }
            
            return JsonHelper.Instance.Serialize(models);
        }

        //public string Delete(Guid Id)
        //{
        //    try
        //    {
        //        App.Delete(Id);
        //    }
        //    catch (Exception ex)
        //    {
        //        Result.Status = false;
        //        Result.Result = ex.Message;
        //    }

        //    return JsonHelper.Instance.Serialize(Result);
        //}
        /// <summary>
        /// 发布中标
        /// </summary>
        /// <param name="tenderid"></param>
        /// <param name="bidinfoid"></param>
        /// <returns></returns>
        [HttpPost]
       public string UpdateBidinfoState(Guid tenderid, Guid bidinfoid)
        {
            try
            {
                App.UpdateBidinfoState(tenderid, bidinfoid);
                Log("发布中标", JsonHelper.Instance.Serialize(bidinfoid));
            }
            catch
            {
                Result.Status = false;
                Result.Message = "发布失败！";
            }
            return JsonHelper.Instance.Serialize(Result);
        }
    }
}