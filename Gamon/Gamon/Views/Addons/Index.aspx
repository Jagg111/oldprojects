<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Gamon.Models.vw_Addon>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Addons - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>All Addons</h2>
    <ul id="addons">
        <% foreach (var item in Model) { %>
        <li>
            <table>
                <tr>
                    <td><img src="<%= item.AddonAvatar %>" alt="<%= item.AddonName %>" /></td>
                    <td><p><a href="/addons/details?id=<%= item.AddonID %>"><%= item.AddonName %></a><br />
                        - <%= item.AddonDescription %><br />
                        <a href="/addons/game/<%= item.GameSlug %>"><%: item.GameTitle%></a> (<%= item.GameDescription %>)</p>
                    </td>
                </tr>
            </table>
        </li>
        <% } %>
    </ul>

    <%------------- Original table view of addons ------------- %>
    <%--<table>
        <tr>
            <th></th>
            <th>
                AddonID
            </th>
            <th>
                AddonName
            </th>
            <th>
                AddonDescription
            </th>
            <th>
                Game
            </th>
        </tr>
    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
                <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%> |
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.AddonID %>
            </td>
            <td>
                <%: item.AddonName %>
            </td>
            <td>
                <%: item.AddonDescription %>
            </td>
            <td>
                <a href="/addons/game/<%= item.GameSlug %>"><%: item.GameTitle%></a> (<%= item.GameDescription %>)
            </td>
        </tr>
    
    <% } %>

    </table>--%>

</asp:Content>

