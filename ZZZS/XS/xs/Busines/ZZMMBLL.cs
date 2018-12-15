using DataAccess;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Busines
{
    public class ZZMMBLL : IDisposable
    {
        DaoZZMM Dao = new DaoZZMM();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }

        }
        public int Update(ZZMM zzmm)
        {
            return Dao.Update(zzmm);
        }
        public int delete(ZZMM zzmm)
        {
            return Dao.Delete(zzmm);
        }
        public List<ZZMM> getZZMMList()
        {
            return Dao.getZZMMList();
        }
    }
}
