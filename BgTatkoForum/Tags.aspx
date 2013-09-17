<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tags.aspx.cs" Inherits="BgTatkoForum.Tags" %>
<asp:Content ID="ContentTags" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView runat="server" ID="ListViewTags" ItemType="BgTatkoForum.Models.Tag">
        <ItemTemplate>
            <div><%#: Item.Name %></div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
