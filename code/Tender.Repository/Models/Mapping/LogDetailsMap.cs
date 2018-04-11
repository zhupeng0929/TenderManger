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
using System.ComponentModel.DataAnnotations.Schema;

namespace Tender.Repository.Models.Mapping
{
    public partial class LogDetailsMap
        : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<Tender.Domain.LogDetails>
    {
        public LogDetailsMap()
        {
            // table
            ToTable("LogDetails", "dbo");

            // keys
            HasKey(t => t.LogID);

            // Properties
            Property(t => t.LogID)
                .HasColumnName("LogID")
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity)
                .IsRequired();
            Property(t => t.LogDate)
                .HasColumnName("LogDate")
                .IsRequired();
            Property(t => t.LogThread)
                .HasColumnName("LogThread")
                .HasMaxLength(100)
                .IsRequired();
            Property(t => t.LogLevel)
                .HasColumnName("LogLevel")
                .HasMaxLength(200)
                .IsRequired();
            Property(t => t.LogLogger)
                .HasColumnName("LogLogger")
                .HasMaxLength(500)
                .IsRequired();
            Property(t => t.LogMessage)
                .HasColumnName("LogMessage")
                .HasMaxLength(3000)
                .IsRequired();
            Property(t => t.LogActionClick)
                .HasColumnName("LogActionClick")
                .HasMaxLength(4000)
                .IsOptional();
            Property(t => t.UserName)
                .HasColumnName("UserName")
                .HasMaxLength(30)
                .IsOptional();
            Property(t => t.UserIP)
                .HasColumnName("UserIP")
                .HasMaxLength(20)
                .IsOptional();

            // Relationships
        }
    }
}
