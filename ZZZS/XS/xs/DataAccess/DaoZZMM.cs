using Entity;
using DataAccess.Base;
using System.Collections.Generic;

namespace DataAccess
{
    public class DaoZZMM : DaoBase<ZZMM>
    {
        /// <summary>
        /// 返回所有政治面貌
        /// </summary>
        /// <returns></returns>
        public List<ZZMM> getZZMMList()
        {
            return base.GetList("select * from ZZMM");
        }
    }
}
