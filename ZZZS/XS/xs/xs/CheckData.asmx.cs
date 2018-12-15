using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Busines;
using Common;

namespace xs
{
    /// <summary>
    /// CheckData 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
     [System.Web.Script.Services.ScriptService]
    public class CheckData : System.Web.Services.WebService
    {

        //[WebMethod]
        //public string HelloWorld()
        //{
        //    return "Hello World";
        //}
        /// <summary>
        /// 检测身份证号在数据库是否存在，，唯一
        /// </summary>
        /// <param name="sfzh"></param>
        /// <returns></returns>
        [WebMethod]
        public string isHavaBySfzh(string sfzh)
        {
            string re = string.Empty;
            using (StudentsUserBLL bll =new StudentsUserBLL())
            {
                re = bll.isHaveBySfzh(sfzh) == false ? "true" : "改身份证号已经注册，请使用找回用户名或密码";
            }
            if (re=="true")
            {
                IDCardValidation idval = new IDCardValidation();
                //if (idval.CheckIDCard18(sfzh) == false)
                //{
                //    re = "身份证号格式不正确，请检查！";
                //}
                re = idval.CheckIDCard18(sfzh) == false ? "身份证号格式不正确，请检查！" : re;
            }
                return re;
        }
    }
}
