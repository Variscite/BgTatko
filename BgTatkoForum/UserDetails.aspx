<%@ Page Title="" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="UserDetails.aspx.cs" 
    Inherits="BgTatkoForum.UserDetails" %>

<asp:Content ID="ContentUserDetails" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView ID="FormViewUserDetails" runat="server" 
        AllowPaging="False"  DataKeyNames="Score"
        ItemType="BgTatkoForum.Models.UserDetail">
            <ItemTemplate>
                <h2>User: <%#: Item.User.UserName %></h2>
                <hr />
                <div>
                <table class="mainUserInfo">
                     <tr>
                        <td></td>
                        <td><a href="~/UserDetails.aspx?id={<%# Item.UserId %>}" target="_self"><img src="~/ImageHandler.ashx" /></a></td>
                    </tr>
                    <tr>
                        <td>Member for:</td>
                        <td><%#: Item.DateRegistered - DateTime.Now %></td>
                    </tr>
                    <tr>
                        <td>Full name: :</td>
                        <td><%#: Item.FirstName + " " + Item.LastName %></td>
                    </tr>
                    <tr>
                        <td>Website:</td>
                        <td><%#: Item.WebSite %></td>
                    </tr>
                    <tr>
                        <td>About user:</td>
                        <td><%#: Item.About %></td>
                    </tr>
                    <tr>                       
                </table>
                </div>
                
                <h3>Activity by <%#: Item.User.UserName %></h3>
                <hr />
                <div>
                <table class="forumUserInfo">
                    <tr>
                        <td>Score:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Threads:</td>
                        <td><%#: Item.User.Threads.Count %></td>
                    </tr>
                    <tr>
                        <td>Posts:</td>
                        <td><%#: Item.User.Posts.Count %></td>
                    </tr>
                    <tr>
                        <td>Comments:</td>
                        <td><%#: Item.User.Comments.Count %></td>
                    </tr>
                    <tr>                       
                </table>
                </div>
                    <hr />
            </ItemTemplate>
        </asp:FormView>
</asp:Content>
