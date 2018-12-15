using Entity;
using DataAccess.Base;
using System.Collections.Generic;

namespace DataAccess
{
    public class DaoZY : DaoBase<ZY>
    {
        /// <summary>
        /// 返回所哟有专业
        /// </summary>
        /// <returns></returns>
        public List<ZY> getListZy()
        {
            return base.GetList("select Id,ZYDM,'('+KLMC+')' +ZYMC AS zymc from ZY");
        }
       public string getZymcByZydm(string zydm)
        {
            ZY selectZy = new ZY();
            selectZy = base.FirstOrDefault("select * from ZY where ZYDM=@0",zydm);
            return selectZy.ZYMC;
        }
    }
}
