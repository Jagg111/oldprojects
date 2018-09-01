<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Gamon.Models.vw_GameWithAddon>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Games List</h2>
    <p>
        <%: Html.ActionLink("Create New Game", "create") %>
    </p>
    <table>
        <tr>
            <th>Actions</th>
            <th>Title</th>
            <th>Description</th>
            <th>Slug</th>
            <th># of Addons</th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "edit", new { id=item.IDNumber }) %> |
                <%--<%: Html.ActionLink("Details", "Details", new { id=item.IDNumber })%> |--%>
                <%: Html.ActionLink("Delete", "delete", new { id=item.IDNumber })%>
            </td>
            <td>
                <%: item.Title %>
            </td>
            <td>
                <%: item.Description %>
            </td>
            <td>
                <%: item.Slug %>
            </td>
            <td>
                <%: item.NumAddons %>
            </td>
        </tr>
    
    <% } %>

    </table>
</asp:Content>