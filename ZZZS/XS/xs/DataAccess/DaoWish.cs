using Entity;
using DataAccess.Base;
namespace DataAccess
{
    public class DaoWish : DaoBase<Wish>
    {
        //判断考生是否新注册
        public bool isNew(Wish wish)
        {
            return base.IsNew(wish);
        }
    }
}
