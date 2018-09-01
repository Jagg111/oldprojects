<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.vw_Addon>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%: Model.AddonName %> - <%: Model.GameTitle %> Addons - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Model.AddonName %></h2>

    <fieldset>
        <legend>Details</legend>
        
        <p><%: Model.AddonName %> - For <%: Model.GameTitle %></p>

        <img src="<%= Model.AddonAvatar %>" alt="<%: Model.AddonName %>" />
        
        <p>Description: <%: Model.AddonDescription %></p>
        
        <a href="#">Download</a>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Back to addons", "Index") %> | <a href="/addons/game/<%= Model.GameSlug %>">Back to <%: Model.GameTitle %></a>
    </p>

</asp:Content>

