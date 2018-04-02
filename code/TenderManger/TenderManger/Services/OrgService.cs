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
    public class OrgService : BaseService<OrgEntity>
    {
        RelevanceService relevanceService = new RelevanceService();
        #region 基础方法
        // <summary>
        /// 新增实体
        /// </summary>
        public bool AddOrg(OrgEntity model)
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
        public bool AddOrg(OrgEntity model, IDbConnection conn, IDbTransaction trans)
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
        public bool DelOrg(Guid id)
        {
            if (id != Guid.Empty)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from Org where Id=@Id";
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
        public bool DelOrgBatch(Guid[] ids)
        {
            if (ids.Length > 0)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from  Org where Id in @Id ";

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
        public OrgEntity GetOrg(Guid id)
        {
            var mResult = new OrgEntity();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.Get<OrgEntity>(id);
            }
            return mResult;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<OrgEntity> GetOrgList()
        {
            var mResult = new List<OrgEntity>();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.GetList<OrgEntity>().ToList();
            }
            return mResult;
        }
        /// <summary>
        /// 更新实体列表
        /// </summary>
        /// <returns></returns>
        public bool UpdateOrg(OrgEntity entity)
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
        public bool UpdateOrg(OrgEntity entity, IDbConnection conn, IDbTransaction trans)
        {
            int row;
            row = conn.Update(entity, trans);
            return row > 0;
        }
        #endregion

        /// <summary>
        /// 用户可访问的机构
        /// </summary>
        /// <returns>IQueryable&lt;Org&gt;.</returns>
        public List<OrgEntity> GetOrgsQuery(Guid userid)
        {
            List<Guid> _userRoleIds;    //用户角色GUID
            _userRoleIds = relevanceService.GetList().Where(u => u.FirstId == userid && u.Key == "UserRole").Select(u => u.SecondId).ToList();
            var orgids = relevanceService.GetList().Where(
                u =>
                    (u.FirstId == userid && u.Key == "UserOrg") ||
                    (u.Key == "RoleOrg" && _userRoleIds.Contains(u.FirstId))).Select(u => u.SecondId);
            return GetList().Where(u => orgids.Contains(u.Id)).ToList();
        }

        /// <summary>
        /// 加载特定用户的角色
        /// TODO:这里会加载用户及用户角色的所有角色，“为用户分配角色”功能会给人一种混乱的感觉，但可以接受
        /// </summary>
        /// <param name="userId">The user unique identifier.</param>
        public List<OrgEntity> LoadForUser(Guid userId)
        {
            //用户角色
            var userRoleIds =
                relevanceService.GetList().Where(u => u.FirstId == userId && u.Key == "UserRole").Select(u => u.SecondId).ToList();

            //用户角色与自己分配到的角色ID
            var moduleIds =
                relevanceService.GetList().Where(
                    u =>
                        (u.FirstId == userId && u.Key == "UserOrg") ||
                        (u.Key == "RoleOrg" && userRoleIds.Contains(u.FirstId))).Select(u => u.SecondId).ToList();

            if (!moduleIds.Any()) return new List<OrgEntity>();
            return GetList().Where(u => moduleIds.Contains(u.Id)).ToList();
        }
        /// <summary>
        /// 加载特定角色的角色
        /// </summary>
        /// <param name="roleId">The role unique identifier.</param>
        public List<OrgEntity> LoadForRole(Guid roleId)
        {
            var moduleIds =
                relevanceService.GetList().Where(u => u.FirstId == roleId && u.Key == "RoleOrg")
                    .Select(u => u.SecondId)
                    .ToList();
            if (!moduleIds.Any()) return new List<OrgEntity>();
            return GetList().Where(u => moduleIds.Contains(u.Id)).ToList();
        }

        /// <summary>
        /// 添加部门
        /// </summary>
        /// <param name="org">The org.</param>
        /// <returns>System.Int32.</returns>
        /// <exception cref="System.Exception">未能找到该组织的父节点信息</exception>
        public Guid AddOrUpdate(OrgEntity org)
        {
            ChangeModuleCascade(org);
            if (org.Id == Guid.Empty)
            {
                Add(org);
            }
            else
            {
                //获取旧的的CascadeId
                var CascadeId = GetSingle(org.Id).CascadeId;
                //根据CascadeId查询子部门
                var orgs = GetList().Where(u => u.CascadeId.Contains(CascadeId) && u.Id != org.Id).OrderBy(u => u.CascadeId).ToList();

                //更新操作
                Update(org);

                //更新子部门的CascadeId
                foreach (var a in orgs)
                {
                    ChangeModuleCascade(a);
                    Update(a);
                }
            }

            return org.Id;
        }
        /// <summary>
        /// 得到部门的所有子部门
        /// <para>如果orgId为0，表示取得所有部门</para>
        /// </summary>
        public GridData LoadAllChildren(Guid orgId)
        {
            var query = GetSubOrgs(orgId);
            return new GridData
            {
                page = 1,
                rows = query.ToList(),
                records = query.Count(),
                total = 1
            };
        }
        public IEnumerable<OrgEntity> GetSubOrgs(Guid orgId)
        {
            string cascadeId = "0.";
            if (orgId != Guid.Empty)
            {
                var org = GetSingle(orgId);
                if (org == null)
                    throw new Exception("未能找到指定对象信息");
                cascadeId = org.CascadeId;
            }
            return Find(cascadeId);
        }
        public IEnumerable<OrgEntity> Find(string cascadeId)
        {

            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                return conn.GetList<OrgEntity>("where CascadeId like @CascadeId ", new { CascadeId = "%" + cascadeId + "%" });
            }

        }
        /// <summary>
        /// 删除指定ID的部门及其所有子部门
        /// </summary>
        public void DelOrg(Guid[] ids)
        {
            var delOrg = GetList().Where(u => ids.Contains(u.Id)).ToList();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                foreach (var org in delOrg)
                {
                    conn.DeleteList<OrgEntity>("where CascadeId like @CascadeId ", new { CascadeId = "%" + org.CascadeId + "%" });
                }

            }

        }

        /// <summary>
        /// 加载角色的所有机构
        /// </summary>
        public IEnumerable<OrgEntity> LoadByRole(Guid roleId)
        {
            var relevances = relevanceService.GetList();
            var orgs = this.GetList();

            var result = from userorg in relevances
                         join org in orgs on userorg.SecondId equals org.Id
                         where userorg.FirstId == roleId && userorg.Key == "RoleOrg"
                         select org;
            return result;

        }

        #region 私有方法

        //修改对象的级联ID，生成类似XXX.XXX.X.XX
        private void ChangeModuleCascade(OrgEntity org)
        {
            string cascadeId;
            int currentCascadeId = 1;  //当前结点的级联节点最后一位
            var sameLevels = GetList().Where(o => o.ParentId == org.ParentId && o.Id != org.Id);
            foreach (var obj in sameLevels)
            {
                int objCascadeId = int.Parse(obj.CascadeId.TrimEnd('.').Split('.').Last());
                if (currentCascadeId <= objCascadeId) currentCascadeId = objCascadeId + 1;
            }

            if (org.ParentId != null && org.ParentId != Guid.Empty)
            {
                var parentOrg = GetSingle(org.ParentId);
                if (parentOrg != null)
                {
                    cascadeId = parentOrg.CascadeId + currentCascadeId + ".";
                    org.ParentName = parentOrg.Name;
                }
                else
                {
                    throw new Exception("未能找到该组织的父节点信息");
                }
            }
            else
            {
                cascadeId = ".0." + currentCascadeId + ".";
                org.ParentName = "根节点";
            }

            org.CascadeId = cascadeId;
        }

        #endregion 私有方法
    }
}