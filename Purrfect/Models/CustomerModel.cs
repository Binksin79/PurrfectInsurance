using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Purrfect.Models
{
    public class CustomerModel
    {
        public double RateMultipier { get; set; }
        public string Address { get; set; }
        public string District { get; set; }
        public int    NumberInusred { get; set; }
        public int    NumberClaims { get; set; }

    }
}