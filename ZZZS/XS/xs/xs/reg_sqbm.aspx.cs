using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Busines;
using Entity;
using Newtonsoft.Json;
using System.Text.RegularExpressions;
using Common;

namespace xs
{
    public partial class reg_sqbm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string getStuTypeList()
        {
            //int code = 1;
            // String message = "成功";
            List<StudentsType> _list = new List<StudentsType>();
            StudentsTypeBLL bll = new StudentsTypeBLL();
            {
                _list = bll.getStuTypeList();
            }
            return JsonConvert.SerializeObject(_list);
        }
        /// <summary>
        /// 插入新的数据到数据库
        /// </summary>
        /// <param name="Sfzh"></param>
        /// <param name="Password"></param>
        /// <param name="Zkzh"></param>
        /// <param name="StuName"></param>
        /// <param name="StuType"></param>
        /// <param name="Mobile"></param>
        /// <param name="E_mail"></param>
        /// <returns></returns>
        [WebMethod]
        public static string insterStuUser(string Sfzh, string Password, string Zkzh, string StuName, string StuType, string Mobile, string E_mail)
        {
            int code = 0;
            int _list;
            string message = "错误";
            StudentsUser stuUser = new StudentsUser();
            stuUser.Sfzh = Sfzh;
            stuUser.Password = MD5Helper.DesEncrypt(Password);
            stuUser.Zkzh = Zkzh;
            stuUser.StuName = StuName;
            stuUser.StuType = int.Parse(StuType);
            stuUser.Mobile = Mobile;
            stuUser.E_mail = E_mail;
            stuUser.Bz = "";
            stuUser.Certificate = "";
            stuUser.CheckTime = DateTime.Parse("1900-01-01");
            stuUser.CriterionCouse = "";
            stuUser.IsCheck = 0;
            stuUser.IsCriterion = 0;
            stuUser.IsPlan = 0;
            stuUser.LastLoginDate = DateTime.Now;
            stuUser.SignUpNum = "00";
            stuUser.State = 1;
            stuUser.RegDate = DateTime.Now;
            try
            {

                using (StudentsUserBLL bll = new StudentsUserBLL())
                {
                    _list = bll.Insert(stuUser);
                    Random ran = new Random();
                    int RandKey = ran.Next(1000, 9999);
                    //stuUser.SignUpNum = RandKey.ToString().PadLeft(6, '0');
                    stuUser.SignUpNum = _list.ToString().PadLeft(6, '0');
                    bll.Update(stuUser);
                    code = 1;
                    message = "注册成功!用户名为" + bll.getStudentsUserBySignSfzh(stuUser.Sfzh).SignUpNum;
                }

            }
            catch (Exception)
            {

                message = "注册失败!";
            }
            //string str3 = string.Format("{\"code\":\"0\",,\"message\":\"{1}\"}", code, message);//
            string str3 = JsonConvert.SerializeObject(new { code = code, message = message });
            return str3;

        }
    }
}