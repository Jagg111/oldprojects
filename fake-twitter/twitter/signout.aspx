<script language="cs" runat=server>

	void Page_Load()
	{
		if(Session["Login"] != null && Session["Login"].ToString() == "True")
		{
			Session.Clear();
		}

		Response.Redirect(".");

	}

</script>