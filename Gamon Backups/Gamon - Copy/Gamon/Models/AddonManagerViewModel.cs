using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Gamon.Models;

namespace Gamon.Models
{
    public class AddonManagerViewModel : Controller
    {
        public Addon Addon { get; set; }
        public SelectList Games { get; set; }
    }
}
