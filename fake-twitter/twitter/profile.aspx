<%@ Page Language="c#" runat="server" %>

<%@ Import Namespace="myComponents" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    void Page_Load()
    {
        if (Session["Login"] == null || (Session["Login"] != null && Session["Login"].ToString() != "True"))
        {
            Log.Text = "<a href='./signin.aspx' />Sign in</a>";
            ProfileLink.Text = ("<a href='#' >Profile</a>");
        }
        else
        {
            Log.Text = "<a href='./signout.aspx' />Sign out</a>";
            ProfileLink.Text = ("<a href='./profile.aspx?Username=" + Session["UserName"].ToString() + "' >Profile</a>");
        }
        
        if (Request.QueryString["Username"] != null)
        {
            DataObject myDataObject = new DataObject();
            string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
            DataRow Userinfo;
            DataSet Usertweets;
            int Userid;
            try
            {
                Userinfo = myDataObject.getUserInfo(strConnect, Request.QueryString["Username"].ToString());

                if (Userinfo != null)
                {
                    Userid = Convert.ToInt32(Userinfo["ID"]);
                    Username.Text = Userinfo["UserName"].ToString();
                    Fullname.Text = Userinfo["FullName"].ToString();
                    Email.Text = Userinfo["Email"].ToString();

                    Usertweets = myDataObject.getUserTweets(strConnect, Userid);
                    if (Usertweets != null)
                    {
                        int count = 0;
                        int total = Usertweets.Tables[0].Rows.Count;
                        string tweet;
                        while (count < total)
                        {
                            tweet = Usertweets.Tables[0].Rows[count]["Tweet"].ToString();
                            Tweet.Text += "<div class='tweetContent'>" + tweet + "</div>";
                            count++;
                        }
                    }                    
                }
                else
                {
                    Error.Text = "We were not able to find that user! Sorry!";
                }

            }
            catch (Exception expException)
            {
                Error.Text = expException.Message;

            }
        }





        if (Request.QueryString["Username"] != null)
        {
            if (Session["UserName"] != null && Request.QueryString["Username"] == Session["Username"].ToString())
            {
                txtUser.Text = "That's you!<br />";
            }
            else if (Session["UserName"] != null && Request.QueryString["Username"] != Session["Username"].ToString())
            {

                DataObject myDataObject = new DataObject();
                string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
                bool isFollowing;
                try
                {
                    isFollowing = myDataObject.checkFollow(strConnect, Convert.ToInt32(Session["Userid"]), Request.QueryString["Username"].ToString());

                    if (isFollowing == true)
                    {
                        gofollow.Visible = false;
                        stopfollow.Visible = true;
                    }
                    else
                    {
                        gofollow.Visible = true;
                        stopfollow.Visible = false;
                    }

                }
                catch (Exception expException)
                {
                    Error.Text = expException.Message;

                }
            }
        }
    }
    void Go_Follow(Object s, EventArgs e)
    {
        DataObject myDataObject = new DataObject();
        string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
        bool confirmation;
        if (IsValid)
        {
            try
            {
                confirmation = myDataObject.follow(strConnect, Convert.ToInt32(Session["Userid"]), Request.QueryString["Username"].ToString());

                if (confirmation)
                {
                    confirmationmessage.Text = "Your are now following " + Request.QueryString["Username"] + "<br />";
                    gofollow.Visible = false;
                    stopfollow.Visible = true;
                }
            }
            catch (Exception expException)
            { Error.Text = expException.Message; }

        }
    }
    void Un_Follow(Object s, EventArgs e)
    {
        DataObject myDataObject = new DataObject();
        string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
        bool confirmation;
        if (IsValid)
        {
            try
            {
                confirmation = myDataObject.unFollow(strConnect, Convert.ToInt32(Session["Userid"]), Request.QueryString["Username"].ToString());

                if (confirmation)
                {
                    confirmationmessage.Text = "Your are no longer following " + Request.QueryString["Username"] + "<br />";
                    gofollow.Visible = true;
                    stopfollow.Visible = false;
                }
            }
            catch (Exception expException)
            { Error.Text = expException.Message; }

        }
    }
</script>

<!--#include file="includes/header.aspx"-->
<a href="./Home.aspx">Home</a> <asp:literal id="ProfileLink" runat="server" /> <a href="./find.aspx">Find People</a> <asp:literal id="Log" runat="server" />
<!--#include file="includes/body.aspx"-->
<div class="timeline">
    <form id="form1" runat="server">
    <asp:label id="Error" forecolor="Red" font-bold="True" enableviewstate="False" runat="Server" />
    <span style="font-weight: bold;">
        <asp:literal id="Username" runat="server" />
    </span>
    <br />
    <span style="font-weight: bold;">Name</span>
    <asp:literal id="Fullname" runat="server" />
    <br />
    <span style="font-weight: bold;">Email</span>
    <asp:literal id="Email" runat="server" />
    <br />
    <asp:literal id="txtUser" runat="server" />
    <asp:Panel visible="false" id="gofollow" runat="server">
        <asp:button id='FollowButton' text='Follow' onclick='Go_Follow' runat='Server' />
    </asp:Panel>
    <asp:Panel visible="false" id="stopfollow" runat="server">
        <asp:button id='UnFollowButton' text='Unfollow' onclick='Un_Follow' runat='Server' />
    </asp:Panel>
    <asp:literal id="confirmationmessage" runat="server" />
    <span style="font-weight: bold;">Tweets</span>
    <asp:literal id="Tweet" runat="server" />
    <br />
    
    </form>
    <!--#include file="includes/footer.aspx"-->
