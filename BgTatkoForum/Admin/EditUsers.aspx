﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="BgTatkoForum.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Admin page</h1>
    <asp:GridView runat="server" ID="GridViewUsers"
        AutoGenerateColumns="false" DataKeyNames="Id"
        AllowPaging="true" UpdateMethod="GridViewUsers_UpdateItem" DeleteMethod="GridViewUsers_DeleteItem"
        PageSize="3" SelectMethod="GridViewUsers_GetData"
        ItemType="BgTatkoForum.Models.User"
        BorderStyle="None" AllowSorting="true">
        <Columns>
            <asp:CommandField HeaderText="Action" ShowEditButton="true"
                ShowDeleteButton="true" />
            <asp:BoundField DataField="UserName"
                HeaderText="User Name"
                SortExpression="UserName" />
        </Columns>
    </asp:GridView>
</asp:Content>
