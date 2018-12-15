using DataAccess;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Busines
{
    public class BYLBBLL : IDisposable
    {
        DaoBYLB Dao = new DaoBYLB();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }

            {
            }
        }
        public int Insert(BYLB bylb)
        {
            return (int)Dao.Insert(bylb);
        }
        public int Update(BYLB bylb)
        {
            return Dao.Update(bylb);
        }
        public int Delete(BYLB bylb)
        {
            return Dao.Delete(bylb);
        }
        public List<BYLB> getListBylb()
        {
            return Dao.getListBylb();
        }
    }
}
