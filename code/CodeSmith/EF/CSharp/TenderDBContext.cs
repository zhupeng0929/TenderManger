﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a CodeSmith Template.
//
//     DO NOT MODIFY contents of this file. Changes to this
//     file will be lost if the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------
using System;
using System.Data.Entity;
using System.Collections.Generic;
using Tender.Domain;
using Tender.Repository.Models.Mapping;

namespace Tender.Repository.Models
{
    public partial class TenderDBContext: DbContext
    {
        static  TenderDBContext()
        {
            Database.SetInitializer< TenderDBContext>(null);
        }
        public TenderDBContext()
            :base("Name=TenderDBContext")
        { }

        public TenderDBContext(string nameOrConnectionString)
            : base(nameOrConnectionString)
        { }

        public System.Data.Entity.DbSet<BidInfo> BidInfos { get; set; }
        public System.Data.Entity.DbSet<Category> Categories { get; set; }
        public System.Data.Entity.DbSet<DicDetail> DicDetails { get; set; }
        public System.Data.Entity.DbSet<DicIndex> DicIndices { get; set; }
        public System.Data.Entity.DbSet<Enclosure> Enclosures { get; set; }
        public System.Data.Entity.DbSet<LogDetails> LogDetails { get; set; }
        public System.Data.Entity.DbSet<Module> Modules { get; set; }
        public System.Data.Entity.DbSet<ModuleElement> ModuleElements { get; set; }
        public System.Data.Entity.DbSet<Org> Orgs { get; set; }
        public System.Data.Entity.DbSet<Relevance> Relevances { get; set; }
        public System.Data.Entity.DbSet<Resource> Resources { get; set; }
        public System.Data.Entity.DbSet<Role> Roles { get; set; }
        public System.Data.Entity.DbSet<Stock> Stocks { get; set; }
        public System.Data.Entity.DbSet<TenderInfo> TenderInfos { get; set; }
        public System.Data.Entity.DbSet<TenderUser> TenderUsers { get; set; }
        public System.Data.Entity.DbSet<User> Users { get; set; }
        public System.Data.Entity.DbSet<WFFrmMain> WFFrmMains { get; set; }
        public System.Data.Entity.DbSet<WFProcessInstance> WFProcessInstances { get; set; }
        public System.Data.Entity.DbSet<WFProcessOperationHistory> WFProcessOperationHistories { get; set; }
        public System.Data.Entity.DbSet<WFProcessScheme> WFProcessSchemes { get; set; }
        public System.Data.Entity.DbSet<WFProcessTransitionHistory> WFProcessTransitionHistories { get; set; }
        public System.Data.Entity.DbSet<WFSchemeContent> WFSchemeContents { get; set; }
        public System.Data.Entity.DbSet<WFSchemeInfo> WFSchemeInfos { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new BidInfoMap());
            modelBuilder.Configurations.Add(new CategoryMap());
            modelBuilder.Configurations.Add(new DicDetailMap());
            modelBuilder.Configurations.Add(new DicIndexMap());
            modelBuilder.Configurations.Add(new EnclosureMap());
            modelBuilder.Configurations.Add(new LogDetailsMap());
            modelBuilder.Configurations.Add(new ModuleMap());
            modelBuilder.Configurations.Add(new ModuleElementMap());
            modelBuilder.Configurations.Add(new OrgMap());
            modelBuilder.Configurations.Add(new RelevanceMap());
            modelBuilder.Configurations.Add(new ResourceMap());
            modelBuilder.Configurations.Add(new RoleMap());
            modelBuilder.Configurations.Add(new StockMap());
            modelBuilder.Configurations.Add(new TenderInfoMap());
            modelBuilder.Configurations.Add(new TenderUserMap());
            modelBuilder.Configurations.Add(new UserMap());
            modelBuilder.Configurations.Add(new WFFrmMainMap());
            modelBuilder.Configurations.Add(new WFProcessInstanceMap());
            modelBuilder.Configurations.Add(new WFProcessOperationHistoryMap());
            modelBuilder.Configurations.Add(new WFProcessSchemeMap());
            modelBuilder.Configurations.Add(new WFProcessTransitionHistoryMap());
            modelBuilder.Configurations.Add(new WFSchemeContentMap());
            modelBuilder.Configurations.Add(new WFSchemeInfoMap());

            InitializeMapping(modelBuilder);
        }
    }
}