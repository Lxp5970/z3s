using DataAccess;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Busines
{
    public class CheckTeacherBLL : IDisposable
    {
        DaoCheckTeacher Dao = new DaoCheckTeacher();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }

        }
        public CheckTeacher getCheckTeacher(int Id)
        {
            return Dao.GetEntity(Id);
        }
        public int Update(CheckTeacher teacher)
        {
            return Dao.Update(teacher);
        }
        public int delete(CheckTeacher teacher)
        {
            return Dao.Delete(teacher);
        }
        public int Insert(CheckTeacher teacher)
        {
            return (int)Dao.Insert(teacher);
        }
        public CheckTeacher getTeacherUser(string username)
        {
            return Dao.getTeacherUser(username);
        }
    }
}
