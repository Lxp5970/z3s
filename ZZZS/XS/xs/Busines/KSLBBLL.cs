using DataAccess;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Busines
{
    public class KSLBBLL : IDisposable
    {
        DaoKSLB Dao = new DaoKSLB();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }

           
        }
        public int Insert(KSLB kslb)
        {
            return (int)Dao.Insert(kslb);
        }
        public int Update(KSLB kslb)
        {
            return Dao.Update(kslb);
        }
        public int Delete(KSLB kslb)
        {
            return Dao.Delete(kslb);
        }
        public List<KSLB> getListKslb()
        {
            return Dao.getListKslb();
        }
    }
}