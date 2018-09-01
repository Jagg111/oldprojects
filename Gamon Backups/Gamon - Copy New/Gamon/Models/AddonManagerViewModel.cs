using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gamon.Models;

namespace Gamon.Models
{
    // Use this class so that we can setup create and edit pages for addons
    //    in particular, we provide the addon itself, and the list of games for dropdowns
    public class AddonManagerViewModel : Controller
    {
        public Addon Addon { get; set; }
        public SelectList Games { get; set; }
    }
}
