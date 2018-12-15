using DataAccess;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Busines
{
    public class StuAllInfoBLL : IDisposable
    {
        DaoStuAllInfo Dao = new DaoStuAllInfo();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }

            {
            }
        }
        public string Insert(StuAllInfo info)
        {
            return (string)Dao.Insert(info);
        }
        public int Update(StuAllInfo info)
        {
            return Dao.Update(info);
        }
        public int Delete(StuAllInfo info)
        {
            return Dao.Delete(info);
        }

        public List<StuAllInfo> getStuAllInfo()
        {
            return Dao.getStuAllInfo();
        }

    }
}
