using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Purrfect.Models;

namespace Purrfect.DAL
{
    public interface IForumDAL
    {
        
            List<Forum> GetAllReviews();
            bool SaveReview(Forum newReview);
        
    }
}