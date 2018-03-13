using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Purrfect.Models
{
    public class QuoteGeneratorModel
    {
        public double FavoriteAnimal { get; set; }
        public double NumberOfCars { get; set; }
        public double NumberOfAccidents { get; set; }
        public double FavoriteBand { get; set; }
        public double FavoritePizzaTop { get; set; }


        public string GenerateQuote()
        {
            string quote = "";
            double result = FavoriteAnimal + NumberOfCars + NumberOfAccidents + FavoriteBand + FavoritePizzaTop;

            if(result > 0 && result <= 4)
            {
                quote = "Your purrfect rate is $100 a month";
            }
            else if(result > 4 && result <= 8)
            {
                quote = "Your purrfect rate is $250 a month";
            }
            else
            {
                quote = "Your purrfect rate is $500 a month";
            }
            return quote;
        }
    }
}