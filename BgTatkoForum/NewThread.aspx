<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewThread.aspx.cs" Inherits="BgTatkoForum.NewThread" %>
<asp:Content ID="ContentNewThread" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Create New Thread</h1>
    Thread Title: <asp:TextBox ID="TextBoxTitle" runat="server" />
    <br />
    Category: <asp:DropDownList runat="server" ID="DropDownListCategory" ItemType="BgTatkoForum.Models.Category" DataValueField="CategoryId" DataTextField="Name" />
    <br />
    Thread Content: <asp:TextBox ID="TextBoxContent" runat="server" />
    <br />
    <asp:LinkButton ID="LinkButtonSaveThread" Text="Save" runat="server" OnClick="LinkButtonSaveThread_Click" />
</asp:Content>
