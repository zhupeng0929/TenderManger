﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a CodeSmith Template.
//
//     DO NOT MODIFY contents of this file. Changes to this
//     file will be lost if the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------

using Tender.Domain;

namespace Tender.Repository.Models.Mapping
{
    public partial class OrgMap
        : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<Org>
    {
        public OrgMap()
        {
            // table
            ToTable("Org", "dbo");

            // keys
            HasKey(t => t.Id);

            // Properties
            Property(t => t.Id)
                .HasColumnName("Id")
                .IsRequired();
            Property(t => t.CascadeId)
                .HasColumnName("CascadeId")
                .HasMaxLength(255)
                .IsRequired();
            Property(t => t.Name)
                .HasColumnName("Name")
                .HasMaxLength(255)
                .IsRequired();
            Property(t => t.HotKey)
                .HasColumnName("HotKey")
                .HasMaxLength(255)
                .IsRequired();
            Property(t => t.ParentName)
                .HasColumnName("ParentName")
                .HasMaxLength(255)
                .IsRequired();
            Property(t => t.IsLeaf)
                .HasColumnName("IsLeaf")
                .IsRequired();
            Property(t => t.IsAutoExpand)
                .HasColumnName("IsAutoExpand")
                .IsRequired();
            Property(t => t.IconName)
                .HasColumnName("IconName")
                .HasMaxLength(255)
                .IsRequired();
            Property(t => t.Status)
                .HasColumnName("Status")
                .IsRequired();
            Property(t => t.Type)
                .HasColumnName("Type")
                .IsRequired();
            Property(t => t.BizCode)
                .HasColumnName("BizCode")
                .HasMaxLength(255)
                .IsRequired();
            Property(t => t.CustomCode)
                .HasColumnName("CustomCode")
                .HasMaxLength(4000)
                .IsRequired();
            Property(t => t.CreateTime)
                .HasColumnName("CreateTime")
                .IsRequired();
            Property(t => t.CreateId)
                .HasColumnName("CreateId")
                .IsRequired();
            Property(t => t.SortNo)
                .HasColumnName("SortNo")
                .IsRequired();
            Property(t => t.ParentId)
                .HasColumnName("ParentId")
                .IsOptional();

            // Relationships
        }
    }
}
