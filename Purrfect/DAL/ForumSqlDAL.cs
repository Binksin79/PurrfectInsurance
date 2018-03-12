using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Purrfect.Models;
using System.Data.SqlClient;

namespace Purrfect.DAL
{
    public class ForumSqlDAL : IForumDAL
    {
        public List<Forum> GetAllReviews()
        {
            List<Forum> forumReview = new List<Forum>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();


                SqlCommand cmd = new SqlCommand("SELECT * FROM forum ORDER BY reviewDate DESC", conn);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Forum f = new Forum();
                    
                    f.Username = Convert.ToString(reader["username"]);
                    f.Rating = Convert.ToInt32(reader["rating"]);
                    f.Title = Convert.ToString(reader["Title"]);
                    f.Message = Convert.ToString(reader["Message"]);
                    f.ReviewDate = Convert.ToDateTime(reader["reviewDate"]);

                    forumReview.Add(f);
                }
            }
            return forumReview;
        }
    }
}