using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using DataAccess;
using PetaPoco;

namespace Busines
{
    public class StudentsUserBLL : IDisposable
    {
        DaoStudentsUser Dao = new DaoStudentsUser();

        public int Insert(StudentsUser user)
        {
            return (int)Dao.Insert(user);
        }
        public void Dispose()
        {
            Dao.Dispose();
        }
        public int Update(StudentsUser user)
        {
            return (int)Dao.Update(user);
        }
        public StudentsUser GetEntity(int id)
        {
            return Dao.GetEntity(id);
        }
        public StudentsUser getStudentsUserBySignUpNum(string SignUpNum)
        {
            return Dao.getStudentsUserBySignUpNum(SignUpNum);
        }
        public StudentsUser getStudentsUserBySignSfzh(string Sfzh)
        {
            return Dao.getStudentsUserBySignSfzh(Sfzh);
        }
        public StudentsUser getStubySfzh(string sfzh)
        {
            return Dao.getStuBySfzh(sfzh);
        }
        /// <summary>
        /// 判断身份证号码游湖是否存在
        /// </summary>
        /// <param name="sfzh"></param>
        /// <returns></returns>
        public bool isHaveBySfzh(String sfzh)
        {
            return Dao.isHavaBySfzh(sfzh);
        }
        public StudentsUser getStudentsUser(int id)
        {
            return Dao.GetEntity(id);
        }
        public Page<StudentsUser> getStuUserPage(int pageIndex, int pageSzie)
        {
            return Dao.getStuUserPage(pageIndex, pageSzie);
        }
        /// <summary>
        /// 返回StudentUser List数据
        /// </summary>
        /// <returns></returns>
        public List<StudentsUser> getStudentUser()
        {
            return Dao.getStudentUser();
        }

    }
}
