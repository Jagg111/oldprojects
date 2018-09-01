<%@ Page Language="c#" runat="server" %>

<%@ Import Namespace="myComponents" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

	void Page_Load()
	{
		if(Session["Login"] != null && Session["Login"].ToString() == "True")
		{
			Response.Redirect("./Home.aspx");
			return;
		}

		DataObject myDataObject = new DataObject();
            string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
            DataRow Userinfo;
            DataSet Usertweets;
            int Userid;
            try
            {

                    Usertweets = myDataObject.getAllTweets(strConnect);
                    if (Usertweets != null)
                    {
                        int count = 0;
                        int total = Usertweets.Tables[0].Rows.Count;
                        int otherid = 0;
                        DataRow otherUserInfo;
                        string tweet;
                        while (count < total)
                        {
                            tweet = Usertweets.Tables[0].Rows[count]["Tweet"].ToString();
                            otherid = Convert.ToInt32(Usertweets.Tables[0].Rows[count]["UserID"]);
                            otherUserInfo = myDataObject.getUserInfoByID(strConnect, otherid);
							if(otherUserInfo != null)
							{
								Tweet.Text += "<div class='tweetContent'><a href=\"./profile.aspx?Username=" + otherUserInfo["Username"] + "\">" + otherUserInfo["Username"] + "</a> " + tweet + "</div>";
                            }
							count++;
                        }
                    }
					else
					{
						Tweet.Text = "There Are No Tweets! Sign up and Start the Conversation!";
					}

            }
            catch (Exception expException)
            {
                Tweet.Text = expException.Message;

            }

	}


void submit( object s, EventArgs e )
{
	
}
</script>

<!--#include file="includes/header.aspx"-->
<a href="./default.aspx">Home</a> 
<a href="./find.aspx">Find People</a> 
<a href="./signup.aspx">Join Fake Twitter!</a> 
<a href="./signin.aspx">Sign in</a>
<!--#include file="includes/body.aspx"-->
            <div class="timeline">
            <form id="form1" runat="server">
				<h2>What's Happening Now:</h2>
                <asp:literal id="Tweet" runat="server" />
                </form>
<!--#include file="includes/footer.aspx"-->
