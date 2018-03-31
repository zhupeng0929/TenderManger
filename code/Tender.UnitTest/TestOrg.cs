using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Tender.App;
using Tender.App.ViewModel;
using Tender.Domain;

namespace Tender.UnitTest
{
    [TestClass]
    public class TestOrg : TestBase
    {
        private OrgManagerApp _app;

        public TestOrg()
        {
            _app = AutofacExt.GetFromFac<OrgManagerApp>();
        }


        [TestMethod]
        public void Add()
        {
            try
            {
                for (int i = 0; i < 2; i++)
                {
                    var random = new Random();
                    int val = random.Next();
                    _app.AddOrUpdate(new Org
                    {
                        Id = Guid.Empty,
                        Name = "test" + val,
                        CreateTime = DateTime.Now,
                        ParentId = null,
                        ParentName = "",
                        SortNo = 1
                    });
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}
