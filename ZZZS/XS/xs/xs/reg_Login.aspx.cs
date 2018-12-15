using Busines;
using Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;

namespace xs
{
    public partial class reg_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Login1(string userName, string password)
        {
            int code = 1;
            string message = "登陆成功";
            StudentsUser user;
            //string DesPassword = MD5Helper.DesEncrypt(password);
            using (StudentsUserBLL bll = new StudentsUserBLL())
            {
                user = bll.getStudentsUserBySignUpNum(userName);
            }
            if (user == null)
            {
                code = 0;
                message = "您输入的用户不存在！";
            }
            else if (MD5Helper.DesDecrypt(user.Password) != password)
            {
                code = 0;
                message = "您输入的密码错误！";
            }
            if (code == 1)
            {
                HttpContext.Current.Session["user_"] = user;
            }
            string str3 = JsonConvert.SerializeObject(new { code = code, message = message, user = user });
            return str3;
        }
    }
}