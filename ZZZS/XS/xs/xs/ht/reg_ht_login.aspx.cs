using Newtonsoft.Json;
using System;
using System.Web;
using System.Web.Services;
using Entity;
using Busines;
using Common;
using System.Configuration;

namespace xs.ht
{
    public partial class reg_ht_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string login_ht(string userName, string password)
        {
            int code = 1;
            string message = "登陆成功";
            CheckTeacher user;
            string DesPass = MD5Helper.DesEncrypt(password);
            using (CheckTeacherBLL bll = new CheckTeacherBLL())
            {
                user = bll.getTeacherUser(userName);
            }
            if (user == null)
            {
                code = 0;
                message = "您输入的用户不存在！";
            }
            else if (user.Password != DesPass)
            {
                
                code = 0;
                message = "您输入的密码错误！";
            }
            if (code == 1)
            {
                HttpContext.Current.Session["teacheruser_"] = user;
            }
            string str3 = JsonConvert.SerializeObject(new { code = code, message = message, user = user });
            return str3;
        }
        [WebMethod]
        public static string loginOut()
        {
            int code = 1;
            string message = "返回数据成功";
            CheckTeacher user = HttpContext.Current.Session["teacheruser_"] as CheckTeacher;
            try
            {
                if (user != null)
                {
                    HttpContext.Current.Session.Clear();
                }
            }
            catch (Exception)
            {
                code = 0;
                message = "退出登陆失败";
            }
            return JsonConvert.SerializeObject(new
            {
                code = code,
                message = message,
                user = user
            });
        }
    }
}