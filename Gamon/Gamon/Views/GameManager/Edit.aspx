<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.Game>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm(null, null, new { id = Model.IDNumber}, FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Title) %>
                <%: Html.ValidationMessageFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Description) %>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Slug) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Slug) %>
                <%: Html.ValidationMessageFor(model => model.Slug) %>
            </div>
            
            <div class="editor-label">
                <label for="CurrentAvatar">Current Avatar</label>
            </div>
            <div class="editor-field">
                <% if (Model.Avatar != "/Content/ImageUploads/Games/placeholder.jpg")
                   { %>
                   <img src="<%= Model.Avatar %>" alt="<%= Model.Title %>" />
                <% } %>
            </div>
            <br />
            <div class="editor-label">
                <label for="Avatar">New Avatar</label> (jpg or png)
            </div>
            <div class="editor-field">
                <input type="file" name="Avatar" />
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

