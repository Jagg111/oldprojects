<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.Game>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	New Game - Gamon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>New Game</h2>

    <% using (Html.BeginForm(null, null, FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Game</legend>
                    
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
                <%: Html.LabelFor(model => model.Avatar) %> (jpg or png)
            </div>
            <div class="editor-field">
                <input type="file" name="Avatar" />
                <%--<%: Html.TextBoxFor(model => model.Avatar) %>--%>
                <%: Html.ValidationMessageFor(model => model.Avatar)%>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

