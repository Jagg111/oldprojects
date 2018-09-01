using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace myComponents
{
    public class DataObject
    {
        public bool addUser(string Conn, string FullName, string UserName, string Email, string Password)
        {
            SqlConnection conPubs;
            SqlCommand cmdInsert;
            conPubs = new SqlConnection(Conn);

            try
            {

                conPubs.Open();
                cmdInsert = new SqlCommand("INSERT Users (FullName, UserName, Email, Password) VALUES (@fullname, @username, @email, @password)", conPubs);
                cmdInsert.Parameters.Add("@fullname", FullName);
                cmdInsert.Parameters.Add("@username", UserName);
                cmdInsert.Parameters.Add("@email", Email);
                cmdInsert.Parameters.Add("@password", Password);
                cmdInsert.ExecuteNonQuery();
                conPubs.Close();
            }
            catch
            {
                return false;
            }
            return true;
        }
        public bool addUserTweet(string Conn, int UserId, string tweetContent)
        {
            SqlConnection conPubs;
            SqlCommand cmdInsert;
            conPubs = new SqlConnection(Conn);

            try
            {
                conPubs.Open();
                cmdInsert = new SqlCommand("INSERT tweets (UserID, Tweet) VALUES ('" + UserId.ToString() + "', '" + tweetContent + "')", conPubs);
                cmdInsert.ExecuteNonQuery();
                conPubs.Close();
            }
            catch
            {
                return false;
            }
            return true;
        }
        public DataRow checkUser(string Conn, string Username, string Password)
        {
            DataSet ds = new DataSet();
            SqlConnection conPubs;
            
            conPubs = new SqlConnection(Conn);
            conPubs.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM users WHERE (UserName = '" + Username + "' OR Email = '" + Username + "') AND Password = '" + Password + "'", conPubs);
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            conPubs.Close();
            if (count == 0)
                return null;
            if (count == 1)
                return ds.Tables[0].Rows[0];
            else
                return null;
            
        }
		public DataRow getUserInfo (string Conn, string Username)
		{
			DataSet ds = new DataSet();
			SqlConnection conPubs;

			conPubs = new SqlConnection(Conn);
			conPubs.Open();
			SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM users WHERE UserName = '" + Username + "'", conPubs);
			da.Fill(ds);
			int count = ds.Tables[0].Rows.Count;
			conPubs.Close();
			if (count == 1)
			{
				return ds.Tables[0].Rows[0];
			}
			else
			{
				return null;
			}
		}
		public DataRow findUser(string Conn, string Username)
		{
			DataSet ds = new DataSet();
			SqlConnection conPubs;

			conPubs = new SqlConnection(Conn);
			conPubs.Open();
			SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM users WHERE UserName = '" + Username + "' OR Email = '" + Username + "' OR FullName = '" + Username + "'", conPubs);
			da.Fill(ds);
			int count = ds.Tables[0].Rows.Count;
			conPubs.Close();
			if (count == 1)
			{
				return ds.Tables[0].Rows[0];
			}
			else
			{
				return null;
			}
		}
        public DataRow getUserInfoByID(string Conn, int Userid)
        {
            DataSet ds = new DataSet();
            SqlConnection conPubs;

            conPubs = new SqlConnection(Conn);
            conPubs.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM users WHERE ID = '" + Userid + "'", conPubs);
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            conPubs.Close();
            if (count == 1)
            {
                return ds.Tables[0].Rows[0];
            }
            else
            {
                return null;
            }
        }
        public DataSet getUserTweets(string Conn, int Userid)
        {
            DataSet ds = new DataSet();
            SqlConnection conPubs;

            conPubs = new SqlConnection(Conn);
            conPubs.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tweets WHERE UserID = '" + Userid + "' ORDER BY ID DESC", conPubs);
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            conPubs.Close();
            if (count >= 1)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }
        public DataSet getTweets(string Conn, int Userid)
        {
            DataSet ds = new DataSet();
            SqlConnection conPubs;

            conPubs = new SqlConnection(Conn);
            conPubs.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM following WHERE UserID = '" + Userid + "'", conPubs);
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            conPubs.Close();
            string query = "UserID = '" + Userid + "'";
            if (count >= 1)
            {
                int i = 0;
                while (i < count)
                {
                    query += " OR UserID = '" + ds.Tables[0].Rows[i]["FollowID"].ToString() + "'";
                    i++;
                }

            }

            DataSet ds2 = new DataSet();
            SqlConnection conPubs2;

            conPubs2 = new SqlConnection(Conn);
            conPubs2.Open();
            SqlDataAdapter da2 = new SqlDataAdapter("SELECT * FROM tweets WHERE " + query + " ORDER BY ID DESC", conPubs2);
            da2.Fill(ds2);
            int count2 = ds2.Tables[0].Rows.Count;
            conPubs2.Close();

            if (count2 >= 1)
            {
                return ds2;
            }
            else
            {
                return null;
            }
        }

		public DataSet getAllTweets(string Conn)
		{
			DataSet ds2 = new DataSet();
			SqlConnection conPubs2;

			conPubs2 = new SqlConnection(Conn);
			conPubs2.Open();
			SqlDataAdapter da2 = new SqlDataAdapter("SELECT * FROM tweets ORDER BY ID DESC", conPubs2);
			da2.Fill(ds2);
			int count2 = ds2.Tables[0].Rows.Count;
			conPubs2.Close();

			if (count2 >= 1)
			{
				return ds2;
			}
			else
			{
				return null;
			}
		}

		public bool checkFollow(string Conn, int UserID, string UserName)
		{
			int FollowID = 0;
			DataRow userfollow = this.getUserInfo(Conn, UserName);
			if (userfollow != null)
			{
				DataSet ds = new DataSet();
				SqlConnection conPubs;
				conPubs = new SqlConnection(Conn);
				conPubs.Open();
				SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM following WHERE UserID = '" + UserID + "' AND FollowID = '" + userfollow["ID"] + "'", conPubs);
				da.Fill(ds);
				int count = ds.Tables[0].Rows.Count;
				conPubs.Close();
				if (count == 1)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				return false;
			}
		}
        public bool follow(string Conn, int UserID, string UserName)
        {
            DataRow userfollow = this.getUserInfo(Conn, UserName);
            if (userfollow != null)
            {
                SqlConnection conPubs;
                SqlCommand cmdInsert;
                conPubs = new SqlConnection(Conn);
                try
                {
                    conPubs.Open();
                    cmdInsert = new SqlCommand("INSERT following (UserID, FollowID) VALUES ('" + UserID + "', '" + userfollow["ID"] + "')", conPubs);
                    cmdInsert.ExecuteNonQuery();
                    conPubs.Close();
                }
                catch
                {
                    return false;
                }
                return true;
            }
            return false;
        }
        public bool unFollow(string Conn, int UserID, string UserName)
        {

            DataRow userfollow = this.getUserInfo(Conn, UserName);
            if (userfollow != null)
            {
                SqlConnection conPubs;
                SqlCommand cmdDelete;
                conPubs = new SqlConnection(Conn);
                try
                {

                    conPubs.Open();
                    cmdDelete = new SqlCommand("DELETE FROM following WHERE UserID = '" + UserID + "' AND FollowID = '" + userfollow["ID"] + "'", conPubs);
                    cmdDelete.ExecuteNonQuery();
                    conPubs.Close();
                }
                catch
                {
                    return false;
                }
                return true;
            }
            return false;
        }
    }
}
