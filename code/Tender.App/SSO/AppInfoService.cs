using System;
using System.Linq;
using Infrastructure.Cache;

namespace Tender.App.SSO
{
    public class AppInfoService : CacheProvider
    {
        //public AppInfo Get(string appKey)
        //{
        //    //可以从数据库读取
        //    return _applist.SingleOrDefault(u => u.AppKey == appKey);
        //}

        //private AppInfo[] _applist = new[]
        //{
        //    new AppInfo
        //    {
        //        AppKey = "Tender",
        //        Icon = "/Areas/SSO/Content/images/logo.png",
        //        IsEnable = true,
        //        Remark = "基于DDDLite的权限管理系统",
        //        ReturnUrl = "http://localhost:56813",
        //        Title = "Tender.Net",
        //        CreateTime = DateTime.Now,
        //    },
        //    new AppInfo
        //    {
        //        AppKey = "Tendertest",
        //        Icon = "/Areas/SSO/Content/images/logo.png",
        //        IsEnable = true,
        //        Remark = "这只是个模拟的测试站点",
        //        ReturnUrl = "http://localhost:53050",
        //        Title = "Tender.Net测试站点",
        //        CreateTime = DateTime.Now,
        //    }
        //};
    }
}