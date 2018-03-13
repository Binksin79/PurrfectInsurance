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
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;




        public List<Forum> GetAllReviews()
        {
            List<Forum> forumReview = new List<Forum>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();


                SqlCommand cmd = new SqlCommand("SELECT * FROM forum ORDER BY ReviewDate DESC", conn);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Forum f = new Forum();
                    
                    f.Username = Convert.ToString(reader["Username"]);
                    f.Rating = Convert.ToInt32(reader["Rating"]);
                    f.Title = Convert.ToString(reader["Title"]);
                    f.Message = Convert.ToString(reader["Message"]);
                    f.ReviewDate = Convert.ToDateTime(reader["ReviewDate"]);

                    forumReview.Add(f);
                }
            }
            return forumReview;
        }
        public bool SaveReview(Forum newReview)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO Forum VALUES(@username, @rating, @title, @message, @postdate)", conn);

                cmd.Parameters.AddWithValue("@username", newReview.Username);
                cmd.Parameters.AddWithValue("@rating", newReview.Rating);
                cmd.Parameters.AddWithValue("@title", newReview.Title);
                cmd.Parameters.AddWithValue("@message", newReview.Message);
                cmd.Parameters.AddWithValue("@postdate", DateTime.Now);

                cmd.ExecuteNonQuery();

            }
            return true;
        }
    }
    
}