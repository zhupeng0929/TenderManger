﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a CodeSmith Template.
//
//     DO NOT MODIFY contents of this file. Changes to this
//     file will be lost if the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------

using System.Data.Entity;
using Tender.Domain;
using Tender.Repository.Models.Mapping;

namespace Tender.Repository.Models
{
    public partial class TenderDBContext: DbContext
    {
        static  TenderDBContext()
        {
            Database.SetInitializer<TenderDBContext>(null);
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

        public System.Data.Entity.DbSet<User> Users { get; set; }

        public System.Data.Entity.DbSet<TenderUser> TenderUsers { get; set; }
        public System.Data.Entity.DbSet<TenderInfo> TenderInfos { get; set; }
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
            modelBuilder.Configurations.Add(new UserMap());
            modelBuilder.Configurations.Add(new TenderUserMap());
            
            modelBuilder.Entity<TenderInfo>().Ignore(p => p.StateDes);
            modelBuilder.Configurations.Add(new TenderInfoMap());
        }
    }
}