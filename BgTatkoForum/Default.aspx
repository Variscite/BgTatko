<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BgTatkoForum._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridThreads" runat="server"
        ItemType="BgTatkoForum.Models.Thread"
        AutoGenerateColumns="false" AllowPaging="true"
        PageSize="3" SelectMethod="GridThreads_GetData"
        BorderStyle="None" AllowSorting="true">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle BorderStyle="None" />
                <HeaderTemplate>
                    <asp:LinkButton Text="By date" runat="server"
                        OnCommand="SortByDate_Command" />
                    <asp:LinkButton Text="Most votes" runat="server"
                        OnCommand="SortByVotes_Command" />
                    <asp:LinkButton Text="Most posts" runat="server"
                        OnCommand="SortByPosts_Command" />
                    <br />
                    Recent threads and posts
                </HeaderTemplate>
                <ItemStyle BorderStyle="None" />
                <ItemTemplate>
                    <div>
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
                        <div class="thread-info">
                            <asp:LinkButton ID="LinkButtonThread"
                                runat="server"
                                Text="<%#: Item.Title %>"
                                CommandArgument="<%#: Item.ThreadId %>"
                                OnCommand="LinkButtonThread_Command" />
                            <h4></h4>
                            <p>
                                in
                                <asp:LinkButton runat="server"
                                    Text="<%#: Item.Category.Name %>"
                                    CommandArgument="<%# Item.CategoryId %>"
                                    OnCommand="SelectCategory_Command" />
                                on the <%#: Item.DateCreated %>
                            </p>
                            <asp:Repeater ID="RepeaterTags"
                                runat="server"
                                DataSource="<%# Item.Tags %>"
                                ItemType="BgTatkoForum.Models.Tag">
                                <ItemTemplate>
                                    <span class="tags">
                                        <asp:LinkButton runat="server"
                                            Text="<%#: Item.Name %>"
                                            CommandArgument="<%# Item.TagId %>"
                                            OnCommand="SelectTag_Command" />
                                    </span>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterStyle BorderStyle="None" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <%--<asp:ListView ID="ListViewThreads" runat="server"
        ItemType="BgTatkoForum.Models.Thread">
        <LayoutTemplate>
            <ul>
                <asp:PlaceHolder runat="server"
                    ID="itemPlaceholder" />
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <div>
                <div class="thread-votes">
                    <%#: Item.ThreadVotes.Count %>
                </div>
                <div class="thread-posts">
                    <%#: Item.Posts.Count %>
                </div>
                <div class="thread-info">
                    <asp:LinkButton ID="LinkButtonThread" runat="server" 
                        Text="<%#: Item.Title %>" 
                        CommandArgument="<%#: Item.ThreadId %>" 
                        OnCommand="LinkButtonThread_Command" />
                    <h4></h4>
                    <p><%#: Item.Category.Name %></p>
                    <asp:Repeater ID="RepeaterTags" runat="server"
                        ItemType="BgTatkoForum.Models.Tag">
                        <ItemTemplate>
                            <div class="tags">
                                <%#: Item.Name %>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            No records found
        </EmptyDataTemplate>
    </asp:ListView>--%>
</asp:Content>
