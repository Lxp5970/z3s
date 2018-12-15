using DataAccess;
using Entity;
using System;
using System.Collections.Generic;


namespace Busines
{
    public class ZYBLL:IDisposable
    {
        DaoZY Dao = new DaoZY();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }

            {
            }
        }
        public int Insert(ZY zy)
        {
            return (int)Dao.Insert(zy);
        }
        public int Update(ZY zy)
        {
            return Dao.Update(zy);
        }
        public int Delete(ZY zy)
        {
            return Dao.Delete(zy);
        }
        public List<ZY> getListZy()
        {
           return Dao.getListZy();
        }
        public string getZymcByZydm(string zydm)
        {
            return Dao.getZymcByZydm(zydm);
        }
    }
}
