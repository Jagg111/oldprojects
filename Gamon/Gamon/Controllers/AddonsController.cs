using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gamon.Models;

namespace Gamon.Controllers
{
    public class AddonsController : Controller
    {
        // Data Setup
        private GameonDataContext gmdb = new GameonDataContext();
        GameonRepository GameonRepository = new GameonRepository();

        // GET: /addons
        [OutputCache(Duration = 60, VaryByParam = "none")] //caching output - see timestamps on web page
        public ActionResult Index()
        {
            var addonsList = GameonRepository.GetAddons();

            // ---- Test query to do some grouping to list addons ----
            //var addonsList = from ad in gmdb.vw_Addons
            //                 group ad by ad.GameTitle into adgm
            //                 orderby adgm.Key
            //                 select adgm;

            return View(addonsList);
        }

        // GET: /addons/details?id=x
        public ActionResult Details(int id)
        {
            var addon = GameonRepository.GetAddonExpanded(id);
            return View(addon);
        }

        [OutputCache(Duration = 60, VaryByParam = "slug")] //caching output - see timestamps on web page
        public ActionResult Game(string slug) // parameters for game selection sent as a slug to keep clean url names (similar to curse)
        {
            var gameAddons = GameonRepository.GetGameBySlug(slug);
            return View(gameAddons);
        }
    }
}
