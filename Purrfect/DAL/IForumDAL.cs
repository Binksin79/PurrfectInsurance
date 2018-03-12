using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Purrfect.Models;

namespace Purrfect.DAL
{
    public class IForumDAL
    {
        public interface IReviewDAL
        {
            List<Forum> GetAllReviews();
            bool SaveReview(Forum newReview);
        }
    }
}