﻿using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Newtonsoft.Json;
using Entity;
using Busines;
using System.Collections.Generic;
using Aspose.Words;
using System.IO;
using Aspose.Words.Drawing;

namespace xs
{
    public partial class reg_EntityInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string getSelectInfo(string id)
        {
            int code = 1;
            string message = "返回数据成功";
            string str3 = string.Empty;
            if (HttpContext.Current.Session["user_"] == null)
            {
                code = 0;
                message = "您还没有登录，请您登录！";
                str3 = JsonConvert.SerializeObject(new
                {
                    code = code,
                    message = message
                });
            }
            else
            {
                StudentsUser user = new StudentsUser();
                if (HttpContext.Current.Session["user_"] == null && id != "0")
                {
                    using (StudentsUserBLL bll = new StudentsUserBLL())
                    {
                        user = bll.GetEntity(int.Parse(id));
                    }
                }
                else if (HttpContext.Current.Session["user_"] != null)
                {
                    user = HttpContext.Current.Session["user_"] as StudentsUser;
                }
                List<Nation> listNation = new List<Nation>();//民族列表
                List<ZZMM> listZZMM = new List<ZZMM>();//政治面貌
                List<AreaCode_> listShiAreaCode = new List<AreaCode_>();//城市列表
                List<KSLB> listKslb = new List<KSLB>();//考生类别
                List<BYLB> listBylb = new List<BYLB>();//毕业类别
                List<ZY> listZy = new List<ZY>();//专业名称
                StudentInfo stuInfo = new StudentInfo();
                Wish wish = new Wish();//考生志愿信息
                ZY Zy_ = new ZY();
                if (user != null)
                {
                    using (NationBLL bll = new NationBLL())
                    {
                        listNation = bll.getListNation();
                    }
                    using (ZZMMBLL bll = new ZZMMBLL())
                    {
                        listZZMM = bll.getZZMMList();
                    }
                    using (AreaCodeBLL bll = new AreaCodeBLL())
                    {
                        listShiAreaCode = bll.getShiAreaCode();
                    }
                    using (KSLBBLL bll = new KSLBBLL())
                    {
                        listKslb = bll.getListKslb();
                    }
                    using (BYLBBLL bll = new BYLBBLL())
                    {
                        listBylb = bll.getListBylb();
                    }
                    using (ZYBLL bll = new ZYBLL())
                    {
                        listZy = bll.getListZy();
                    }
                    using (StudentInfoBLL bll = new StudentInfoBLL())
                    {
                        stuInfo = bll.getEntity(user.Sfzh);
                        if (stuInfo != null)
                        {
                            HttpContext.Current.Session["PicPath_"] = stuInfo.PicPath;
                        }
                    }
                    using (WishBLL bll = new WishBLL())
                    {
                        wish = bll.getEntity(user.Sfzh);
                    }
                }
                else
                {
                    code = 0;
                    message = "请您登陆后再填写详细信息！";
                }

                str3 = JsonConvert.SerializeObject(new
                {
                    code = code,
                    message = message,
                    listNation = listNation,
                    ListZZMM = listZZMM,
                    listShiAreaCode = listShiAreaCode,
                    listKslb = listKslb,
                    listBylb = listBylb,
                    listZy = listZy,
                    user = user,
                    stuInfo = stuInfo,
                    wish = wish,

                }
                );
            }
            return str3;
        }
        [WebMethod]
        public static string getXianByShi(string shiCode)
        {
            int code = 1;
            string message = "返数据成功";
            List<AreaCode_> listXian = new List<AreaCode_>();
            using (AreaCodeBLL bll = new AreaCodeBLL())
            {
                listXian = bll.getXianAreaCodeByShiAreaCode(shiCode);
            }
            return JsonConvert.SerializeObject(new
            {
                code = code,
                message = message,
                listXian = listXian
            });
        }
        /// <summary>
        /// 保存信息到数据库
        /// </summary>
        /// <param name="SignUpNum"></param> 
        /// <param name="Zkzh"></param>
        /// <param name="Sfzh"></param>
        /// <param name="Mobile"></param>
        /// <param name="Nation"></param>
        /// <param name="ZZMM"></param>
        /// <param name="Health"></param>
        /// <param name="KSLB"></param>
        /// <param name="AreaCode"></param>
        /// <param name="Byxx"></param>
        /// <param name="BYLB"></param>
        /// <param name="LikeSpecial"></param>
        /// <param name="Tel"></param>
        /// <param name="Yzbm"></param>
        /// <param name="Txdz"></param>
        /// <param name="FrsZY"></param>
        /// <param name="SecZy"></param>
        /// <param name="IsAdjust"></param>
        /// <param name="AcceptPeople"></param>
        /// <returns></returns>
        [WebMethod]
        public static string saveInfo(string SignUpNum, string Zkzh, string Sfzh, string Mobile, string Nation,
            string ZZMM, int Health, string KSLB, string AreaCode, string Byxx, string BYLB, string LikeSpecial,
            string Tel, string Yzbm, string Txdz, string FrsZY, string SecZy, int IsAdjust, string AcceptPeople)
        {

            int code = 1;
            string message = "保存成功！！";
            string strCsrq = Sfzh.Substring(6, 4) + "-" + Sfzh.Substring(10, 2) + "-" + Sfzh.Substring(12, 2);
            int _XB = 0;//n女
            if (int.Parse(Sfzh.Substring(14, 3)) % 2 != 0)
            {
                _XB = 1;//男
            }
            string PicPath = HttpContext.Current.Session["PicPath_"].ToString();
            if (PicPath != null)
            {
                try
                {
                    StudentInfo _setInfo = new StudentInfo();
                    _setInfo.AcceptPeople = AcceptPeople;
                    _setInfo.AreaCode = AreaCode;
                    _setInfo.BYLB = BYLB;
                    _setInfo.Byyx = Byxx;
                    _setInfo.Csrq = DateTime.Parse(strCsrq);
                    _setInfo.Health = Health;
                    _setInfo.KSLB = KSLB;
                    _setInfo.LikeSpecial = LikeSpecial;
                    _setInfo.Mobile = Mobile;
                    _setInfo.Nation = Nation;
                    _setInfo.Sfzh = Sfzh;
                    _setInfo.Tel = Tel;
                    _setInfo.Txdz = Txdz;
                    _setInfo.Xb = _XB;
                    _setInfo.Yzbm = Yzbm;
                    _setInfo.ZZMM = ZZMM;
                    _setInfo.PicPath = PicPath;
                    using (StudentInfoBLL bll = new StudentInfoBLL())
                    {
                        if (bll.getEntity(Sfzh) == null)
                        {
                            bll.Insert(_setInfo);
                        }
                        else
                        {
                            bll.Update(_setInfo);
                        }
                    }
                    Wish _Wish = new Wish();
                    _Wish.IsAdjust = IsAdjust;
                    _Wish.FrsZY = FrsZY;
                    _Wish.SecZY = SecZy;
                    _Wish.Sfzh = Sfzh;
                    using (WishBLL bll = new WishBLL())
                    {

                        if (bll.getEntity(Sfzh) == null)
                        {
                            bll.Insert(_Wish);
                        }
                        else
                        {

                            bll.Update(_Wish);
                        }

                    }
                }
                catch (Exception)
                {
                    code = 0;
                    message = "数据合法性错误，请检查！";
                }
            }
            else
            {
                code = 0;
                message = "后台数据错误！！";
            }
            return JsonConvert.SerializeObject(new { code = code, message = message });
        }
        /// <summary>
        /// 打印信息
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static String printInfo()
        {
            int code = 1;
            string message = "打印成功！！";
            StudentsUser user = HttpContext.Current.Session["user_"] as StudentsUser;
            List<Nation> listNation = new List<Nation>();//民族列表
            List<ZZMM> listZZMM = new List<ZZMM>();//政治面貌
            List<AreaCode_> listShiAreaCode = new List<AreaCode_>();//城市列表
            List<KSLB> listKslb = new List<KSLB>();//考生类别
            List<BYLB> listBylb = new List<BYLB>();//毕业类别
            List<ZY> listZy = new List<ZY>();//专业名称
            StudentInfo stuInfo = new StudentInfo();
            Wish wish = new Wish();//考生志愿信息
            Nation nation_ = new Nation();
            AreaCode_ areaCode, areaShiCode = new AreaCode_();
            if (user != null)
            {

                using (NationBLL bll = new NationBLL())
                {
                    listNation = bll.getListNation();
                }
                using (ZZMMBLL bll = new ZZMMBLL())
                {
                    listZZMM = bll.getZZMMList();
                }
                using (AreaCodeBLL bll = new AreaCodeBLL())
                {
                    listShiAreaCode = bll.getShiAreaCode();
                }
                using (KSLBBLL bll = new KSLBBLL())
                {
                    listKslb = bll.getListKslb();
                }
                using (BYLBBLL bll = new BYLBBLL())
                {
                    listBylb = bll.getListBylb();
                }
                using (ZYBLL bll = new ZYBLL())
                {
                    listZy = bll.getListZy();
                }
                using (StudentInfoBLL bll = new StudentInfoBLL())
                {
                    stuInfo = bll.getEntity(user.Sfzh);
                    //if (stuInfo.PicPath.Trim().Length != null)
                    //{
                    //    HttpContext.Current.Session["PicPath_"] =stuInfo.PicPath;
                    //}
                }
                using (WishBLL bll = new WishBLL())
                {
                    wish = bll.getEntity(user.Sfzh);
                }
                Document doc = new Document(System.Web.HttpContext.Current.Server.MapPath("~/uploads") + "//templet.doc");
                foreach (Bookmark item in doc.Range.Bookmarks)
                {
                    if (item != null)
                    {
                        switch (item.Name)
                        {
                            case "SignUpNum":
                                item.Text = user.SignUpNum;
                                break;
                            ///sfzh
                            case "Sfzh_1":
                                item.Text = user.Sfzh.Substring(0, 1);
                                break;
                            case "Sfzh_2":
                                item.Text = user.Sfzh.Substring(1, 1);
                                break;
                            case "Sfzh_3":
                                item.Text = user.Sfzh.Substring(2, 1);
                                break;
                            case "Sfzh_4":
                                item.Text = user.Sfzh.Substring(3, 1);
                                break;
                            case "Sfzh_5":
                                item.Text = user.Sfzh.Substring(4, 1);
                                break;
                            case "Sfzh_6":
                                item.Text = user.Sfzh.Substring(5, 1);
                                break;
                            case "Sfzh_7":
                                item.Text = user.Sfzh.Substring(6, 1);
                                break;
                            case "Sfzh_8":
                                item.Text = user.Sfzh.Substring(7, 1);
                                break;
                            case "Sfzh_9":
                                item.Text = user.Sfzh.Substring(8, 1);
                                break;
                            case "Sfzh_10":
                                item.Text = user.Sfzh.Substring(9, 1);
                                break;
                            case "Sfzh_11":
                                item.Text = user.Sfzh.Substring(10, 1);
                                break;
                            case "Sfzh_12":
                                item.Text = user.Sfzh.Substring(11, 1);
                                break;
                            case "Sfzh_13":
                                item.Text = user.Sfzh.Substring(12, 1);
                                break;
                            case "Sfzh_14":
                                item.Text = user.Sfzh.Substring(13, 1);
                                break;
                            case "Sfzh_15":
                                item.Text = user.Sfzh.Substring(14, 1);
                                break;
                            case "Sfzh_16":
                                item.Text = user.Sfzh.Substring(15, 1);
                                break;
                            case "Sfzh_17":
                                item.Text = user.Sfzh.Substring(16, 1);
                                break;
                            case "Sfzh_18":
                                item.Text = user.Sfzh.Substring(17, 1);
                                break;
                            ///zkzh
                            case "Zkzh_1":
                                item.Text = user.Zkzh.Substring(0, 1);
                                break;
                            case "Zkzh_2":
                                item.Text = user.Zkzh.Substring(1, 1);
                                break;
                            case "Zkzh_3":
                                item.Text = user.Zkzh.Substring(2, 1);
                                break;
                            case "Zkzh_4":
                                item.Text = user.Zkzh.Substring(3, 1);
                                break;
                            case "Zkzh_5":
                                item.Text = user.Zkzh.Substring(4, 1);
                                break;
                            case "Zkzh_6":
                                item.Text = user.Zkzh.Substring(5, 1);
                                break;
                            case "Zkzh_7":
                                item.Text = user.Zkzh.Substring(6, 1);
                                break;
                            case "Zkzh_8":
                                item.Text = user.Zkzh.Substring(7, 1);
                                break;
                            case "Zkzh_9":
                                item.Text = user.Zkzh.Substring(8, 1);
                                break;
                            case "Zkzh_10":
                                item.Text = user.Zkzh.Substring(9, 1);
                                break;
                            case "Zkzh_11":
                                item.Text = user.Zkzh.Substring(10, 1);
                                break;
                            case "Zkzh_12":
                                item.Text = user.Zkzh.Substring(11, 1);
                                break;
                            case "Zkzh_13":
                                item.Text = user.Sfzh.Substring(12, 1);
                                break;
                            case "Zkzh_14":
                                item.Text = user.Sfzh.Substring(13, 1);
                                break;
                            ///picpath
                            case "PicPath":
                                DocumentBuilder builder = new DocumentBuilder(doc);
                                string imgPath = System.Web.HttpContext.Current.Server.MapPath("~/uploads") + "\\" + user.Sfzh + ".jpg";
                                if (File.Exists(imgPath))
                                {
                                    builder.MoveToBookmark("PicPath");
                                    builder.InsertImage(imgPath, RelativeHorizontalPosition.Margin, 1, RelativeVerticalPosition.Margin, 1, 80, 100, WrapType.Square);
                                }
                                break;
                            ///StuName
                            case "StuName":
                                item.Text = user.StuName;
                                break;
                            ///Tel
                            case "Tel":
                                item.Text = stuInfo.Tel;
                                break;
                            ///Txdz
                            case "Txdz":
                                item.Text = stuInfo.Txdz;
                                break;
                            ///Xb
                            case "Xb":
                                item.Text = (stuInfo.Xb == 0 ? "女" : "男");
                                break;
                            ///Yzbm
                            case "Yzbm":
                                item.Text = stuInfo.Yzbm;
                                break;
                            ///AcceptPeople
                            case "AcceptPeople":
                                item.Text = stuInfo.AcceptPeople;
                                break;
                            ///Byyx
                            case "Byyx":
                                item.Text = stuInfo.Byyx;
                                break;
                            ///Csrq
                            case "Csrq":
                                item.Text = stuInfo.Csrq.ToString("yyyy-MM-dd");
                                break;
                            ///Health
                            case "Health":
                                if (stuInfo.Health == 0) { item.Text = "好"; }
                                else if (stuInfo.Health == 1) { item.Text = "一般"; }
                                else if (stuInfo.Health == 2) { item.Text = "比较好"; }
                                else if (stuInfo.Health == 3) { item.Text = "差"; }
                                break;
                            ///IsAdjust
                            case "IsAdjust":
                                item.Text = (wish.IsAdjust == 0 ? "否" : "是");
                                break;
                            ///LikeSpecial
                            case "LikeSpecial":
                                item.Text = stuInfo.LikeSpecial;
                                break;
                            ///Mobile
                            case "Mobile":
                                item.Text = stuInfo.Mobile;
                                break;

                            ///Nation
                            case "Nation":
                                using (NationBLL bll = new NationBLL())
                                {
                                    nation_ = bll.getNationName(stuInfo.Nation);
                                }
                                item.Text = nation_.NationName.ToString();
                                break;
                            ///AreaCode
                            case "AreaCode":
                                using (AreaCodeBLL bll = new AreaCodeBLL())
                                {
                                    areaCode = bll.getAreaName(stuInfo.AreaCode.Substring(0, 4));
                                    areaShiCode = bll.getAreaName(stuInfo.AreaCode);
                                }
                                item.Text = areaCode.AreaName.ToString() + areaShiCode.AreaName.ToString();
                                break;
                            ///ZZMM
                            case "ZZMM":
                                var answerZzmm = (from p in listZZMM
                                                  where p.ZzmmDm == stuInfo.ZZMM
                                                  select p).Single();
                                item.Text = answerZzmm.ZzmmMc.ToString();
                                break;
                            ///BYLB
                            case "BYLB":
                                var answerBylb = (from p in listBylb
                                                  where p.BylbDm == stuInfo.BYLB
                                                  select p).Single();
                                item.Text = answerBylb.BylbMc.ToString();
                                break;
                            ///KSLB
                            case "KSLB":
                                var answerKslb = (from p in listKslb
                                                  where p.KslbDm == stuInfo.KSLB
                                                  select p).Single();
                                item.Text = answerKslb.KslbMc.ToString();
                                break;
                            ///FrsZY
                            case "FrsZY":
                                var answerFrszy = (from p in listZy
                                                   where p.ZYDM == wish.FrsZY.Trim()
                                                   select p);
                                string stringFrstzy = string.Empty;
                                foreach (var item1 in answerFrszy)
                                {
                                    stringFrstzy = item1.ZYMC;
                                }
                                item.Text = stringFrstzy.ToString();
                                break;
                            ///SecZY
                            case "SecZY":
                                var answerSeczy = (from pp in listZy
                                                   where pp.ZYDM == wish.SecZY.Trim()
                                                   select pp);
                                string stringSeczy = string.Empty;
                                foreach (var item2 in answerSeczy)
                                {
                                    stringSeczy = item2.ZYMC;
                                }
                                item.Text = stringSeczy.ToString();
                                break;
                        }
                    }
                    doc.Print();
                    //doc.Save("d:\\adc.doc");
                    message = "打印成功，请请前往D盘查看！！";
                }
            }
            else
            {
                code = 0;
                message = "打印失败，后台信息错误！";
            }
            return JsonConvert.SerializeObject(new { code = code, message = message });
        }
    }
}