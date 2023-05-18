using BizsolAssessment.Models;
using BUSINESS.Services.BizUser;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using MODELS.BizUser;
using System.Collections.Generic;
using System.Diagnostics;

namespace BizsolAssessment.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IBizUserService _bizUserService;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public HomeController(ILogger<HomeController> logger, IBizUserService bizUserService, IWebHostEnvironment webHostEnvironment)
        {
            _logger = logger;
            _bizUserService = bizUserService;
            _webHostEnvironment = webHostEnvironment;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public async Task<IActionResult> GetAllUsers()
        {
            var userList = _bizUserService.GetAllUsers();
            var jsonData = new { data = userList.ToList() };
            return Ok(jsonData);
        }
        [HttpPost]
        public async Task InsertUpdateUser(BizUserViewModel model)
        {
            await _bizUserService.InsertUpdateUser(model);
        }

        [HttpDelete]
        public async Task DeleteUser(long id)
        {
            await _bizUserService.DeleteUser(id);
        }

        [HttpPost]
        public IActionResult UploadDocument()
        {
            bool status = false;
            try
            {
                IFormFile document = Request.Form.Files[0] as IFormFile;
                string mapPath = _webHostEnvironment.WebRootPath;
                status = UploadDocument(mapPath, document);
            }
            catch
            {
                status = false;
            }

            return Json(new
            {
                status = status,
            });
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
                    string path = Path.Combine(mapPath, "CustomUploads\\user\\" + fileName);
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
                        string filePath = Path.Combine(mapPath, "CustomUploads\\user\\" + fileName);
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