using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mvccustomer.Models;

namespace Mvccustomer.Controllers
{
    public class CustomerController : Controller
    {
        //
        // GET: /Customer/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult FillCustomer()
        {
            return View();
        }
        public ActionResult DisplayCustomer()
        {
            Customer obj = new Customer();
            obj.Id = Convert.ToInt16(Request.Form["Customerid"]);
            obj.CustomerCode = Convert.ToString(Request.Form["CustomerCode"]);
            obj.Amount = Convert.ToDouble(Request.Form["CustomerAmount"]);
            return View(obj);
        }
    }
}
