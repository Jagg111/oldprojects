<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Gamon.Models.vw_Addon>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Addons
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Addons</h2>

    <% if (Model.Count() == 0) { %>
           <p>Sorry, there are no addons for this game yet.</p>
    <% } else { %>
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
                GameTitle
            </th>
            <th>
                GameDescription
            </th>
        </tr>

    <% foreach (var item in Model)
       { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.AddonID%>
            </td>
            <td>
                <%: item.AddonName%>
            </td>
            <td>
                <%: item.AddonDescription%>
            </td>
            <td>
                <%: item.GameTitle%>
            </td>
            <td>
                <%: item.GameDescription%>
            </td>
        </tr>
    
    <% }
       }%>


    </table>
</asp:Content>

