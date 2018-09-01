<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.Addon>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete Addon - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete Addon</h2>

    <p>Are you sure you want to delete this addon?</p>
    <p><strong><%: Model.Name %></strong><br />
    <%: Model.Description %></p>

    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /><br /><br />
		    <%: Html.ActionLink("Back to addons", "Index") %>
        </p>
    <% } %>

</asp:Content>

