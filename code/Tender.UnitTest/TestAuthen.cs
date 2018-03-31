using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Tender.Domain.Service;
using Tender.Repository;

namespace Tender.UnitTest
{
    /// <summary>
    /// 测试用户授权服务
    /// </summary>
    [TestClass]
    public class TestAuthen
    {
        [TestMethod]
        public void TestMethod1()
        {
            AuthoriseFactory factory = new AuthoriseFactory(new UnitWork() );
            var service=  factory.Create("System");

            var orgs = service.Orgs;
        }
    }
}
