using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gamon.Models;
using System.IO;

namespace Gamon.Controllers
{
    // Leave out all caching on this controller to keep info fresh and updated
    public class AddonManagerController : Controller
    {
        // Data Setup
        GameonRepository GameonRepository = new GameonRepository();
        private GameonDataContext gmdb = new GameonDataContext();

        // GET: /addonmanager
        public ActionResult Index()
        {
            var addonsList = GameonRepository.GetAddons();
            return View(addonsList);
        }

        // Leaving details section out since they are listed on the index for addonmanager and in the edit page
        // GET: /addonmanager/Details/5
        //public ActionResult Details(int id)
        //{
        //    return View();
        //}

        // GET: /addonmanager/create
        public ActionResult Create()
        {
            // Setup AddonManagerViewModel to bring in addon form with dropdownlist of games
            var viewModel = new AddonManagerViewModel()
            {
                Addon = new Addon(),
                Games = new SelectList(gmdb.Games.ToList(), "IDNumber", "Title")
            };

            return View(viewModel);
        } 

        // POST: /addonmanager/create
        [HttpPost]
        public ActionResult Create(Addon addon, HttpPostedFileBase Avatar)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Upload the image
                    if (Avatar != null && Avatar.ContentLength > 0 && (Avatar.ContentType == "image/jpeg" || Avatar.ContentType == "image/png"))
                    {
                        var fileName = Path.GetFileName(Avatar.FileName);
                        var path = Path.Combine(Server.MapPath("~/Content/ImageUploads/Addons"), fileName);
                        Avatar.SaveAs(path);
                        addon.Avatar = "/Content/ImageUploads/Addons/" + fileName;
                    }
                    else
                    {
                        addon.Avatar = "/Content/ImageUploads/Addons/placeholder.jpg";
                    }
                    // Create the addon
                    GameonRepository.CreateAddon(addon);
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    //return RedirectToAction("Index");
                    ModelState.AddModelError(String.Empty, ex);
                }
                var viewModel = new AddonManagerViewModel()
                {
                    Addon = new Addon(),
                    Games = new SelectList(gmdb.Games.ToList(), "IDNumber", "Title")
                };

                return View(viewModel);

            }
            else
            {
                return RedirectToAction("Index");
            }     
        }
        
        // GET: /addonmanager/edit?id=x
        public ActionResult Edit(int id)
        {
            // Get the addon
            Addon addonPick = GameonRepository.GetAddon(id);

            // Setup AddonManagerViewModel to bring in addon and dropdownlist of games
            var viewModel = new AddonManagerViewModel()
            {
                Addon = addonPick,
                Games = new SelectList(gmdb.Games.ToList(), "IDNumber", "Title", addonPick.GameID)
            };

            return View(viewModel);
        }

        // POST: /addonManager/edit?id=x
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection, HttpPostedFileBase Avatar)
        {
            // Get the addon
            Addon addonPick = GameonRepository.GetAddon(id);
            try
            {
                // Get the current avatar for the game and save to a temp var
                //   do this because the update will wipe out the original avatar
                var reserveAvatar = addonPick.Avatar;
                UpdateModel(addonPick, "Addon");
                GameonRepository.Save();

                // Check for a new image and update the avatar (since it got wiped out b/c of the update)
                if (Avatar != null && Avatar.ContentLength > 0 && (Avatar.ContentType == "image/jpeg" || Avatar.ContentType == "image/png"))
                {
                    var fileName = Path.GetFileName(Avatar.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/ImageUploads/Games"), fileName);
                    Avatar.SaveAs(path);
                    var NewAvatar = "/Content/ImageUploads/Games/" + fileName;
                    GameonRepository.UpdateAvatar(id, NewAvatar, "Addon");
                }
                else if (Avatar == null)
                {
                    GameonRepository.UpdateAvatar(id, reserveAvatar, "Addon");
                }

                return RedirectToAction("Index");
            }
            catch
            {
                // Something bad happened, so bring back the form
                var viewModel = new AddonManagerViewModel()
                {
                    Addon = addonPick,
                    Games = new SelectList(gmdb.Games.ToList(), "IDNumber", "Title", addonPick.GameID)
                };

                return View(viewModel);
            }
        }

        // GET: /addonmanager/delete?id=x
        public ActionResult Delete(int id)
        {
            // Get the addon
            Addon addonPick = GameonRepository.GetAddon(id);
            return View(addonPick);
        }

        // POST: /addonmanager/delete?id=x
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            GameonRepository.DeleteAddon(id);
            try
            {
                GameonRepository.Save();
                return RedirectToAction("Index");

            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                // Provide for exceptions.
            }
            return RedirectToAction("Index");
        }
    }
}
