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
                <div class="votes"><%#: Item.ThreadVotes.Count %></div>
                <%#: Item.Posts.Count %>
                <%#: Item.Title %>
                <%#: Item.Title %>
            </li>
        </ItemTemplate>
        <EmptyDataTemplate>
            No records found
        </EmptyDataTemplate>
    </asp:ListView>

</asp:Content>
