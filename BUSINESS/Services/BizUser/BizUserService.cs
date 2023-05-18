using INFRASTRUCTURE.Entities;
using INFRASTRUCTURE.Repositories.BizUser;
using MODELS.BizUser;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUSINESS.Services.BizUser
{
    public class BizUserService : IBizUserService
    {
        private readonly IBizUserRepository _bizUserRepository;

        public BizUserService(IBizUserRepository bizUserRepository)
        {
            _bizUserRepository = bizUserRepository;
        }

        public IEnumerable<BizUserViewModel> GetAllUsers()
        {
            return _bizUserRepository.GetAllUsers();
        }

        public BizUserViewModel GetUserById(long id)
        {
            return _bizUserRepository.GetUserById(id);
        }

        public async Task InsertUpdateUser(BizUserViewModel model)
        {
            var user = await _bizUserRepository.Get(model.BizUserId);
            user=user==null?new INFRASTRUCTURE.Entities.BizUser():user;
            user.UserName = model.UserName;
            user.Email = model.Email;
            user.Address = model.Address;
            user.Phone=model.Phone;
            if(!string.IsNullOrEmpty(model.FileName))
            user.FileName = model.FileName;
            //save
            if (model.BizUserId == 0)
            {
                user.IsDeleted = false;
                user.CreatedDate = DateTime.Now;
                await _bizUserRepository.Add(user);
            }
            //update
            else
            {
                user.UpdatedDate = DateTime.Now;
                await _bizUserRepository.Change(user);
            }
        }

        public async Task DeleteUser(long id)
        {
            var user = await _bizUserRepository.Get(id);
            if (user == null)
                throw new Exception("User not found.");

            user.Id= id;
            user.DeletedDate = DateTime.Now;
            user.IsDeleted = true;
            await _bizUserRepository.Change(user);

        }
    }
}
