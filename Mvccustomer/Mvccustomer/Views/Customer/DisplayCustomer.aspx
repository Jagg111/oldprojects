<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Mvccustomer.Models.Customer>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DisplayCustomer</title>
</head>
<body>
    <div>
        The customer id is: <%= Model.Id %><br />
        The customer Code is: <%= Model.CustomerCode %><br />
        <% if (Model.Amount >= 100) {%>
        This is a priveleged customer
        <% } else {%>
        This is a normal customer
        <%} %><br />
        The customer Amount is: <%= Model.Amount %><br />
    </div>
</body>
</html>
