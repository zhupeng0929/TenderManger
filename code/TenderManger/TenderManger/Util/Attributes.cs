using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TenderManger
{

    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false, Inherited = false)]
    public class MetricAttribute : Attribute
    {
        public MetricAttribute()
        {
        }

        public string Code { get; set; }
    }
    /// <summary>
    /// 加入些特性后，在实体差异比较中会忽略该属性
    /// </summary>
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = false)]
    public class IngoreCompareAttribute : Attribute
    {
        public IngoreCompareAttribute()
        {
            Flag = true;
        }

        public bool Flag { get; set; }
    }


    #region 用于映射实体标记的特性
    /// <summary>
    /// 用于映射实体标记的特性(EntityHelper.MappingEntity)
    /// </summary>
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = false)]
    public class MappingFieldAttribute : Attribute
    {
        public MappingFieldAttribute()
        {
            FieldName = string.Empty;
        }
        /// <summary>
        /// 映射的字段名称
        /// </summary>
        public string FieldName { get; set; }
    }
    #endregion


    /// <summary>
    /// 字段属性
    /// </summary>
    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = false)]
    public class ParamFieldAttribute : Attribute
    {
        public ParamFieldAttribute() { }

        private bool _isRequired = false;
        private string _fieldName = string.Empty;
        private int _fieldMaxLangth = 0;


        /// <summary>
        /// 是否必填
        /// </summary>
        public bool IsRequired
        {
            get
            {
                return _isRequired;
            }

            set
            {
                _isRequired = value;
            }
        }
        /// <summary>
        /// 字段名称
        /// </summary>
        public string FieldName
        {
            get
            {
                return _fieldName;
            }

            set
            {
                _fieldName = value;
            }
        }
        /// <summary>
        /// 字段最大长度
        /// </summary>
        public int FieldMaxLangth
        {
            get
            {
                return _fieldMaxLangth;
            }

            set
            {
                _fieldMaxLangth = value;
            }
        }
    }

}
