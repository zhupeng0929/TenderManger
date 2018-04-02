using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TenderManger.Models;
namespace TenderManger.Services
{
    public class RelevanceService : BaseService<RelevanceEntity>
    {
        /// <summary>
        /// 新增实体
        /// </summary>
        public bool AddRelevance(RelevanceEntity model)
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                var result = conn.Insert<Guid>(model);
                if (result != Guid.Empty)
                    return true;
            }
            return false;
        }
        /// <summary>
        /// 新增实体--事物
        /// </summary>
        public bool AddRelevance(RelevanceEntity model, IDbConnection conn, IDbTransaction trans)
        {
            var result = conn.Insert<Guid>(model, trans);
            if (result != Guid.Empty)
                return true;
            else
                return false;
        }
        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="id">主键id</param>
        /// <returns></returns>
        public bool DelRelevance(int id)
        {
            if (id > 0)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from Relevance where Id=@Id";
                    var param = new { Id = id };
                    var result = conn.Execute(strSql, param);
                    if (result > 0)
                        return true;
                }
            }
            return false;
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DelRelevanceBatch(int[] ids)
        {
            if (ids.Length > 0)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from  Relevance where Id in @Id ";

                    DynamicParameters param = new DynamicParameters();
                    param.Add("Id", ids);
                    var result = conn.Execute(strSql, param);
                    if (result > 0)
                        return true;
                }
            }
            return false;
        }
        /// <summary>
        /// 获取类别实体根据ID
        /// </summary>
        /// <returns></returns>
        public RelevanceEntity GetRelevance(int id)
        {
            var mResult = new RelevanceEntity();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.Get<RelevanceEntity>(id);
            }
            return mResult;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<RelevanceEntity> GetRelevanceList()
        {
            var mResult = new List<RelevanceEntity>();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.GetList<RelevanceEntity>().ToList();
            }
            return mResult;
        }
        /// <summary>
        /// 更新实体列表
        /// </summary>
        /// <returns></returns>
        public bool UpdateRelevance(RelevanceEntity entity)
        {
            int row;
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                row = conn.Update(entity);
            }
            return row > 0;
        }
        /// <summary>
        /// 更新实体列表--事物
        /// </summary>
        /// <returns></returns>
        public bool UpdateRelevance(RelevanceEntity entity, IDbConnection conn, IDbTransaction trans)
        {
            int row;
            row = conn.Update(entity, trans);
            return row > 0;
        }

        public void DeleteBy(string key, params Guid[] firstIds)
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                conn.DeleteList<RelevanceEntity>("where FirstId in  @FirstId and [Key]=@Key", new { FirstId = firstIds, Key = key });
            }
        }

        /// <summary>
        /// 删除关联
        /// </summary>
        /// <param name="key">关联标识</param>
        /// <param name="idMaps">关联的&lt;firstId, secondId&gt;数组</param>
        public void DeleteBy(string key, ILookup<Guid, Guid> idMaps)
        {
            foreach (var sameVals in idMaps)
            {
                foreach (var value in sameVals)
                {
                    using (IDbConnection conn = new SqlConnection(GetConnstr))
                    {
                        conn.DeleteList<RelevanceEntity>("where FirstId=FirstId and [Key]=@Key and SecondId=@SecondId ", new { FirstId = sameVals.Key, Key = key, SecondId = value });
                    }
                }
            }
        }
        /// <summary>
        /// 添加新的关联
        /// </summary>
        /// <param name="key">关联标识</param>
        /// <param name="idMaps">关联的&lt;firstId, secondId&gt;数组</param>
        public void AddRelevance(string key, ILookup<Guid, Guid> idMaps)
        {
            DeleteBy(key, idMaps);
            BatchAdd((from sameVals in idMaps
                      from value in sameVals
                      select new RelevanceEntity
                      {
                          Key = key,
                          FirstId = sameVals.Key,
                          SecondId = value,
                          OperateTime = DateTime.Now
                      }).ToArray());
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="entities"></param>
        public void BatchAdd(RelevanceEntity[] entities)
        {
            using (var conn = new SqlConnection(GetConnstr))
            {
                using (var trans = conn.BeginTransaction())
                {
                    try
                    {
                        foreach (var entity in entities)
                        {
                            entity.Id = Guid.NewGuid();
                            Add(entity, conn, trans);
                        }
                        trans.Commit();
                    }
                    catch (Exception ex)
                    {
                        //出现异常，事务Rollback
                        trans.Rollback();
                    }
                }

            }

        }
    }
}