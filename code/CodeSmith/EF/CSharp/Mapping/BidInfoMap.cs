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
    public partial class BidInfoMap
        : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<Tender.Domain.BidInfo>
    {
        public BidInfoMap()
        {
            // table
            ToTable("BidInfo", "dbo");

            // keys

            // Properties
            Property(t => t.Id)
                .HasColumnName("Id")
                .IsRequired();
            Property(t => t.TenderId)
                .HasColumnName("TenderId")
                .IsRequired();
            Property(t => t.TenderTitle)
                .HasColumnName("TenderTitle")
                .HasMaxLength(500)
                .IsRequired();
            Property(t => t.UserId)
                .HasColumnName("UserId")
                .IsRequired();
            Property(t => t.UserName)
                .HasColumnName("UserName")
                .HasMaxLength(100)
                .IsRequired();
            Property(t => t.TenderPrice)
                .HasColumnName("TenderPrice")
                .HasPrecision(18, 2)
                .IsRequired();
            Property(t => t.CreateDate)
                .HasColumnName("CreateDate")
                .IsRequired();

            // Relationships
        }
    }
}