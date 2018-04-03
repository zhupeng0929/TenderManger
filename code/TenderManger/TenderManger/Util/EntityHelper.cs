using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace TenderManger
{
    public class EntityHelper
    {
        public static T MappingEntityByDic<T>(Dictionary<string, object> dicValues)
        {
            T entity = Activator.CreateInstance<T>();
            if (dicValues == null || dicValues.Keys.Count < 1)
            {
                return entity;
            }
            PropertyInfo[] properties = entity.GetType().GetProperties();
            if (properties == null || properties.Length < 1)
            {
                return entity;
            }
            try
            {
                foreach (var item in properties)
                {
                    MappingFieldAttribute fieldAttr = item.GetCustomAttribute<MappingFieldAttribute>();
                    if (fieldAttr == null || string.IsNullOrEmpty(fieldAttr.FieldName))
                    {
                        continue;
                    }
                    if (dicValues.Keys.Contains(fieldAttr.FieldName))
                    {
                        item.SetValue(entity, dicValues[fieldAttr.FieldName]);
                    }
                }
            }
            catch (Exception ex)
            {
                //LogHelper.WriteCommonLog("EntityHelper", "MappingEntity", string.Format("映射实体失败，错误信息：{0}", ex.ToString()), EnumState.LogLevel.Error);
            }

            return entity;
        }

        public static Dictionary<string, object> GetDicByEntity<T>(T entity)
        {
            var dic = new Dictionary<string, object>();
            if (entity == null)
            {
                return dic;
            }
            PropertyInfo[] properties = entity.GetType().GetProperties();
            if (properties == null || properties.Length < 1)
            {
                return dic;
            }
            try
            {
                foreach (var item in properties)
                {
                    dic[item.Name] = item.GetValue(entity, null);
                }
            }
            catch (Exception ex)
            {
                //LogHelper.WriteCommonLog("EntityHelper", "GetDicByEntity", string.Format("实体转字典值失败，错误信息：{0}", ex.ToString()), EnumState.LogLevel.Error);
            }

            return dic;
        }

        /// <summary>
        /// 根据特性（MappingField），映射实体值
        /// </summary>
        /// <remarks>
        /// 陈利 2016-11-23 20:19:10
        /// </remarks>
        /// <typeparam name="T"></typeparam>
        /// <param name="dicValues"></param>
        /// <returns></returns>
        public static TTo MappingEntity<TFrom, TTo>(TFrom fromEntity)
        {
            var toEntity = Activator.CreateInstance<TTo>();
            if (fromEntity == null)
            {
                return toEntity;
            }
            var dic = GetDicByEntity(fromEntity);
            if (dic == null || dic.Keys.Count < 1)
            {
                return toEntity;
            }
            return MappingEntityByDic<TTo>(dic);
        }

        /// <summary>
        /// 复制属性 目前只适用于单层实体，即没有类中类
        /// </summary>
        /// <typeparam name="TSource">源类型</typeparam>
        /// <typeparam name="TTarget">目标类型</typeparam>
        /// <param name="source">源</param>
        /// <param name="sw">比较类型</param>
        /// <returns>目标</returns>
        public static TTarget CopyEntity<TSource, TTarget>(TSource source, MappingCompareSwitch sw = MappingCompareSwitch.Equals)
        {
            if (source == null)
            {
                return default(TTarget);
            }
            var target = Activator.CreateInstance<TTarget>();
            PropertyInfo[] sourceProps = source.GetType().GetProperties();//源的属性
            PropertyInfo[] targetProps = target.GetType().GetProperties();//目标的属性

            foreach (PropertyInfo targetProp in targetProps)
            {
                PropertyInfo sourceProp = null;
                if (sw == MappingCompareSwitch.Equals)
                {
                    sourceProp = sourceProps.FirstOrDefault(m => m.Name.Equals(targetProp.Name) && m.PropertyType == targetProp.PropertyType);
                }
                else if (sw == MappingCompareSwitch.SourceStartWithTarget)
                {
                    sourceProp = sourceProps.FirstOrDefault(m => m.Name.StartsWith(targetProp.Name) && m.PropertyType == targetProp.PropertyType);
                }
                else if (sw == MappingCompareSwitch.SourceEndWithTarget)
                {
                    sourceProp = sourceProps.FirstOrDefault(m => m.Name.EndsWith(targetProp.Name) && m.PropertyType == targetProp.PropertyType);
                }
                else if (sw == MappingCompareSwitch.TargetStartWithSource)
                {
                    sourceProp = sourceProps.FirstOrDefault(m => targetProp.Name.StartsWith(m.Name) && m.PropertyType == targetProp.PropertyType);
                }
                else if (sw == MappingCompareSwitch.TargetEndWithSource)
                {
                    sourceProp = sourceProps.FirstOrDefault(m => targetProp.Name.EndsWith(m.Name) && m.PropertyType == targetProp.PropertyType);
                }
                if (sourceProp != null)
                {
                    targetProp.SetValue(target, sourceProp.GetValue(source, null), null);
                }
            }
            return target;
        }

        /// <summary>
        /// 复制集合
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TTarget"></typeparam>
        /// <param name="source"></param>
        /// <param name="sw"></param>
        /// <returns></returns>
        public static List<TTarget> CopyEntityList<TSource, TTarget>(IEnumerable<TSource> source, MappingCompareSwitch sw = MappingCompareSwitch.Equals)
        {
            List<TTarget> resLst = new List<TTarget>();
            if (source != null && source.Any())
            {
                foreach (var item in source)
                {
                    TTarget target = CopyEntity<TSource, TTarget>(item, sw);
                    resLst.Add(target);
                }
            }
            return resLst;
        }


        /// <summary>
        /// 比较规则
        /// </summary>
        public enum MappingCompareSwitch
        {
            /// <summary>
            /// 源和目标名称相同
            /// </summary>
            Equals = 0,
            /// <summary>
            /// 源的名字是以目标名字起头
            /// </summary>
            SourceStartWithTarget = 1,
            /// <summary>
            /// 源的名字是以目标名字结尾
            /// </summary>
            SourceEndWithTarget = 2,
            /// <summary>
            /// 目标名字是以源的名字起头
            /// </summary>
            TargetStartWithSource = 3,
            /// <summary>
            /// 目标名字是以源的名字结尾
            /// </summary>
            TargetEndWithSource = 4
        }



    }
}
