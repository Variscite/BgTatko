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
        </ItemTemplate>
    </asp:FormView>
    <asp:LinkButton ID="LinkButtonCreateNewPost" runat="server"
        Text="Create New Post"
        OnClick="LinkButtonCreateNewPost_Click" />
    <section id="sectionCreatePost" runat="server" visible="false">
        <h3>Fill new post info:</h3>
        <asp:Label ID="LabelPostContent" Text="Content: " runat="server" AssociatedControlID="TextBoxPostContent" />
        <asp:TextBox ID="TextBoxPostContent" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidatorContinentName"
            runat="server"
            ErrorMessage="Post Content is Required!"
            ControlToValidate="TextBoxPostContent" />
        <br />
        <asp:LinkButton ID="LinkButtonSavePost" runat="server"
            CommandArgument='<%# Request.Params["threadId"] %>'
            Text="Save" OnCommand="LinkButtonSavePost_Click" />
        <br />
        <a href="<%# Request.Url %>">Cancel</a>
        <asp:Literal ID="LiteralErrorMessage" runat="server" Visible="false" />
    </section>
    <section id="sectionCreateCommentForPost" runat="server" visible="false">
        <h3>Fill new comment info:</h3>
        <asp:HiddenField ID="HiddenFieldSlectedPostId" runat="server" />
        <asp:Label ID="LabelCommentContent" Text="Content: " runat="server" AssociatedControlID="TextBoxCommentContent" />
        <asp:TextBox ID="TextBoxCommentContent" runat="server" TextMode="MultiLine" />
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidatorCommentName"
            runat="server"
            ErrorMessage="Post Content is Required!"
            ControlToValidate="TextBoxCommentContent" />
        <br />
        <asp:LinkButton ID="LinkButtonSaveComment" runat="server"
            Text="Save" OnClick="LinkButtonSaveComment_Click" />
        <br />
        <a href="<%# Request.Url %>">Cancel</a>
        <asp:Literal ID="Literal1" runat="server" Visible="false" />
    </section>
    <h3>Posts</h3>
    <asp:ListView ID="FormViewPosts" runat="server" ItemType="BgTatkoForum.Models.Post" DataKeyNames="PostId">
        <ItemTemplate>
            <h4>Post:</h4>
            <div class="post">
                <p class="post-content">
                    <%#: Item.Content %>
                <p class="post-postedBy">
                    <%#: "Posted By: " + Item.User.UserName %>
            </div>
            <asp:LinkButton ID="LinkButtonCreateNewComment" runat="server"
                Text="Create New Comment"
                CommandArgument="<%# Item.PostId %>"
                OnCommand="LinkButtonCreateNewComment_Command" />
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
    </asp:ListView>
</asp:Content>
