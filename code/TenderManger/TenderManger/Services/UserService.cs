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
    public class UserService : BaseService<UserEntity>
    {
        RelevanceService relevanceService = new RelevanceService();
        OrgService orgService = new OrgService();
        #region 基础方法

        /// <summary>
        /// 新增实体
        /// </summary>
        public bool AddUserInfo(UserEntity model)
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
        public bool AddUserInfo(UserEntity model, IDbConnection conn, IDbTransaction trans)
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
        public bool DelUserInfo(int id)
        {
            if (id > 0)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from UserInfo where Id=@Id";
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
        public bool DelUserInfoBatch(int[] ids)
        {
            if (ids.Length > 0)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from  UserInfo where Id in @Id ";

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
        public UserEntity GetUserInfo(int id)
        {
            var mResult = new UserEntity();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.Get<UserEntity>(id);
            }
            return mResult;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<UserEntity> GetUserInfoList()
        {
            var mResult = new List<UserEntity>();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.GetList<UserEntity>().ToList();
            }
            return mResult;
        }
        /// <summary>
        /// 更新实体列表
        /// </summary>
        /// <returns></returns>
        public bool UpdateUserInfo(UserEntity entity)
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
        public bool UpdateUserInfo(UserEntity entity, IDbConnection conn, IDbTransaction trans)
        {
            int row;
            row = conn.Update(entity, trans);
            return row > 0;
        }

        public UserEntity GetUser(string userName)
        {
            var mResult = new UserEntity();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                string strSql = "Select * from UserInfo where Account=@name";
                var param = new { name = userName };
                mResult = conn.Query<UserEntity>(strSql, param).FirstOrDefault();
            }
            return mResult;
        }
        #endregion

        #region 扩展方法
        public void AddOrUpdate(UserView view)
        {
            if (string.IsNullOrEmpty(view.OrganizationIds))
                throw new Exception("请为用户分配机构");
            UserEntity user = EntityHelper.CopyEntity<UserView, UserEntity>(view);
            if (user.Id == Guid.Empty)
            {
                if (GetUser(view.Account) != null)
                {
                    throw new Exception("用户账号已存在");
                }
                user.CreateTime = DateTime.Now;
                user.Password = CommonHelper.Md5(user.Password) ; //初始密码与账号相同
                Add(user);
                view.Id = user.Id;   //要把保存后的ID存入view
            }
            else
            {
                Update(user);
            }
            Guid[] orgIds = view.OrganizationIds.Split(',').Select(id => Guid.Parse(id)).ToArray();

            relevanceService.DeleteBy("UserOrg", user.Id);
            relevanceService.AddRelevance("UserOrg", orgIds.ToLookup(u => user.Id));
        }

        /// <summary>
        /// 加载一个部门及子部门全部用户
        /// </summary>
        public GridData Load(Guid orgId, int pageindex, int pagesize)
        {
            if (pageindex < 1) pageindex = 1;
            IEnumerable<UserEntity> users;
            int records = 0;
            if (orgId == Guid.Empty)
            {
                users = LoadUsers(pageindex, pagesize);
                records = GetCount();
            }
            else
            {
                var ids = GetSubOrgIds(orgId);
                users = LoadInOrgs(pageindex, pagesize, ids);
                records = GetUserCntInOrgs(ids);
            }
            var userviews = new List<UserView>();
            foreach (var user in users)
            {
                UserView uv = EntityHelper.CopyEntity<UserEntity, UserView>(user);
                var orgs = orgService.LoadByUser(user.Id);
                uv.Organizations = string.Join(",", orgs.Select(u => u.Name).ToList());
                uv.OrganizationIds = string.Join(",", orgs.Select(u => u.Id).ToList());
                userviews.Add(uv);
            }

            return new GridData
            {
                records = records,
                total = (int)Math.Ceiling((double)records / pagesize),
                rows = userviews,
                page = pageindex
            };
        }
        public IEnumerable<UserEntity> LoadUsers(int pageindex, int pagesize)
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                return conn.GetListPaged<UserEntity>(pageindex, pagesize, "", "Id").ToList();
            }
        }

        public int GetCount()
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                return conn.RecordCount<UserEntity>();
            }
        }

        /// <summary>
        /// 获取当前组织的所有下级组织
        /// </summary>
        private Guid[] GetSubOrgIds(Guid orgId)
        {
            var org = orgService.GetSingle(orgId);
            var orgs = orgService.GetList().Where(u => u.CascadeId.Contains(org.CascadeId)).Select(u => u.Id).ToArray();
            return orgs;
        }

        public IEnumerable<UserEntity> LoadInOrgs(int pageindex, int pagesize, params Guid[] orgIds)
        {
            return LoadInOrgs(orgIds).OrderBy(u => u.Id).Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        public IEnumerable<UserEntity> LoadInOrgs(params Guid[] orgId)
        {
            var result = from user in GetList()
                         where (
                             relevanceService.GetList().Where(uo => orgId.Contains(uo.SecondId) && uo.Key == "UserOrg")
                             .Select(u => u.FirstId)
                             .Distinct()
                         )
                         .Contains(user.Id)
                         select user;
            return result;

        }
        public int GetUserCntInOrgs(params Guid[] orgIds)
        {
            return LoadInOrgs(orgIds).Count();
        }

        public void Delete(Guid[] ids)
        {
            DeleteBy(ids);
            relevanceService.DeleteBy("UserOrg", ids);
            relevanceService.DeleteBy("UserModule", ids);
            relevanceService.DeleteBy("UserRole", ids);
        }

        public void DeleteBy(Guid[] ids)
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                conn.DeleteList<UserEntity>("where [Id] in  @Ids ", new { Ids = ids });
            }
        }
        #endregion
    }
}