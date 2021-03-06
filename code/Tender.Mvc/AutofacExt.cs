﻿
// ***********************************************************************
// <copyright file="AutofacExt.cs" company="/zhu.peng">
//     Copyright (c) /zhu.peng. All rights reserved.
// </copyright>
// <summary>IOC扩展</summary>
// ***********************************************************************

using Autofac;
using Autofac.Configuration;
using Autofac.Integration.Mvc;
using Tender.App;
using System.Reflection;
using System.Web.Mvc;
using Tender.Domain.Interface;
using Tender.Domain.Service;
using Tender.Repository;

namespace Tender.Mvc
{
    public static  class AutofacExt
    {
        private static IContainer _container;

        public static void InitAutofac()
        {
            var builder = new ContainerBuilder();

            //注册数据库基础操作和工作单元
            builder.RegisterGeneric(typeof(BaseRepository<>)).As(typeof(IRepository<>));
            builder.RegisterType(typeof (UnitWork)).As(typeof (IUnitWork));

            //注册app层
            builder.RegisterAssemblyTypes(Assembly.GetAssembly(typeof (UserManagerApp)));

            //注册领域服务
            builder.RegisterAssemblyTypes(Assembly.GetAssembly(typeof(AuthoriseService)))
                .Where(u =>u.Namespace== "Tender.Domain.Service" 
                || u.Namespace == "Tender.Domain.Interface");

            //注册Repository
            builder.RegisterAssemblyTypes(Assembly.GetAssembly(typeof(UserRepository)))
                .AsImplementedInterfaces();

            // 注册controller，使用属性注入
            builder.RegisterControllers(Assembly.GetExecutingAssembly()).PropertiesAutowired();
            
            builder.RegisterModelBinders(Assembly.GetExecutingAssembly());
            builder.RegisterModelBinderProvider();

            // OPTIONAL: Register web abstractions like HttpContextBase.
            builder.RegisterModule<AutofacWebTypesModule>();

            // OPTIONAL: Enable property injection in view pages.
            builder.RegisterSource(new ViewRegistrationSource());

            // 注册所有的Attribute
            builder.RegisterFilterProvider();

            // Set the dependency resolver to be Autofac.
            _container = builder.Build();
            DependencyResolver.SetResolver(new AutofacDependencyResolver(_container));
        }

        /// <summary>
        /// 从容器中获取对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        public static T GetFromFac<T>()
        {
            return _container.Resolve<T>();
            //   return (T)DependencyResolver.Current.GetService(typeof(T));
        }
    }
}