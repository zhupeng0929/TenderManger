using System.Reflection;
using System.Web.Mvc;
using Autofac;
using Autofac.Configuration;
using Autofac.Integration.Mvc;
using Tender.App;
using Tender.Domain.Interface;
using Tender.Domain.Service;
using Tender.Repository;

namespace Tender.UnitTest
{
    public class AutofacExt
    {
        private static IContainer _container;

        public static void InitDI()
        {
            var builder = new ContainerBuilder();

            //注册数据库基础操作和工作单元
            builder.RegisterGeneric(typeof(BaseRepository<>)).As(typeof(IRepository<>));
            builder.RegisterType(typeof(UnitWork)).As(typeof(IUnitWork));

            //注册WebConfig中的配置
            builder.RegisterModule(new ConfigurationSettingsReader("autofac"));

            //注册app层
            builder.RegisterAssemblyTypes(Assembly.GetAssembly(typeof(UserManagerApp)));

            //注册领域服务
            builder.RegisterAssemblyTypes(Assembly.GetAssembly(typeof(AuthoriseService)))
                .Where(u => u.Namespace == "Tender.Domain.Service");

            _container = builder.Build();
            DependencyResolver.SetResolver(new AutofacDependencyResolver(_container));
        }

        public static T GetFromFac<T>()
        {
            return _container.Resolve<T>();
        }
    }
}