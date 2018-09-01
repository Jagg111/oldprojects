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
        //
        // GET: /AddonManager/

        public ActionResult Index()
        {
            var addonsList = GameonRepository.GetAddons();
            return View(addonsList);
        }

        //
        // GET: /AddonManager/Details/5

        //public ActionResult Details(int id)
        //{
        //    return View();
        //}

        //
        // GET: /AddonManager/Create

        public ActionResult Create()
        {
            
            //SelectList gameList = new SelectList(gmdb.Games.ToList(), "IDNumber", "Title");



            //ViewData["Games_List"] = gameList;

            //ViewData.Model = new Game();

            return View();
        } 

        //
        // POST: /AddonManager/Create

        [HttpPost]
        public ActionResult Create(Addon addon, HttpPostedFileBase Avatar)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Upload the image
                    if (Avatar != null && Avatar.ContentLength > 0)
                    {
                        var fileName = Path.GetFileName(Avatar.FileName);
                        var path = Path.Combine(Server.MapPath("~/Content/userUploads"), fileName);
                        Avatar.SaveAs(path);
                        addon.Avatar = "/Content/userUploads/" + fileName;
                    }
                    // Create the addon
                    GameonRepository.CreateAddon(addon);
                    return RedirectToAction("Index");
                }
                catch
                {
                    return RedirectToAction("Index");
                }
            }
            else
            {
                return RedirectToAction("Index");
            }     
        }
        
        //
        // GET: /AddonManager/Edit/5
 
        public ActionResult Edit(int id)
        {
            Addon addonPick = GameonRepository.GetAddon(id);

            var viewModel = new AddonManagerViewModel()
            {
                Addon = addonPick,
                Games = new SelectList(gmdb.Games.ToList(), "IDNumber", "Title", addonPick.GameID)
            };

            return View(viewModel);
        }

        //
        // POST: /AddonManager/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            Addon addonPick = GameonRepository.GetAddon(id);
            try
            {
                UpdateModel(addonPick);
                GameonRepository.Save();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /AddonManager/Delete/5
 
        public ActionResult Delete(int id)
        {
            Addon addonPick = GameonRepository.GetAddon(id);
            return View(addonPick);
        }

        //
        // POST: /AddonManager/Delete/5

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
