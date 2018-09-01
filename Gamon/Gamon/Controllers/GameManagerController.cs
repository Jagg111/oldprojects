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
    public class GameManagerController : Controller
    {
        // Data Setup
        GameonRepository GameonRepository = new GameonRepository();

        // GET: /gamemanager/
        public ActionResult Index()
        {
            var gamesList = GameonRepository.GetGames();
            return View(gamesList);
        }

        // Leaving details section out since they are listed on the index for gamenmanager and in the edit page
        // GET: /GameManager/Details/5
        //public ActionResult Details(int id)
        //{
        //    return View();
        //}

        // GET: /gamemanager/create
        public ActionResult Create()
        {
            return View();
        } 

        // POST: /gamemanager/create
        [HttpPost]
        public ActionResult Create(Game game, HttpPostedFileBase Avatar)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Upload the image
                    if (Avatar != null && Avatar.ContentLength > 0 && (Avatar.ContentType == "image/jpeg" || Avatar.ContentType == "image/png"))
                    {
                        var fileName = Path.GetFileName(Avatar.FileName);
                        var path = Path.Combine(Server.MapPath("~/Content/ImageUploads/Games"), fileName);
                        Avatar.SaveAs(path);
                        game.Avatar = "/Content/ImageUploads/Games/" + fileName;
                    }
                    else
                    {
                        game.Avatar = "/Content/ImageUploads/Games/placeholder.jpg";
                    }
                    // Create the game
                    GameonRepository.CreateGame(game);
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
        // GET: /gamemanager/edit?id=x

        public ActionResult Edit(int id)
        {
            Game gamePick = GameonRepository.GetGame(id);
            return View(gamePick);
        }

        //
        // POST: /gamemanager/edit?id=x

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection, HttpPostedFileBase Avatar)
        {
            // Get game to update
            Game gamePick = GameonRepository.GetGame(id);
            try
            {
                // Get the current avatar for the game and save to a temp var
                //   do this because the update will wipe out the original avatar
                var reserveAvatar = gamePick.Avatar;
                UpdateModel(gamePick);
                GameonRepository.Save();

                // Check for a new image and update the avatar (since it got wiped out b/c of the update)
                if (Avatar != null && Avatar.ContentLength > 0 && (Avatar.ContentType == "image/jpeg" || Avatar.ContentType == "image/png"))
                {
                    var fileName = Path.GetFileName(Avatar.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/ImageUploads/Games"), fileName);
                    Avatar.SaveAs(path);
                    var NewAvatar = "/Content/ImageUploads/Games/" + fileName;
                    GameonRepository.UpdateAvatar(id, NewAvatar, "Game");
                }
                else if (Avatar == null)
                {
                    GameonRepository.UpdateAvatar(id, reserveAvatar, "Game");
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: /gamemanager/delete?id=x
 
        public ActionResult Delete(int id)
        {
            var gamePick = GameonRepository.GetGameWithAdds(id);
            return View(gamePick);
        }

        // POST: /gamemanager/delete?id=x

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            GameonRepository.DeleteGame(id);
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
