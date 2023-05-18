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

        #region [--- API METHODS ---]
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
                status = _bizUserService.UploadDocument(mapPath, document);
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

       
        #endregion
    }
}