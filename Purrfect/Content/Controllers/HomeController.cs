using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Purrfect.DAL;
using Purrfect.Models;

namespace Purrfect.Controllers
{
    public class HomeController : Controller
    {
        IForumDAL dal;
        public HomeController(IForumDAL dal)
        {
            this.dal = dal;
        }


        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Forum()
        {
            List<Forum> list = dal.GetAllReviews();

            return View("forum", list);
        }
        
        public ActionResult PurrfectQuote()
        {
            return View();
        }
        
        public ActionResult newReview(Forum review)
        {
            return View();
        }
        [HttpPost]
        public ActionResult NewReview(Forum review)
        {
            dal.SaveReview(review);
            return RedirectToAction("Forum");
        }

        public ActionResult QuoteMe(QuoteGeneratorModel model)
        {
            return View("QuoteMe", model);
        }

    }
}