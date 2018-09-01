<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.AddonManagerViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	New Addon - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>New Addon</h2>

    <% using (Html.BeginForm(null, null, FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Addon</legend>
            
            <%: Html.EditorFor( model => Model.Addon, new {Game = Model.Games}) %>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to addons", "Index") %>
    </div>

</asp:Content>

