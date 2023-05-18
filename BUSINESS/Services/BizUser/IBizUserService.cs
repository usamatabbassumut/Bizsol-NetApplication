using MODELS.BizUser;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUSINESS.Services.BizUser
{
    public interface IBizUserService
    {
        IEnumerable<BizUserViewModel> GetAllUsers();
        BizUserViewModel GetUserById(long id);
        Task InsertUpdateUser(BizUserViewModel model);
        Task DeleteUser(long id);
    }
}
