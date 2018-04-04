using Dapper;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TenderManger.Models;

namespace TenderManger.Services
{
    public class RoleService : BaseService<RoleEntity>
    {
        RelevanceService relevanceService = new RelevanceService();
        OrgService orgService = new OrgService();
        public int GetRoleCntInOrg(Guid orgId)
        {
            if (orgId == Guid.Empty)
            {
                return 0;
            }
            else
            {
                return GetRoleCntInOrgs(GetSubOrgIds(orgId));
            }
        }

        public int GetRoleCntInOrgs(params Guid[] orgIds)
        {
            return LoadInOrgs(orgIds).Count();
        }

        public IEnumerable<RoleEntity> LoadInOrgs(params Guid[] orgId)
        {
            var roles = relevanceService.GetList().Where(u => u.Key == "RoleOrg"
           && orgId.Contains(u.SecondId)).Select(u => u.FirstId);   //机构关联的角色

            var result = from role in this.GetList().Where(u => roles.Contains(u.Id)) select role;

            return result;

        }
        public IEnumerable<RoleEntity> LoadInOrgs(int pageindex, int pagesize, params Guid[] orgIds)
        {
            return LoadInOrgs(orgIds).OrderBy(u => u.Id).Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        public IEnumerable<RoleEntity> LoadRoles(int pageindex, int pagesize)
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                return conn.GetListPaged<RoleEntity>(pageindex, pagesize, "", "Id").ToList();
            }
        }
        public int Getcount()
        {
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                return conn.RecordCount<RoleEntity>();
            }
        }
        /// <summary>
        /// 加载一个部门及子部门全部Roles
        /// </summary>
        public GridData Load(Guid orgId, int pageindex, int pagesize)
        {
            if (pageindex < 1) pageindex = 1; //TODO:如果列表为空新增加一个用户后，前端会传一个0过来，奇怪？？
            IEnumerable<RoleEntity> roles;
            int total = 0;
            if (orgId == Guid.Empty)
            {
                roles = LoadRoles(pageindex, pagesize);
                total = Getcount();
            }
            else
            {
                roles = LoadInOrgs(pageindex, pagesize, GetSubOrgIds(orgId));
                total = GetRoleCntInOrgs(orgId);
            }

            var rolevms = new List<RoleVM>();
            foreach (var role in roles)
            {
                RoleVM rolevm = EntityHelper.CopyEntity<RoleEntity, RoleVM>(role);
                var orgs = orgService.LoadByRole(role.Id);
                rolevm.Organizations = string.Join(",", orgs.Select(u => u.Name).ToList());
                rolevm.OrganizationIds = string.Join(",", orgs.Select(u => u.Id).ToList());
                rolevms.Add(rolevm);
            }

            var result = new GridData
            {
                records = total,
                total = (int)Math.Ceiling((double)total / pagesize),
                rows = rolevms.ToList(),
                page = pageindex
            };

            return result;
        }

        /// <summary>
        /// 获取当前组织的所有下级组织
        /// </summary>
        private Guid[] GetSubOrgIds(Guid orgId)
        {
            var orgs = orgService.GetSubOrgs(orgId).Select(u => u.Id).ToArray();
            return orgs;
        }

        public RoleEntity Find(Guid id)
        {
            var role = GetSingle(id);
            if (role == null) role = new RoleEntity();
            return role;
        }

        public void Delete(Guid id)
        {
            if (id != Guid.Empty)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from Role where Id=@Id";
                    var param = new { Id = id };
                    var result = conn.Execute(strSql, param);
                }
            }

        }

        public void AddOrUpdate(RoleVM obj)
        {
            var role = EntityHelper.CopyEntity<RoleVM, RoleEntity>(obj);


            if (role.Id == Guid.Empty)
            {
                role.CreateTime = DateTime.Now;
                Add(role);
            }
            else
            {
                Update(role);
            }

            Guid[] orgIds = obj.OrganizationIds.ToString().Split(',').Select(id => Guid.Parse(id)).ToArray();

            relevanceService.DeleteBy("RoleOrg", role.Id);
            relevanceService.AddRelevance("RoleOrg", orgIds.ToLookup(u => role.Id));
        }

        public List<RoleEntity> LoadForUser(Guid userId)
        {
            if (userId == Guid.Empty)
                return new List<RoleEntity>();

            var userRoleIds =
               relevanceService.GetList().Where(u => u.FirstId == userId && u.Key == "UserRole")
               .Select(u => u.SecondId).ToList();

            return this.GetList().Where(u => userRoleIds.Contains(u.Id)).ToList();
        }

        public List<RoleVM> LoadForOrgAndUser(Guid orgId, Guid userId)
        {
            var userroles = LoadForUser(userId);
            var orgroles = LoadInOrgs(GetSubOrgIds(orgId)).ToList();

            var rolevms = new List<RoleVM>();
            foreach (var role in orgroles)
            {
                RoleVM rolevm = EntityHelper.CopyEntity<RoleEntity, RoleVM>(role);
                rolevm.Checked = userroles.Any(u => u.Id == role.Id);
                var orgs = orgService.LoadByRole(role.Id);
                rolevm.Organizations = string.Join(",", orgs.Select(u => u.Name).ToList());
                rolevm.OrganizationIds = string.Join(",", orgs.Select(u => u.Id).ToList());
                rolevms.Add(rolevm);
            }
            return rolevms;
        }

        public RoleEntity GetSingle(string userName)
        {
            var mResult = new RoleEntity();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                string strSql = "Select * from [Role] where Name=@name";
                var param = new { name = userName };
                mResult = conn.Query<RoleEntity>(strSql, param).FirstOrDefault();
            }
            return mResult;
        }
        public List<Guid> GetUsersInRole(string ruleName)
        {
            var role = GetSingle(ruleName);
            if (role == null) return null;

            return relevanceService.GetList().Where(u => u.Key == "UserRole"
                       && u.SecondId == role.Id).Select(u => u.FirstId).ToList();
        }

        public List<RoleEntity> GetRolesQuery(Guid userid)
        {
            var _userRoleIds = relevanceService.GetList().Where(u => u.FirstId == userid && u.Key == "UserRole").Select(u => u.SecondId).ToList();
            return GetList().Where(u => _userRoleIds.Contains(u.Id)).ToList();
        }
    }
}