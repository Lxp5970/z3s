using Entity;
using DataAccess.Base;
namespace DataAccess
{
    public class DaoCheckTeacher : DaoBase<CheckTeacher>
    {
        /// <summary>
        /// 根据用户名登陆
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public CheckTeacher getTeacherUser(string username)
        {
            return base.FirstOrDefault("select * from CheckTeacher where UserName=@0",username);
        }
    }
}
