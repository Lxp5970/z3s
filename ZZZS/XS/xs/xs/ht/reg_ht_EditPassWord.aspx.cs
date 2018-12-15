using System;
using System.Web.Services;
using Newtonsoft.Json;
using Entity;
using Busines;
using System.Web;

namespace xs.ht
{
    public partial class reg_ht_EditPassWord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]

        public static string showInfo()
        {
            int code = 1;
            string message = "返回成功";
            CheckTeacher user = HttpContext.Current.Session["teacheruser_"] as CheckTeacher;
            string userName = "";
            string Adduser = "";
            string TeacherName = "";
            if (user != null)
            {
                userName = user.UserName;
                Adduser = user.AddUser;
                TeacherName = user.TeacherName;
            }
            else
            {
                code = 0;
                message = "数据错误";
            }
            return JsonConvert.SerializeObject(new { code = code, message = message, user = user, });
        }

        [WebMethod]
        public static string editPass(string UserName, string password)
        {
            int code = 1;
            string message = "修改密码成功";
            CheckTeacher edituser = new CheckTeacher();
            try
            {
                using (CheckTeacherBLL bll = new CheckTeacherBLL())
                {
                    edituser = bll.getTeacherUser(UserName);
                    bll.getCheckTeacher(edituser.Id);
                    edituser.Password = password;

                    bll.Update(edituser);
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
                message = message,
            });
        }
    }
}

