<%@ Page Language="c#" runat="server" %>

<%@ Import Namespace="myComponents" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">
    void Page_Load()
    {
        confirmationmessage.Text = "";
        if (Session["Login"] != null)
        {
            Response.Redirect("./Home.aspx");
        }

    }
    void Button_Click(Object s, EventArgs e)
    {
        DataObject myDataObject = new DataObject();
        string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
        DataRow confirmation;
        if (IsValid)
        {
            try
            {
                confirmation = myDataObject.checkUser(strConnect,
                                                      txtUsername.Text,
                                                      txtPassword.Text);

                if (confirmation != null)
                {
                    Session["Login"] = "True";
                    Session["Userid"] = confirmation["ID"];
                    Session["Username"] = confirmation["UserName"];
                    Session["FullName"] = confirmation["FullName"];
                    Session["Email"] = confirmation["Email"];
                    confirmationmessage.Text = "Hello" + confirmation["FullName"];
                    Response.Redirect("./Home.aspx");
                }
                else
                {
                    confirmationmessage.Text = "Please check your login id and password.";
                }


            }
            catch (Exception expException)
            { lblError.Text = expException.Message; }

        }
    }
</script>

<!--#include file="includes/header.aspx"-->
<a href="./default.aspx">Home</a> 
<a href="./find.aspx">Find People</a> 
<a href="./signup.aspx">Join Fake Twitter!</a>
<!--#include file="includes/body.aspx"-->
<div class="timeline">
    <form id="form1" runat="server">
    <h2>
        Sign In</h2>
    <asp:label id="lblError" forecolor="Red" font-bold="True" enableviewstate="False"
        runat="Server" />
    <p>
        Username or email<br />
        <asp:textbox id="txtUsername" runat="Server" />
        <asp:requiredfieldvalidator id="RequiredFieldValidator1" controltovalidate="txtUsername"
            text="You must enter a your username!" runat="Server" />
    </p>
    <p>
        Password<br />
        <asp:textbox id="txtPassword" runat="Server" textmode="password" />
        <asp:requiredfieldvalidator id="RequiredFieldValidator3" controltovalidate="txtPassword"
            text="You must enter your password!" runat="Server" />
    </p>
    <p>
        <asp:button id="Button1" text="Sign in" runat="Server" onclick="Button_Click" />
    </p>
    
    <p>
        <asp:label id="confirmationmessage" runat="server" />
    </p>
    </form>
    <!--#include file="includes/footer.aspx"-->
