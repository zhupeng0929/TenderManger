using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace TenderManger.Services
{
    public class BaseService<T> where T : class
    {

        /// <summary>
        ///  测试方法，获取数据库连接字符串
        /// </summary>
        /// <returns></returns>
        public static string GetConnstr
        {
            get { return WebConfigurationManager.AppSettings["ConnectionString"].ToString(); }

        }
        /// <summary>
        /// 添加实体
        /// </summary>
        /// <param name="model"></param>
        /// <param name="conn"></param>
        /// <param name="trans"></param>
        /// <returns></returns>
        public Guid Add(T model, IDbConnection conn = null, IDbTransaction trans = null)
        {
            if (conn == null)
            {
                using (conn = new SqlConnection(GetConnstr))
                {
                    return conn.Insert<Guid>(model, trans);
                }
            }
            else
            {
                return conn.Insert<Guid>(model, trans);
            }
        }
        public Guid Add(T model)
        {
            using (var conn = new SqlConnection(GetConnstr))
            {
                return conn.Insert<Guid>(model);
            }
        }
        public Task<Guid> AddAsync(T model, IDbConnection conn = null, IDbTransaction trans = null)
        {
            if (conn == null)
            {
                using (conn = new SqlConnection(GetConnstr))
                {
                    return conn.InsertAsync<Guid>(model, trans);
                }
            }
            else
            {
                return conn.InsertAsync<Guid>(model, trans);
            }
        }
        /// <summary>
        /// 删除实体
        /// </summary>
        /// <param name="model"></param>
        /// <param name="conn"></param>
        /// <param name="trans"></param>
        /// <returns></returns>
        public bool Del(T model, IDbConnection conn = null, IDbTransaction trans = null)
        {
            if (conn == null)
            {
                using (conn = new SqlConnection(GetConnstr))
                {
                    return conn.Delete(model, trans) > 0;
                }
            }
            else
            {
                return conn.Delete(model, trans) > 0;
            }

        }
        /// <summary>
        /// 根据主键获取实体
        /// </summary>
        /// <param name="id">主键id</param>
        /// <returns></returns>
        public T GetSingle(Guid id)
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                return conn.Get<T>(id);
            }
        }
        /// <summary>
        /// 获取所有
        /// </summary>
        /// <returns></returns>
        public List<T> GetList()
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                return conn.GetList<T>().ToList();
            }
        }
        public Task<IEnumerable<T>> GetListAsync()
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                return conn.GetListAsync<T>();
            }
        }
        /// <summary>
        /// 更新实体
        /// </summary>
        /// <param name="entity"></param>
        /// <param name="conn"></param>
        /// <param name="trans"></param>
        /// <returns></returns>
        public bool Update(T entity, IDbConnection conn = null, IDbTransaction trans = null)
        {

            if (conn == null)
            {
                using (conn = new SqlConnection(GetConnstr))
                {
                    return conn.Update(entity, trans) > 0;
                }
            }
            else
            {
                return conn.Update(entity, trans) > 0;
            }
        }
        public bool Update(T entity)
        {
            using (var conn = new SqlConnection(GetConnstr))
            {
                return conn.Update(entity) > 0;
            }
        }

        
    }
}