﻿//------------------------------------------------------------------------------
// <autogenerated>
//     This code was generated by a CodeSmith Template.
//
//     DO NOT MODIFY contents of this file. Changes to this
//     file will be lost if the code is regenerated.
// </autogenerated>
//------------------------------------------------------------------------------
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Tender.Repository.Models.Mapping
{
    public partial class CategoryMap
        : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<Tender.Domain.Category>
    {
        public CategoryMap()
        {
            // table
            ToTable("Category", "dbo");

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
            Property(t => t.Status)
                .HasColumnName("Status")
                .IsRequired();
            Property(t => t.SortNo)
                .HasColumnName("SortNo")
                .IsRequired();
            Property(t => t.RootKey)
                .HasColumnName("RootKey")
                .HasMaxLength(100)
                .IsRequired();
            Property(t => t.RootName)
                .HasColumnName("RootName")
                .HasMaxLength(200)
                .IsRequired();
            Property(t => t.ParentId)
                .HasColumnName("ParentId")
                .IsOptional();

            // Relationships
        }
    }
}
