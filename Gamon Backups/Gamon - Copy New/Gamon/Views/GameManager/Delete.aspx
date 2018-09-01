<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.vw_GameWithAddon>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete Game - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete Game</h2>

    <% if (Model.NumAddons >= 1)
       { %>
        <h3>This game (<%: Model.Title %>) still has addons in the system.<br />Please delete all <a href="/addonmanager">addons</a> for this game first.</h3>
        <%: Html.ActionLink("Back to List", "Index")%>
    <% }
       else
       { %>

        <h3>Are you sure you want to delete this game (<%: Model.Title%>)?</h3>
        <fieldset>
            <legend>Details</legend>

            <p>Title: <%: Model.Title%></p>

            <p>Description: <%: Model.Description%></p>

            <p>Slug: <%: Model.Slug%></p>
        
        </fieldset>
        <% using (Html.BeginForm())
           { %>
            <p>
		        <input type="submit" value="Delete" /><br /><br />
		        <%: Html.ActionLink("Back to games", "Index")%>
            </p>
        <% }
       }%>

</asp:Content>

