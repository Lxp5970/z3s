using Busines;
using Entity;
using Newtonsoft.Json;
using org.in2bits.MyXls;
using PetaPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace xs.ht
{
    public partial class reg_ht_ShowStuInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string getStudentInfoPage(int pageIndex, int pageSize)
        {
            int code = 1;
            string message = "返回数据成功";
            CheckTeacher user = HttpContext.Current.Session["teacheruser_"] as CheckTeacher;
            Page<StudentsUser> stuUserPage = new Page<StudentsUser>();
            if (user != null)
            {
                using (StudentsUserBLL bll = new StudentsUserBLL())
                {
                    stuUserPage = bll.getStuUserPage(pageIndex, pageSize);
                }
            }
            else
            {
                code = 0;
                message = "请您登陆后再填写详细信息！";
            }
            return JsonConvert.SerializeObject(new { code = code, message = message, stuUserPage = stuUserPage });
        }
        /// <summary>
        /// 返回分页数据到excle
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static string getAllDataToExcle()
        {
            int code = 1;
            string message = "返回数据成功";
            List<StudentsUser> ListUser = new List<StudentsUser>();
            using (StudentsUserBLL bll = new StudentsUserBLL())
            {
                ListUser = bll.getStudentUser();
            }

            XlsDocument xls = new XlsDocument();//建立excle工作表
            if (ListUser.Count != 0)
            {
                xls.FileName = DateTime.Now.ToString("u").Replace(":", "-").Replace("Z", "");
                Worksheet sheet = xls.Workbook.Worksheets.Add("考生数据");
                Cells cells = sheet.Cells;
                cells.Add(1, 1, "身份证号");
                cells.Add(1, 2, "姓名");
                cells.Add(1, 3, "准考证号");
                cells.Add(1, 4, "手机号");
                for (int i = 1; i <= ListUser.Count; i++)
                {
                    cells.Add(i + 1, 1, ListUser[i - 1].Sfzh);
                    cells.Add(i + 1, 2, ListUser[i - 1].StuName);
                    cells.Add(i + 1, 3, ListUser[i - 1].Zkzh);
                    cells.Add(i + 1, 4, ListUser[i - 1].Mobile);
                }
                xls.Save(HttpContext.Current.Server.MapPath("~/uploads") + "//");
            }
            return JsonConvert.SerializeObject(new
            {
                code = code,
                message = message,
                filePath = "uploads/" + xls.FileName,
            });
        }
        ///返回所有信息
        [WebMethod]
        public static string getstuAllInfoToExcle()
        {
            int code = 1;
            string message = "返回数据成功";
            List<StuAllInfo> ListUser = new List<StuAllInfo>();
            using (StuAllInfoBLL bll = new StuAllInfoBLL())
            {
                ListUser = bll.getStuAllInfo();
            }

            XlsDocument xls = new XlsDocument();//建立excle工作表
            if (ListUser.Count != 0)
            {
                xls.FileName = DateTime.Now.ToString("u").Replace(":", "-").Replace("Z", "") + ".xls";
                Worksheet sheet = xls.Workbook.Worksheets.Add("考生数据");
                Cells cells = sheet.Cells;
                cells.Add(1, 1, "身份证号");
                cells.Add(1, 2, "姓名");
                cells.Add(1, 3, "性别");
                cells.Add(1, 4, "准考证号");
                cells.Add(1, 5, "手机号");
                cells.Add(1, 6, "第一志愿");
                cells.Add(1, 7, "第二志愿");
                for (int i = 2; i < ListUser.Count; i++)
                {
                    cells.Add(i, 1, ListUser[i - 2].Sfzh);
                    cells.Add(i, 2, ListUser[i - 2].StuName);
                    cells.Add(i, 3, ListUser[i - 2].Xb == 1 ? "男" : "女");
                    cells.Add(i, 4, ListUser[i - 2].Zkzh);
                    cells.Add(i, 5, ListUser[i - 2].Mobile);
                    if (ListUser[i - 2].FrsZY != null)
                    {
                        cells.Add(i, 6, getZymcByZydm(ListUser[i - 2].FrsZY));
                    }
                    if (ListUser[i - 2].SecZY != null)
                    {
                        if (ListUser[i - 2].SecZY.Trim().Length != 0)
                        {
                            cells.Add(i, 7, getZymcByZydm(ListUser[i - 2].SecZY));
                        }
                        cells.Add(i, 7, getZymcByZydm(ListUser[i - 2].SecZY));
                    }
                }
                xls.Save(HttpContext.Current.Server.MapPath("~/uploads") + "//");

            }
            return JsonConvert.SerializeObject(new
            {
                code = code,
                message = message,
                filePath = "uploads/" + xls.FileName,
            });
        }
        private static string getZymcByZydm(string zybh)
        {
            string zymc = string.Empty;
            using (ZYBLL bll = new ZYBLL())
            {
                zymc = bll.getZymcByZydm(zybh);
            }
            return zymc;
        }
    }

}