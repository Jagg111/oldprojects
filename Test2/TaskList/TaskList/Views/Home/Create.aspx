<%@ Page Language="VB" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <div>
    <h1>Add New Task</h1>

    <form method="post" action="/Home/CreateNew">
    
    <label for="task">Task:</label>

    <input type="text" name="task" />

    <br />

    <input type="submit" value="Add Task" />

    </form>
    </div>
</body>
</html>
