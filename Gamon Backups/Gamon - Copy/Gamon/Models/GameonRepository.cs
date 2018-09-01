using System;
using System.Collections.Generic;
using System.Linq;

namespace Gamon.Models
{
    public class GameonRepository
    {
        // Data Setup //
        private GameonDataContext gmdb = new GameonDataContext();

        //// Regular Select Queries ////

        public IQueryable<Game> GetGames()
        {
            return from gm in gmdb.Games
                   select gm;
        }

        public IQueryable<vw_Addon> GetAddons()
        {
            return from adg in gmdb.vw_Addons
                   select adg;
        }

        public Game GetGame(int id)
        {
            // --- original linq query ---
            //var gamePick = (from gm in gmdb.Games
            //                where gm.IDNumber == id
            //               select gm).FirstOrDefault();
            Game gamePick = gmdb.Games.Single(g => g.IDNumber == id);
            return (gamePick);
        }

        public IQueryable<vw_Addon> GetGameBySlug(string slug)
        {
            return from ad in gmdb.vw_Addons
                   where ad.GameSlug == slug
                   select ad;
        }

        public Addon GetAddon(int id)
        {
            Addon addonPick = gmdb.Addons.Single(ad => ad.IDNumber == id);
            return (addonPick);
        }

        //// Create Queries ////
        public void CreateAddon(Addon addon)
        {
            // --- original statements
            //gmdb.Games.InsertOnSubmit(addon);
            //gmdb.SubmitChanges();
            gmdb.Addons.InsertOnSubmit(addon);
            Save();
        }

        public void CreateGame(Game game)
        {
            gmdb.Games.InsertOnSubmit(game);
            Save();
        }

        //// Delete Queries ////
        public void DeleteGame(int id)
        {
            // --- original linq query
            //var deleteGame = from gm in gmdb.Games
            //                 where gm.IDNumber == id
            //                 select gm;
            //
            //foreach (var game in deleteGame)
            //{
            //    gmdb.Games.DeleteOnSubmit(game);
            //}
            var deleteGame = GetGame(id);
            gmdb.Games.DeleteOnSubmit(deleteGame);
        }

        public void DeleteAddon(int id)
        {
            var deleteAddon = GetAddon(id);
            gmdb.Addons.DeleteOnSubmit(deleteAddon);
        }
        
        //// Submit Changes ////
        public void Save()
        {
            gmdb.SubmitChanges();
        }
    }
}
