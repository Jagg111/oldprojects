<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Gamon.Models.vw_Addon>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>
    <%--<ul>
    <% foreach (var group in Model.GroupBy(item => item.GameTitle))
       { %>
        <li><a href="game/<%= group.Key %>"><%= group.Key%></a>
            <ul>
                <% foreach (var item in group)
                   { %>
                <li><%= Html.Encode(item.AddonName)%></li>
                <%} %>
            </ul>
        </li>
        <% } %>
    </ul>--%>

    <ul id="addons">
        <% foreach (var item in Model) { %>
        <li>
            <table>
                <tr>
                    <td>IMG</td>
                    <td><p><a href="/#"><%= item.AddonName %></a><br />
                        - <%= item.AddonDescription %><br />
                        <a href="/addons/game/<%= item.GameSlug %>"><%: item.GameTitle%></a> (<%= item.GameDescription %>)</p>
                    </td>
                </tr>
            </table>
        </li>
        <% } %>
    </ul>

    <table>
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

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

