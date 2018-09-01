<%@ page language="c#" runat="server"%>
<script  runat=server>

void Page_Load()	
{
	string strEmail;
	if (Request.QueryString["cookie"] == "1")
	{
		strEmail = Request.Cookies["SavedLogin"].Values["Email"];
		
	}
	else
	{
		strEmail = Request.Form["email"];
	}

	if (Request.Form["SaveLogin"] == "on")
	{
	    DateTime ExpDate = DateTime.Now.AddDays(30);
		Response.Cookies["SavedLogin"].Values["EMail"] = Request.Form["email"];
		Response.Cookies["SavedLogin"].Values["pw"] = Request.Form["password"];
		Response.Cookies["SavedLogin"].Expires = ExpDate;
		MyLabel.Text = "Saving Login information to a cookie<HR>";
	}
	
	MyLabel.Text += "Thank you for logging into the system.<P>";
	
	if (Request.QueryString["cookie"] == "1")
	    MyLabel.Text += "Login submitted via cookie<P>";
    
	
	MyLabel.Text += "E-Mail address confirmation: " + strEmail;
}
		
</script>
<html>
<head>
	<title>Fake Twitter</title>
</head>
<body>
<asp:label id="MyLabel" runat="server"/><br>
</body>
</html>
