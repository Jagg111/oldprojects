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

        //
        // GET: /Home/

        [OutputCache(Duration = 10, VaryByParam = "filterby")]
        public ActionResult Index(string filterby)
        {
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