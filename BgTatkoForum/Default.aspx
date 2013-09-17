<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BgTatkoForum._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView ID="ListViewThreads" runat="server"
        ItemType="BgTatkoForum.Models.Thread">
        <LayoutTemplate>
            <ul>
                <asp:PlaceHolder runat="server"
                    ID="itemPlaceholder" />
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li>
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
            </li>
        </ItemTemplate>
        <EmptyDataTemplate>
            No records found
        </EmptyDataTemplate>
    </asp:ListView>

</asp:Content>
