<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Thread.aspx.cs" Inherits="BgTatkoForum.Thread" %>

<asp:Content ID="ContentCurrentThread" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormViewThread" runat="server" ItemType="BgTatkoForum.Models.Thread">
        <ItemTemplate>
            <div class="thread-votes">
                <asp:LinkButton runat="server"
                    Text="<"
                    CommandArgument="<%# Item.ThreadId.ToString() + ',' + Context.User.Identity.GetUserId() %>"
                    OnCommand="VoteUp_Command"
                    CssClass="vote-up" />
                <asp:LinkButton runat="server"
                    Text=">"
                    CommandArgument="<%# Item.ThreadId.ToString() + ',' + Context.User.Identity.GetUserId() %>"
                    OnCommand="VoteDown_Command"
                    CssClass="vote-down" />
                <%#: Item.ThreadVotes.Sum(v => v.Value) %>
                            votes
            </div>
            <div class="thread-posts">
                <%#: Item.Posts.Count %>
                            posts
            </div>
            <br />
            <h2 id="ThreadTitle">Title: <%#:Item.Title %></h2>
            <br />
            <div id="ThreadContent">Content: <%#:Item.Content %></div>
            <br />
            <h3>Posts</h3>
        </ItemTemplate>
    </asp:FormView>
    <asp:FormView ID="FormViewPosts" runat="server" ItemType="BgTatkoForum.Models.Post">
        <ItemTemplate>
            <p>Post:</p>
            <div class="post">
                <p class="post-content">
                    <%#: Item.Content %>
                <p class="post-postedBy">
                    <%#: "Posted By: " + Item.User.UserName %>
            </div>
            <asp:Repeater ID="RepeaterPostCommetns" runat="server"
                DataSource="<%# Item.Comments %>"
                ItemType="BgTatkoForum.Models.Comment">
                <ItemTemplate>
                    <p>Comment:</p>
                    <div class="post-comment">
                        <p class="post-comment-content">
                            <%#: Item.Content %>
                        <p class="post-comment-postedBy">
                            <%#: "Posted By: " + Item.User.UserName %>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
        
    </asp:FormView>
</asp:Content>
