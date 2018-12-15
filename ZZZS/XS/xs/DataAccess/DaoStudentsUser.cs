using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using PetaPoco;

namespace DataAccess
{
    public class DaoStudentsUser : Base.DaoBase<StudentsUser>
    {
        public bool isHavaBySfzh(string sfzh)
        {
            if (base.FirstOrDefault("select * from StudentsUser where Sfzh =@0", sfzh) != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 通过考生的身份证号返回考生id
        /// </summary>
        /// <param name="sfzh">身份证号</param>
        /// <returns>id</returns>
        public StudentsUser getStuBySfzh(string sfzh)
        {
            return base.FirstOrDefault("select * from StudentsUser where Sfzh=@0", sfzh);
        }
        /// <summary>
        /// 通过登录名返回考生信息
        /// </summary>
        /// <param name="SignUpNum">登录名</param>
        /// <returns></returns>
        public StudentsUser getStudentsUserBySignUpNum(string SignUpNum)
        {
            return base.FirstOrDefault("select * from StudentsUser where SignUpNum=@0", SignUpNum);
        }/// <summary>
         /// 
         /// </summary>
         /// <param name="SignUpNum"></param>
         /// <returns></returns>
        public StudentsUser getStudentsUserBySignSfzh(string Sfzh)
        {
            return base.FirstOrDefault("select * from StudentsUser where Sfzh=@0", Sfzh);
        }
        /// <summary>
        /// 返回指定页的考生信息
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSzie"></param>
        /// <returns></returns>
        public Page<StudentsUser> getStuUserPage(int pageIndex, int pageSzie)
        {
            return base.Page(pageIndex, pageSzie, "select Id,Sfzh,StuName,Zkzh,Mobile from StudentsUser");
        }
        /// <summary>
        /// 返回StudentUser List数据
        /// </summary>
        /// <returns></returns>
        public List<StudentsUser> getStudentUser()
        {
            return base.GetList("select * from StudentsUser");
        }
    }
}
