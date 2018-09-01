<%@ Page Language="c#" runat="server" %>

<%@ Import Namespace="myComponents" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    void Page_Load()
    {
        confirmationmessage.Text = "";
    }

    void Button_Click(Object s, EventArgs e)
    {
        DataObject myDataObject = new DataObject();
        string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
        bool confirmation;
        if (IsValid)
        {
            try
            {
                confirmation = myDataObject.addUser(strConnect,
                                                      txtFullname.Text,
                                                      txtUsername.Text,
                                                      txtEmail.Text,
                                                      txtPassword.Text);

                if (confirmation)
                    confirmationmessage.Text = "Hi, " + txtFullname.Text + "!<br>Your account has been made!";
            }
            catch (Exception expException)
            { lblError.Text = expException.Message; }

        }
    }
</script>
<!--#include file="includes/header.aspx"-->
<!--#include file="includes/body.aspx"-->
            <div class="timeline">
            <form id="form1" runat="server">
                <h2>
                    New User Registration</h2>
                <asp:Label ID="lblError" ForeColor="Red" Font-Bold="True" EnableViewState="False"
                    runat="Server" />
                <p>
                    Full name<asp:TextBox ID="txtFullname" runat="Server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFullname"
                        Text="You must enter your name!" runat="Server" /></p>
                <p>
                    Username<asp:TextBox ID="txtUsername" runat="Server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtUsername"
                        Text="You must enter a user name!" runat="Server" />
                </p>
                <p>
                    Password<asp:TextBox ID="txtPassword" runat="Server" TextMode="password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtPassword"
                        Text="You must enter a password!" runat="Server" />
                </p>
                <p>
                    Email<asp:TextBox ID="txtEmail" runat="Server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtEmail"
                        Text="You must enter an email address!" runat="Server" />
                </p>
                <p>
                    <asp:Button ID="Button1" Text="Create my account" OnClick="Button_Click" runat="Server" />
                </p>
                <p>
                    <asp:Label ID="confirmationmessage" runat="server" /></p>
                    </form>
<!--#include file="includes/footer.aspx"-->