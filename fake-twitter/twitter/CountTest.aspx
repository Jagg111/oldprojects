<%@ Page Language="C#" %>

<%@ Import Namespace="myComponents" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    void Page_Load()
    {
		string strConnect = "Server=cdmcoursedb.cdm.depaul.edu;uid=mburton9;pwd=8hXynfwx;database=mburton9";
		test.Text = "testing";

		int count = -1;

		string username = "";

		SqlConnection conPubs;
        SqlCommand cmdInsert;
        conPubs = new SqlConnection(strConnect);


		conPubs.Open();
        cmdInsert = new SqlCommand("SELECT * from users WHERE UserName = 'Test' and Password = 'testing'", conPubs);
        //cmdInsert.Parameters.Add("@username", count);

		count = Convert.ToInt16(cmdInsert.ExecuteScalar());

		DataSet ds = new DataSet();
		//SqlDataAdapter da = new SqlDataAdapter("SELECT * from users WHERE UserName = 'Test' and Password = 'test'", conPubs);

		SqlDataAdapter da = new SqlDataAdapter("SELECT * from users", conPubs);

		da.Fill(ds);

		//foreach(DataRow row in ds.Tables[0].Rows)
		//Console.WriteLine(((int)row["COMPANY_TICKET_ID"]).ToString());

		//username = ds.Tables["users"].Rows[0].ToString();



        //DataRow row = ds.Tables["users"].Rows;
		
		foreach(DataRow row in ds.Tables[0].Rows)
		{
			username += " " + row["UserName"].ToString();
		}
		//cmdInsert.ExecuteNonQuery();
        
		count = ds.Tables[0].Rows.Count;
		//username = ds.Tables[0].Rows[0]["Password"].ToString();
		
		conPubs.Close();

		test.Text = count.ToString();

		

		//test.Text = username;

	}

</script>


<html>
<head>

</head>

<body>

	<asp:Label ID="test"  runat="Server" />

</body>

</html>