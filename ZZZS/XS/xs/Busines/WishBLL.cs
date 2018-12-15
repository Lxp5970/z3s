using DataAccess;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Busines
{
    public class WishBLL : IDisposable
    {
        DaoWish Dao = new DaoWish();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }

        }
        public string Insert(Wish wish)
        {
            return (string)Dao.Insert(wish);
        }
        public int Update(Wish wish)
        {
            return Dao.Update(wish);
        }
        public int Delete(Wish wish)
        {
            return Dao.Delete(wish);
        }
        public bool isNew(Wish wish)
        {
            return Dao.IsNew(wish);
        }
        public virtual void Save(Wish wish)
        {
            Dao.Save(wish);
        }
        public Wish getEntity(string sfzh)
        {
            return Dao.GetEntity(sfzh);
        }
    }
}
