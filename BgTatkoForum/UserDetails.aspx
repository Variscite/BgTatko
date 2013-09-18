<%@ Page Title=""
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="UserDetails.aspx.cs"
    Inherits="BgTatkoForum.UserDetails" %>

<asp:Content ID="ContentUserDetails" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView ID="FormViewUserDetails" runat="server"
        AllowPaging="False" DataKeyNames="FullName, DisplayName"
        ItemType="BgTatkoForum.Models.UserDisplayModel">
        <ItemTemplate>
            <h2>User: <%#: Item.DisplayName %></h2>
            <hr />
            <div>
                <table class="mainUserInfo">
                    <tr>
                        <td></td>
                        <td>
                            <a href="~/UserDetails.aspx?id={<%# Item.Id %>}" target="_self">
                                <asp:Image OnPreRender="Avatar_PreRender" runat="server" />
                            </a>

                        </td>
                    </tr>
                    <tr>
                        <td>Member for:</td>
                        <td>
                            <%#: Item.Member %> days in the forum
                        </td>
                    </tr>
                    <tr>
                        <td>Full name: :</td>
                        <td><%#: Item.FullName %></td>
                    </tr>
                    <tr>
                        <td>Website:</td>
                        <td><%#: Item.UserDetails.WebSite %></td>
                    </tr>
                    <tr>
                        <td>About user:</td>
                        <td><%#: Item.UserDetails.About %></td>
                    </tr>
                    <tr>
                </table>
            </div>

            <h3>Activity by <%#: Item.DisplayName %></h3>
            <hr />
            <div>
                <table class="forumUserInfo">
                    <tr>
                        <td>Score:</td>
                        <td><%#: Item.Score %></td>
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

    <asp:ListView ID="ListViewPosts" runat="server"
        ItemType="BgTatkoForum.Models.Post">
        <ItemTemplate>
            <p>
                <asp:LinkButton Text="<%#: Item.Thread.Title %>" runat="server"
                    CommandArgument="<%#: Item.Thread.ThreadId %>"
                    OnCommand="Thread_Command" />
            </p>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
