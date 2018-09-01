<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Index.aspx.vb" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div>
    <h1>My Tasks</h1>

    ... displaying all tasks

    <ul>
    <% For Each task As TaskList.Task In ViewData.Model%>

    <li>
    <% If task.IsCompleted Then%>
    <del>
    <%= task.EntryDate.ToShortDateString()%> -- <%= task.Task%>
    </del>
    <% Else%>
    <a href="/Home/Complete/<%= task.Id.ToString() %>">Complete</a>
    <%= task.EntryDate.ToShortDateString()%> -- <%= task.Task%>
    <% End If%>
    
    
    </li>

    <% Next%>
    </ul>
    <br /><br />

    <a href="/Home/Create">Add new Task</a>

    </div>
</body>
</html>
