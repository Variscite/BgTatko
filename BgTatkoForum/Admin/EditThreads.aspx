<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditThreads.aspx.cs" Inherits="BgTatkoForum.Admin.EditThreads" %>
<asp:Content ID="ContentEditThreads" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridViewEditThreads" runat="server"
        ItemType="BgTatkoForum.Models.Thread"
        AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true"
        PageSize="5" SelectMethod="GridViewEditThreads_GetData">
        <Columns>
            <asp:BoundField HeaderText="Thread Title" DataField="Title" SortExpression="Title"/>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDelete" Text="Delete" runat="server" OnCommand="LinkButtonDelete_Command" CommandArgument="<%# Item.ThreadId %>"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:FormView ID="FormViewDeleteThread" runat="server" ItemType="BgTatkoForum.Models.Thread" Visible="false">
        <ItemTemplate>
            Title: <asp:TextBox runat="server" Text="<%# Item.Title %>" Enabled="false" />
            Author: <asp:TextBox runat="server" Text="<%# Item.User.UserName %>" Enabled="false" />
            <asp:LinkButton ID="LinkButtonDeleteThread" Text="Delete" OnCommand="LinkButtonDeleteThread_Command" CommandArgument="<%# Item.ThreadId %>" runat="server" />
            <asp:LinkButton ID="LinkButtonCancelDelete" Text="Cancel" OnCommand="LinkButtonCancelDelete_Command" runat="server" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
