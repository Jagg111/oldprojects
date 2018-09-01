<%@ Page Language="c#" runat="server" %>

<%@ Import Namespace="myComponents" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    void Page_Load()
    {
        if (Session["Login"] == null || (Session["Login"] != null && Session["Login"].ToString() != "True"))
        {
            Response.Redirect("./Default.aspx");
        }
        else
        {
            DataObject myDataObject = new DataObject();
            string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
            DataRow Userinfo;
            DataSet Usertweets;
            int Userid;
            try
            {
                Userinfo = myDataObject.getUserInfo(strConnect, Session["Username"].ToString());

                if (Userinfo != null)
                {
                    Userid = Convert.ToInt32(Userinfo["ID"]);
                    ProfileLink.Text = ("<a href='./profile.aspx?Username=" + Session["UserName"].ToString() + "' >Profile</a>");

                    Usertweets = myDataObject.getTweets(strConnect, Userid);
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
                            Tweet.Text += "<div class='tweetContent'><a href=\"./profile.aspx?Username=" + otherUserInfo["Username"] + "\">" + otherUserInfo["Username"] + "</a> " + tweet + "</div>";
                            count++;
                        }
                    }
                }
                else
                {
                    message.Text = "We were not able to find that user! Sorry!";
                }

            }
            catch (Exception expException)
            {
                message.Text = expException.Message;

            }
        }

    }

    void Add_Tweet(Object s, EventArgs e)
    {
        DataObject myDataObject = new DataObject();
        string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
        bool confirmation;
        if (IsValid)
        {
            try
            {
                confirmation = myDataObject.addUserTweet(strConnect, Convert.ToInt32(Session["Userid"]), txtTweet.Text);

                if (confirmation)
                    Response.Redirect("./home.aspx"); ;
            }
            catch (Exception expException)
            { message.Text = expException.Message; }

        }
    }
</script>

<!--#include file="includes/header.aspx"-->
<a href="./Home.aspx">Home</a> <asp:literal id="ProfileLink" runat="server" /> <a href="./find.aspx">Find People</a> <a href="./signout.aspx">Sign Out</a>
<!--#include file="includes/body.aspx"-->
<div class="timeline">
    <form id="form1" runat="server">
    <asp:label id="message" forecolor="Red" font-bold="True" enableviewstate="False"
        runat="Server" />
    <p>
        What's happening?<br />
        <asp:textbox id="txtTweet" runat="Server" rows="2" textmode="MultiLine" maxlength="140" />
        <asp:requiredfieldvalidator id="RequiredFieldValidator1" controltovalidate="txtTweet"
            text="You must enter your tweet!" runat="Server" />
    </p>
    <asp:button id="Button1" text="Tweet" onclick="Add_Tweet" runat="Server" />
    <br />
    <asp:literal id="Tweet" runat="server" />
</form>
<!--#include file="includes/footer.aspx"-->
