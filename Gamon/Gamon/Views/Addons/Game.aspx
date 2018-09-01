<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Gamon.Models.vw_Addon>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Addons - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Addons</h2>

    <% if (Model.Count() == 0)
       { %>
           <p>Sorry, there are no addons for this game yet.</p>
    <% }
       else
       { %>
    <ul id="addons">
        <% foreach (var item in Model)
           { %>
        <li>
            <table>
                <tr>
                    <td><img src="<%= item.AddonAvatar %>" alt="<%= item.AddonName %>" /></td>
                    <td><p><a href="/addons/details?id=<%= item.AddonID %>"><%= item.AddonName%></a><br />
                        - <%= item.AddonDescription%><br />
                        <%: item.GameTitle%> (<%= item.GameDescription%>)</p>
                    </td>
                </tr>
            </table>
        </li>
        <% } %>
    </ul>
    <% } %>


</asp:Content>

