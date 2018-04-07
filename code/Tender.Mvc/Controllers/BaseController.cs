// ***********************************************************************
// Assembly         : Tender.Mvc
// Author           : zhu.peng
// Created          : 07-11-2016
//
// Last Modified By : zhu.peng
// Last Modified On : 07-19-2016
// Contact : www.cnblogs.com/zhu.peng
// File: BaseController.cs
// ***********************************************************************


using Tender.Mvc.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Infrastructure;
using Tender.App.SSO;
using Tender.App.ViewModel;
using Tender.App;
using System.IO;

namespace Tender.Mvc.Controllers
{
    /// <summary>
    /// 基础控制器
    /// <para>用于控制登录用户是否有权限访问指定的Action</para>
    /// <para>李玉宝新增于2016-07-19 11:12:09</para>
    /// </summary>
    public class BaseController : SSOController
    {
        protected Response Result = new Response();
        protected ModuleView CurrentModule;
        protected string Controllername;   //当前控制器小写名称
        protected string Actionname;        //当前Action小写名称
        private AuthorizeApp _app;
        public BaseController()
        {
            _app = AutofacExt.GetFromFac<AuthorizeApp>();
        }
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);

            if (!AuthUtil.CheckLogin()) return;

            Controllername = Request.RequestContext.RouteData.Values["controller"].ToString().ToLower();
            Actionname = filterContext.ActionDescriptor.ActionName.ToLower();

            var function = this.GetType().GetMethods().FirstOrDefault(u => u.Name.ToLower() == Actionname);
            if (function == null)
                throw new Exception("未能找到Action");

            var authorize = function.GetCustomAttribute(typeof(AuthenticateAttribute));
            CurrentModule = AuthUtil.GetCurrentUser().Modules.FirstOrDefault(u => u.Url.ToLower().Contains(Controllername));
            //当前登录用户没有Action记录&&Action有authenticate标识
            if (authorize != null && CurrentModule == null)
            {
                filterContext.Result = new RedirectResult("/Login/Index");
                return;
            }

            var version = ConfigurationManager.AppSettings["version"];
            if (version == "demo" && Request.HttpMethod == "POST")
            {
                throw new HttpException(400, "演示版本，不能进行该操作，当前模块:" + Controllername + "/" + Actionname);
            }

        }

        protected Response Addfile(HttpPostedFileBase Filedata)
        {
            if (Filedata != null && Filedata.ContentLength > 0 && Filedata.ContentLength < 10485760)
            {
                using (var binaryReader = new BinaryReader(Filedata.InputStream))
                {
                    var fileName = Path.GetFileName(Filedata.FileName);
                    var data = binaryReader.ReadBytes(Filedata.ContentLength);
                    var result = UploadFile(fileName, data, string.Empty);
                    Result.Result = result;
                }
            }
            else
            {
                Result.Message = "文件过大";
                Result.Status = false;
            }
            return Result;
        }

        private string UploadFile(string fileName, byte[] fileBuffers, string folder)
        {
            if (string.IsNullOrEmpty(folder))
            {
                folder = DateTime.Now.ToString("yyyyMMdd");
            }

            //判断文件是否为空
            if (string.IsNullOrEmpty(fileName))
            {
                throw new Exception("文件名不能为空");
            }

            //判断文件是否为空
            if (fileBuffers.Length < 1)
            {
                throw new Exception("文件不能为空");
            }


            var filePath = Server.MapPath("~/uploadfile");
            var uploadPath = filePath + "\\" + folder + "\\";
            var ext = Path.GetExtension(fileName);
            var newName = Guid.NewGuid().ToString("N") + ext;

            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            using (var fs = new FileStream(uploadPath + newName, FileMode.Create))
            {
                fs.Write(fileBuffers, 0, fileBuffers.Length);
                fs.Close();
                return "/uploadfile/" + folder + "/" + newName;
            }

        }
        //public UserWithAccessedCtrls GetUser(string token, string requestid = "")
        //{
        //    string userName = AuthUtil.GetUserName(token, requestid);
        //    if (!string.IsNullOrEmpty(userName))
        //    {
        //        return _app.GetAccessedControls(userName);
        //    }

        //    return null;
        //}
    }
}