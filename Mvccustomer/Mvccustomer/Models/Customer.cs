using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mvccustomer.Models
{
    public class Customer
    {
        public int Id { set; get; }
        public string CustomerCode { set; get; }
        public double Amount { set; get; }
    }
}