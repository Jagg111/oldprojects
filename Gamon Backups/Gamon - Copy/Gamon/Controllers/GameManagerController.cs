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
        //
        // GET: /GameManager/

        public ActionResult Index()
        {
            var gamesList = GameonRepository.GetGames();
            return View(gamesList);
        }

        //
        // GET: /GameManager/Details/5

        //public ActionResult Details(int id)
        //{
        //    return View();
        //}

        //
        // GET: /GameManager/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /GameManager/Create

        [HttpPost]
        public ActionResult Create(Game game, HttpPostedFileBase Cover)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    //Upload the image
                    if (Cover != null && Cover.ContentLength > 0 && (Cover.ContentType == "image/jpeg" || Cover.ContentType == "image/png"))
                    {
                        var fileName = Path.GetFileName(Cover.FileName);
                        var path = Path.Combine(Server.MapPath("~/Content/userUploads"), fileName);
                        Cover.SaveAs(path);
                        game.Cover = "/Content/userUploads/" + fileName;
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
        // GET: /GameManager/Edit/5
 
        public ActionResult Edit(int id)
        {
            Game gamePick = GameonRepository.GetGame(id);
            return View(gamePick);
        }

        //
        // POST: /GameManager/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            Game gamePick = GameonRepository.GetGame(id);
            try
            {
                UpdateModel(gamePick);
                GameonRepository.Save();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: /GameManager/Delete/5
 
        public ActionResult Delete(int id)
        {
            var gamePick = GameonRepository.GetGame(id);
            return View(gamePick);
        }

        // POST: /GameManager/Delete/5

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
