using System;
using System.Collections.Generic;
using System.Linq;

namespace Gamon.Models
{
    // Common code repository (used throughout classes)
    public class GameonRepository
    {
        // Data Setup //
        private GameonDataContext gmdb = new GameonDataContext();

        // ---------- Regular Select Queries ---------- //

        public IQueryable<vw_GameWithAddon> GetGames()
        {
            return from gm in gmdb.vw_GameWithAddons
                   select gm;
        }

        public IQueryable<vw_Addon> GetAddons()
        {
            return from adg in gmdb.vw_Addons
                   orderby adg.GameTitle, adg.AddonName
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

        public vw_GameWithAddon GetGameWithAdds(int id)
        {
            vw_GameWithAddon gamePick = gmdb.vw_GameWithAddons.Single(g => g.IDNumber == id);
            return (gamePick);
        }

        public IQueryable<vw_Addon> GetGameBySlug(string slug)
        {
            return from ad in gmdb.vw_Addons
                   where ad.GameSlug == slug
                   select ad;
        }

        public Addon GetAddon(int id) // Regular select from addon table
        {
            Addon addonPick = gmdb.Addons.Single(ad => ad.IDNumber == id);
            return (addonPick);
        }

        public vw_Addon GetAddonExpanded(int id) // Expanded select for addon (from view, brings in the game info as well)
        {
            vw_Addon addonPick = gmdb.vw_Addons.Single(ad => ad.AddonID == id);
            return (addonPick);
        }

        // ---------- Create Queries ---------- //
        public void CreateAddon(Addon addon)
        {
            gmdb.Addons.InsertOnSubmit(addon);
            Save();
        }

        public void CreateGame(Game game)
        {
            gmdb.Games.InsertOnSubmit(game);
            Save();
        }

        // ---------- Update Queries ---------- //
        public void UpdateAvatar(int id, string NewAvatar, string Type)
        {
            if (Type == "Game")
            {
                var Record = GetGame(id);
                Record.Avatar = NewAvatar;
            }
            else if (Type == "Addon")
            {
                var Record = GetAddon(id);
                Record.Avatar = NewAvatar;
            }
            Save();

        }

        // ---------- Delete Queries ---------- //
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

        // ---------- Submit Changes ---------- //
        public void Save()
        {
            gmdb.SubmitChanges();
        }
    }
}
