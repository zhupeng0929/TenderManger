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
    public partial class EnclosureMap
        : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<Tender.Domain.Enclosure>
    {
        public EnclosureMap()
        {
            // table
            ToTable("Enclosure", "dbo");

            // keys

            // Properties
            Property(t => t.Id)
                .HasColumnName("Id")
                .IsRequired();
            Property(t => t.RelationId)
                .HasColumnName("RelationId")
                .IsRequired();
            Property(t => t.Path)
                .HasColumnName("Path")
                .HasMaxLength(500)
                .IsRequired();
            Property(t => t.Type)
                .HasColumnName("type")
                .IsRequired();

            // Relationships
        }
    }
}
