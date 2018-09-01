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

        [OutputCache(Duration = 10, VaryByParam = "none")]
        public ActionResult Index()
        {
            var addonsList = GameonRepository.GetAddons();

            //var addonsList = from ad in gmdb.vw_Addons
            //                 group ad by ad.GameTitle into adgm
            //                 orderby adgm.Key
            //                 select adgm;

            return View(addonsList);
        }
        [OutputCache(Duration = 10, VaryByParam = "slug")]
        public ActionResult Game(string slug)
        {
            var gameAddons = GameonRepository.GetGameBySlug(slug);
            //var gamesList = from gm in gmdb.vw_GameWithAddons
            //                select gm.Title;
            return View(gameAddons);
        }
    }
}
