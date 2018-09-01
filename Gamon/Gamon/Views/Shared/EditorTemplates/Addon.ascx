<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Gamon.Models.Addon>" %>
            
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
                <%: Html.DropDownList("GameID", (SelectList)ViewData["Game"])%>
               <%-- <%: Html.TextBoxFor(model => model.GameID) %>
                <%: Html.ValidationMessageFor(model => model.GameID) %>--%>
            </div>
            
            <div class="editor-label">
                <label for="CurrentAvatar">Current Avatar</label>
            </div>
            <div class="editor-field">
                <% if (Model.Avatar != "/Content/ImageUploads/Addons/placeholder.jpg")
                   { %>
                   <img src="<%= Model.Avatar %>" alt="<%= Model.Name %>" />
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