using Entity;
using DataAccess.Base;
using System.Collections.Generic;

namespace DataAccess
{
    public class DaoAreaCode : DaoBase<AreaCode_>
    {
        /// <summary>
        /// 返回所有市的名称
        /// </summary>
        /// <returns></returns>
        public List<AreaCode_> getShiAreaCode()
        {
            return base.GetList("select * from AreaCode where len(AreaCode)=4");
        }
        /// <summary>
        /// 通过市对应的编号找到县
        /// </summary>
        /// <returns></returns>
        public List<AreaCode_> getXianAreaCodeByShiAreaCode(string shiCode)
        {
            return base.GetList("select * from AreaCode where len(AreaCode)=6 and substring(AreaCode,1,4)=@0", shiCode);
        }
        public AreaCode_ getAreaName(string AreaName)
        {
            return base.FirstOrDefault("select AreaName from AreaCode where AreaCode=@0 ", AreaName);
        }
    }
}
