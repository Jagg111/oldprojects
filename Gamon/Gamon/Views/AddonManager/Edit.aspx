<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.AddonManagerViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit Addon - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Addon</h2>

    <% using (Html.BeginForm(null, null, new { id = Model.Addon.IDNumber}, FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <%--This form is generated from the addon editor template (/views/shared/editortemplates/addon.ascx)--%>
            <%: Html.EditorFor( model => Model.Addon, new {Game = Model.Games}) %>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to addons", "Index") %>
    </div>

</asp:Content>

