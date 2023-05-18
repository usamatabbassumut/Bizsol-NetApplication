using INFRASTRUCTURE.Entities;
using INFRASTRUCTURE.Repositories.BizUser;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
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
        private readonly IConfiguration _configuration;

        public BizUserService(IBizUserRepository bizUserRepository, IConfiguration configuration)
        {
            _bizUserRepository = bizUserRepository;
            _configuration = configuration;
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

        public bool UploadDocument(string mapPath, IFormFile file)
        {
            bool status = false;
            try
            {
                if (file != null && file.Length > 0)
                {
                    //Delete Previous File for edit document in AttachDocument form
                    string fileName = file.FileName;
                    string path = Path.Combine(mapPath, _configuration["BizSolUploads:User"] + fileName);
                    FileInfo file2 = new FileInfo(path);
                    if (file2.Exists)//check file exsit or not
                    {
                        try
                        {
                            file2.Delete();
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.Message);
                        }
                    }

                    try
                    {

                        //Set the Image File Path.
                        string filePath = Path.Combine(mapPath, _configuration["BizSolUploads:User"] + fileName);
                        //Save the Image File in Folder.
                        file.CopyTo(new FileStream(filePath, FileMode.Create));
                        status = true;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return status;
        }
    }
}
