using INFRASTRUCTURE.EFRepository;
using INFRASTRUCTURE.Entities;
using MODELS.BizUser;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INFRASTRUCTURE.Repositories.BizUser
{
    public interface IBizUserRepository:IRepository<INFRASTRUCTURE.Entities.BizUser>
    {
        IEnumerable<BizUserViewModel> GetAllUsers();
        BizUserViewModel GetUserById(long id);

    }
}
