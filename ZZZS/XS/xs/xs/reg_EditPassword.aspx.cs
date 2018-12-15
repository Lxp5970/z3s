using System;
using System.Web.Services;
using Entity;
using Newtonsoft.Json;
using Busines;
using System.Web;
using Common;

namespace xs
{
    public partial class reg_EditPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        /// <summary>
        /// 返回前台现实的信息
        /// </summary>
        /// <param name="id"></param>
        /// <param name="time"></param>
        /// <returns></returns>
        [WebMethod]

        public static string showInfo(string id, string time)
        {
            int code = 1;
            string message = "返回成功";
            string userSignUpNum = "";
            string userSfzh = "";
            string stuName = "";
            int id_ = int.Parse(MD5Helper.DesDecrypt(id));
            string time_ = MD5Helper.DesDecrypt(time);
            TimeSpan tSpan = DateTime.Now - DateTime.Parse(time_);
            if (tSpan.TotalMinutes > 10)
            {
                code = 0;
                message = "本链接已过期，请重新在网站上重置密码！";
            }
            else
            {
                StudentsUser user = new StudentsUser();
                using (StudentsUserBLL bll = new StudentsUserBLL())
                {
                    
                    user = bll.getStudentsUser(id_);
                }
                userSignUpNum = user.SignUpNum;
                userSfzh = user.Sfzh;
                stuName = user.StuName;
            }

            return JsonConvert.SerializeObject(new { code = code, message = message, userSignUpNum = userSignUpNum, userSfzh = userSfzh, stuName = stuName });
        }

        [WebMethod]
        public static string editPass(int id, string password)
        {
            int code = 0;
            string message = "返回成功";
            StudentsUser user = new StudentsUser();
            try
            {
                using (StudentsUserBLL bll = new StudentsUserBLL())
                {
                    user = bll.getStudentsUser(id);
                    user.Password = password;
                    bll.Update(user);
                }
            }
            catch (Exception)
            {

                code = 0;
                message = "修改密码错误！";
            }
            return JsonConvert.SerializeObject(new
            {
                code = code,
                message = message
            });
        }
    }
}