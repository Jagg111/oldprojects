<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Default.Master" Inherits="System.Web.Mvc.ViewPage<Gamon.Models.Addon>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm(null, null, FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>

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
           <%-- <%= Html.DropDownList("IDNumber", (IEnumerable<SelectListItem>)ViewData["Games_List"])%>--%>


            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Avatar) %>
            </div>
            <div class="editor-field">
                <input type="file" name="Avatar" />
                <%--<%: Html.TextBoxFor(model => model.Avatar) %>--%>
                <%: Html.ValidationMessageFor(model => model.Avatar) %>
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

