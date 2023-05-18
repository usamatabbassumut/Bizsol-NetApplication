using INFRASTRUCTURE.EFRepository;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using MODELS.BizUser;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INFRASTRUCTURE.Repositories.BizUser
{
    public class BizUserRepository : Repository<INFRASTRUCTURE.Entities.BizUser>, IBizUserRepository
    {
        private readonly IWebHostEnvironment _webHostEnvironment;

        public BizUserRepository(ApplicationDbContext dbContext, IWebHostEnvironment webHostEnvironment) : base(dbContext)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        public IEnumerable<BizUserViewModel> GetAllUsers()
        {
            return GetAll().Where(x => x.IsDeleted != true).Select(c => new BizUserViewModel
            {
                BizUserId = c.Id,
                UserName = c.UserName,
                Email = c.Email,
                Phone = c.Phone,
                Address = c.Address,
                FileName = String.IsNullOrEmpty(c.FileName)?"noimage.png": c.FileName,
                //FileName=string.IsNullOrEmpty(c.FileName)?"":Path.Combine(_webHostEnvironment.WebRootPath, "CustomUploads\\user\\" + c.FileName),
            });
        }

        public BizUserViewModel GetUserById(long id)
        {
            return GetAll().Where(x => x.Id == id).Select(c => new BizUserViewModel
            {
                BizUserId = c.Id,
                UserName = c.UserName,
                Email = c.Email,
                Phone = c.Phone,
                Address = c.Address,
                FileName = String.IsNullOrEmpty(c.FileName)?"noimage.png": c.FileName,
                //FileName = string.IsNullOrEmpty(c.FileName) ? "" : Path.Combine(_webHostEnvironment.WebRootPath, "CustomUploads\\user\\" + c.FileName),
            }).FirstOrDefault();
        }
    }
}
