using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gamon.Models;
using System.Web.UI;

namespace Gamon.Controllers
{
    public class HomeController : Controller
    {
        private GameonDataContext gmdb = new GameonDataContext();

        // GET: /home/
        [OutputCache(Duration = 60, VaryByParam = "filterby")] //caching output - see timestamps on web page
        public ActionResult Index(string filterby)
        {
            // Run a quick if statement to sort home page if a filter is set
            if (filterby == "2")
            {
                var Games = from g in gmdb.vw_GameWithAddons
                            orderby g.NumAddons descending, g.Title
                            select g;
                return View(Games);
            }
            else
            {
                var Games = from g in gmdb.vw_GameWithAddons
                            orderby g.Title
                            select g;
                return View(Games);
            }
        }
    }
}