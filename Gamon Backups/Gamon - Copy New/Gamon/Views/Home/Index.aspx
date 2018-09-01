<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Gamon.Models.vw_GameWithAddon>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gameon - PC Games and Addons
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gameon</h2>
    <p>Select from <%= Model.Count() %> games</p>
    <form action="/" method="get">
    <p>Order by 
        <select name="filterby">
            <option value="1" id="filterby-title" <% if (Request.QueryString["filterby"] != "2") { %> selected = "selected" <% } %>>Title</option>
            <option value="2" id="filterby-addons" <% if (Request.QueryString["filterby"] == "2") { %> selected = "selected" <% } %>>Addons</option>
        </select>
        <button type="submit">Sort</button>
    </p>
    </form>
    <table>
    <% foreach (var game in Model)
       { %>
       <tr>
       <td><a href="/addons/game/<%= game.Slug %>"><img src="<%= game.Avatar %>" alt="<%= game.Title %>" /></a></td>
       <td>
            <h4><a href="/addons/game/<%= game.Slug %>"><%= game.Title %></a></h4>
            <p>Genre:<%= game.Description %></p>
            <p><%= game.NumAddons %> addons.</p>
       
       </td>
        <%--<%= Html.ActionLink(game.Title, game.Slug, "games/addons" )%>--%>
        </tr>
    <% } %>
    </table>
</asp:Content>
