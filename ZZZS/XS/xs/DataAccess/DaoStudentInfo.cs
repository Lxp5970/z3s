using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using DataAccess.Base;
using PetaPoco;

namespace DataAccess
{
    public class DaoStudentInfo : DaoBase<StudentInfo>
    {
        /// <summary>
        /// 判断考生是否新注册
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public bool isNew(StudentInfo info)
        {
            return base.IsNew(info);
        }
        /// <summary>
        ///通过sql语句返回指定数量的分页数据
        /// </summary>
        /// <param name="pageIndex">返回第几页数据</param>
        /// <param name="pageSize">分页长度</param>
        /// <returns></returns>
        public Page<StudentInfo> getStuInfoPage(int pageIndex,int pageSize)
        {
           return  base.Page(pageIndex,pageSize,"select * from StudentInfo");
        }
    }
}
