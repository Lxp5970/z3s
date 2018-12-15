using DataAccess;
using Entity;
using PetaPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Busines
{
     public class StudentInfoBLL : IDisposable
    {
        DaoStudentInfo Dao = new DaoStudentInfo();
        public void Dispose()
        {
            if (Dao != null) { Dao.Dispose(); }
        }
        public string Insert(StudentInfo info)
        {
            return (string)Dao.Insert(info);
        }
        public int Update(StudentInfo info)
        {
            return Dao.Update(info);
        }
        public int Delete(StudentInfo info)
        {
            return Dao.Delete(info);
        }
        public StudentInfo getEntity(string sfzh)
        {
            return Dao.GetEntity(sfzh);
        }
        /// <summary>
        /// 判断是否新注册
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public bool isNew(StudentInfo info)
        {
            return Dao.IsNew(info);
        }
        public virtual void Save(StudentInfo info)
        {
            Dao.Save(info);
        }
        /// <summary>
        ///通过sql语句返回指定数量的分页数据
        /// </summary>
        /// <param name="pageIndex">返回第几页数据</param>
        /// <param name="pageSize">分页长度</param>
        /// <returns></returns>
        public Page<StudentInfo> getStuInfoPage(int pageIndex, int pageSize)
        {
            return Dao.getStuInfoPage(pageIndex, pageSize);
        }
    }
}
