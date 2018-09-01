<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Gamon.Models.vw_Addon>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Addon Manager - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Addons List</h2>
    <p>
        <%: Html.ActionLink("Create New Addon", "create")%>
    </p>
    <table>
        <tr>
            <th>Actions</th>
            <th>Name</th>
            <th>Description</th>
            <th>Game</th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "edit", new {  id=item.AddonID  }) %> |
                <%: Html.ActionLink("Delete", "delete", new { id = item.AddonID })%>
            </td>

            <td>
                <%: item.AddonName %>
            </td>
            <td>
                <%: item.AddonDescription %>
            </td>
            <td>
                <a href="/gamemanager/edit?id=<%= item.GameID %>"><%: item.GameTitle %></a> (<%: item.GameDescription %>)
            </td>
        </tr>
    
    <% } %>

    </table>



</asp:Content>

