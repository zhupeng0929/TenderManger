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
    public class ModuleElementService : BaseService<ModuleElementEntity>
    {
        RelevanceService relevanceService = new RelevanceService();
        #region 基础方法
        /// <summary>
        /// 新增实体
        /// </summary>
        public bool AddModuleElement(ModuleElementEntity model)
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
        public bool AddModuleElement(ModuleElementEntity model, IDbConnection conn, IDbTransaction trans)
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
        public bool DelModuleElement(Guid id)
        {
            if (id != null)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from ModuleElement where Id=@Id";
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
        public bool DelModuleElementBatch(Guid[] ids)
        {
            if (ids.Length > 0)
            {
                using (IDbConnection conn = new SqlConnection(GetConnstr))
                {
                    string strSql = "delete from  ModuleElement where Id in @Id ";

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
        public ModuleElementEntity GetModuleElement(Guid id)
        {
            var mResult = new ModuleElementEntity();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.Get<ModuleElementEntity>(id);
            }
            return mResult;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<ModuleElementEntity> GetModuleElementList()
        {
            var mResult = new List<ModuleElementEntity>();
            using (IDbConnection conn = new SqlConnection(GetConnstr))
            {
                mResult = conn.GetList<ModuleElementEntity>().ToList();
            }
            return mResult;
        }
        /// <summary>
        /// 更新实体列表
        /// </summary>
        /// <returns></returns>
        public bool UpdateModuleElement(ModuleElementEntity entity)
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
        public bool UpdateModuleElement(ModuleElementEntity entity, IDbConnection conn, IDbTransaction trans)
        {
            int row;
            row = conn.Update(entity, trans);
            return row > 0;
        }
        #endregion

        #region 扩展方法

        public IEnumerable<ModuleElementEntity> LoadByModuleId(Guid id, Guid userid)
        {


            if (!GetModuleElementsQuery(userid).Any()) //用户没有任何资源
            {
                return new List<ModuleElementEntity>();
            }

            var modules = GetModuleElementsQuery(userid).Where(u => u.ModuleId == id).OrderBy(u => u.Sort);
            return modules;
        }
        /// <summary>
        /// 模块菜单权限
        /// </summary>
        public IEnumerable<ModuleElementEntity> GetModuleElementsQuery(Guid userid)
        {
            var _userRoleIds = relevanceService.GetuserRoleIds(userid);
            var elementIds = relevanceService.GetList().Where(
                u =>
                    (u.FirstId == userid && u.Key == "UserElement") ||
                    (u.Key == "RoleElement" && _userRoleIds.Contains(u.FirstId))).Select(u => u.SecondId);
            return GetList().Where(u => elementIds.Contains(u.Id));
        }

        public void AddOrUpdate(ModuleElementEntity model)
        {
            var newbtn = new ModuleElementEntity();
            if (model.Id == Guid.Empty)
            {
                Add(model);
            }
            else
            {
                Update(model);
            }

        }

        /// <summary>
        /// 获取带有授权状态的菜单列表
        /// </summary>
        /// <param name="username">当前登录的操作人</param>
        /// <param name="accessType">授权类型，当前有RoleElement/UserElement</param>
        /// <param name="firstId">
        /// 当为RoleElement时，表示RoleId
        /// 当为UserElement时，表示UserId
        /// </param>
        /// <param name="moduleId">模块ID</param>
        public List<dynamic> LoadWithAccess(Guid userid, string accessType, Guid firstId, Guid moduleId)
        {
            var listVms = new List<dynamic>();
            if (!GetModuleElementsQuery(userid).Any()) //用户没有任何资源
            {
                return listVms;
            }
            if (moduleId == Guid.Empty) return listVms;
            foreach (var element in GetModuleElementsQuery(userid).Where(u => u.ModuleId == moduleId))
            {
                var accessed = relevanceService.GetList().FirstOrDefault(u => u.Key == accessType
                     && u.FirstId == firstId && u.SecondId == element.Id);
                var vm = new
                {
                    Id = element.Id,
                    Name = element.Name,
                    ModuleId = element.ModuleId,
                    DomId = element.DomId,
                    Checked = accessed != null
                };
                listVms.Add(vm);
            }
            return listVms;
        }
        #endregion
    }
}