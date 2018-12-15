using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using Entity;
namespace Busines
{
    public class NationBLL : IDisposable
    {
        DaoNation Dao = new DaoNation();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }
           
        }
        public int Insert(Nation nation)
        {
            return (int)Dao.Insert(nation);
        }
        public int Update(Nation nation)
        {
            return Dao.Update(nation);
        }
        public int Delete(Nation nation)
        {
            return Dao.Delete(nation);
        }
        public List<Nation> getListNation()
        {
            return Dao.getListNation();
        }
        public Nation getNationName(string NationCode)
        {
            return Dao.getNationName(NationCode);
        }
    }
}
