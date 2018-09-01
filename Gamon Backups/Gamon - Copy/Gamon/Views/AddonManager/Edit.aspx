<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.Addon>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IDNumber) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IDNumber) %>
                <%: Html.ValidationMessageFor(model => model.IDNumber) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Name) %>
                <%: Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Description) %>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.GameID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.GameID) %>
                <%: Html.ValidationMessageFor(model => model.GameID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Avatar) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Avatar) %>
                <%: Html.ValidationMessageFor(model => model.Avatar) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

