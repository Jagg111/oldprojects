<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Gamon.Models.Game>" %>

<p>
    <%: Html.LabelFor(model => model.IDNumber) %>
    <%: Html.TextBoxFor(model => model.IDNumber) %>
    <%: Html.ValidationMessageFor(model => model.IDNumber) %>
</p>

<p>
    <%: Html.LabelFor(model => model.Title)%>
    <%: Html.TextBoxFor(model => model.Title)%>
    <%: Html.ValidationMessageFor(model => model.Title)%>
</p>