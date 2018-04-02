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
    public class ModuleService : BaseService<ModuleEntity>
    {
        RelevanceService relevanceService = new RelevanceService();
        /// <summary>
        /// 新增实体
        /// </summary>
        public bool AddModule(ModuleEntity model)
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
        public bool AddModule(ModuleEntity model, IDbConnection conn, IDbTransaction trans)
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
        public bool DelModule(Guid id)
        {
            if (id != Guid.Empty)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from Module where Id=@Id";
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
        public bool DelModuleBatch(int[] ids)
        {
            if (ids.Length > 0)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from  Module where Id in @Id ";

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
        public ModuleEntity GetModule(Guid id)
        {
            var mResult = new ModuleEntity();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.Get<ModuleEntity>(id);
            }
            return mResult;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<ModuleEntity> GetModuleList()
        {
            var mResult = new List<ModuleEntity>();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.GetList<ModuleEntity>().ToList();
            }
            return mResult;
        }
        /// <summary>
        /// 更新实体列表
        /// </summary>
        /// <returns></returns>
        public bool UpdateModule(ModuleEntity entity)
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
        public bool UpdateModule(ModuleEntity entity, IDbConnection conn, IDbTransaction trans)
        {
            int row;
            row = conn.Update(entity, trans);
            return row > 0;
        }
        /// <summary>
        /// 得出最终用户拥有的模块
        /// </summary>
        public List<ModuleEntity> GetModulesQuery(Guid userid)
        {

            List<Guid> _userRoleIds;    //用户角色GUID
            _userRoleIds = relevanceService.GetList().Where(u => u.FirstId == userid && u.Key == "UserRole").Select(u => u.SecondId).ToList();
            var moduleIds = relevanceService.GetList().Where(
                    u =>
                        (u.FirstId == userid && u.Key == "UserModule") ||
                        (u.Key == "RoleModule" && _userRoleIds.Contains(u.FirstId))).Select(u => u.SecondId);
            return GetList().Where(u => moduleIds.Contains(u.Id)).OrderBy(u => u.SortNo).ToList();
        }

        /// <summary>
        /// 加载特定用户的模块
        /// </summary>
        /// <param name="userId">The user unique identifier.</param>
        public List<ModuleEntity> LoadForUser(Guid userId)
        {
            //用户角色
            var userRoleIds =
                relevanceService.GetList().Where(u => u.FirstId == userId && u.Key == "UserRole").Select(u => u.SecondId).ToList();

            //用户角色与自己分配到的模块ID
            var moduleIds =
               relevanceService.GetList().Where(
                    u =>
                        (u.FirstId == userId && u.Key == "UserModule") ||
                        (u.Key == "RoleModule" && userRoleIds.Contains(u.FirstId))).Select(u => u.SecondId).ToList();

            if (!moduleIds.Any()) return new List<ModuleEntity>();
            return GetList().Where(u => moduleIds.Contains(u.Id)).ToList();
        }
        /// <summary>
        /// 加载特定角色的模块
        /// </summary>
        /// <param name="roleId">The role unique identifier.</param>
        public List<ModuleEntity> LoadForRole(Guid roleId)
        {
            var moduleIds =
                relevanceService.GetList().Where(u => u.FirstId == roleId && u.Key == "RoleModule")
                    .Select(u => u.SecondId)
                    .ToList();
            if (!moduleIds.Any()) return new List<ModuleEntity>();
            return GetList().Where(u => moduleIds.Contains(u.Id)).ToList();
        }
        /// <summary>
        /// 加载一个节点下面的所有
        /// </summary>
        public dynamic Load(Guid userid, Guid parentId, int pageindex, int pagesize)
        {

            if (!GetModulesQuery(userid).Any()) //用户不能访问任何模块
            {
                return new
                {
                    total = 0,
                    records = 0,
                    page = pageindex
                };
            }
            var ids = GetSubIds(parentId);
            var query = GetModulesQuery(userid).Where(u => parentId == Guid.Empty || (u.ParentId != null && ids.Contains(u.ParentId)));

            int total = query.Count();
            var modules = query.OrderBy(u => u.CascadeId).Skip((pageindex - 1) * pagesize).Take(pagesize);

            return new
            {
                records = total,
                total = Math.Ceiling((double)total / pagesize),
                rows = modules,
                page = pageindex
            };
        }

        //根据同一级中最大的语义ID

        private Guid[] GetSubIds(Guid parentId)
        {
            if (parentId == Guid.Empty)
                return new List<Guid>().ToArray();
            var parent = GetModule(parentId);
            var orgs = GetList().Where(u => u.CascadeId.Contains(parent.CascadeId)).Select(u => u.Id).ToArray();
            return orgs;
        }

        public void AddOrUpdate(ModuleEntity model)
        {
            ChangeModuleCascade(model);
            if (model.Id == Guid.Empty)
            {
                Add(model);
            }
            else
            {
                //获取旧的的CascadeId
                var CascadeId = GetSingle(model.Id).CascadeId;
                //根据CascadeId查询子部门
                var models = GetList().Where(u => u.CascadeId.Contains(CascadeId) && u.Id != model.Id).OrderBy(u => u.CascadeId).ToList();

                Update(model);

                //更新子部门的CascadeId
                foreach (var a in models)
                {
                    ChangeModuleCascade(a);
                    Update(a);
                }
            }
        }
        //修改对象的级联ID
        private void ChangeModuleCascade(ModuleEntity module)
        {
            string cascadeId;
            int currentCascadeId = 1;  //当前结点的级联节点最后一位
            var sameLevels = GetList().Where(o => o.ParentId == module.ParentId && o.Id != module.Id);
            foreach (var obj in sameLevels)
            {
                int objCascadeId = int.Parse(obj.CascadeId.TrimEnd('.').Split('.').Last());
                if (currentCascadeId <= objCascadeId) currentCascadeId = objCascadeId + 1;
            }

            if (module.ParentId != null && module.ParentId != Guid.Empty)
            {
                var parentOrg = GetSingle(module.ParentId);
                if (parentOrg != null)
                {
                    cascadeId = parentOrg.CascadeId + currentCascadeId + ".";
                    module.ParentName = parentOrg.Name;
                }
                else
                {
                    throw new Exception("未能找到该组织的父节点信息");
                }
            }
            else
            {
                cascadeId = ".0." + currentCascadeId + ".";
                module.ParentName = "根节点";
            }

            module.CascadeId = cascadeId;
        }

        public void Delete(Guid id)
        {
            var del = GetSingle(id);
            if (del == null) return;

            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                conn.DeleteList<ModuleEntity>("where CascadeId like @CascadeId ", new { CascadeId = "%" + del.CascadeId + "%" });
            }

        }
    }
}