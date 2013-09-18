<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewThread.aspx.cs" Inherits="BgTatkoForum.NewThread" %>
<asp:Content ID="ContentNewThread" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Create New Thread</h1>
    Thread Title: <asp:TextBox ID="TextBoxTitle" runat="server" />
    <br />
    Category: <asp:DropDownList runat="server" ID="DropDownListCategory" ItemType="BgTatkoForum.Models.Category" DataValueField="CategoryId" DataTextField="Name" />
    <br />
    Content: <asp:TextBox ID="TextBoxContent" runat="server" TextMode="MultiLine" Rows="10" />
    <br />
    Tags: <asp:TextBox ID="TextBoxTags" runat="server" />
    <br />
    <asp:LinkButton ID="LinkButtonSaveThread" Text="Save" runat="server" OnClick="LinkButtonSaveThread_Click" />
    <asp:RequiredFieldValidator
            ID="RequiredFieldValidatorThreadTitle"
            runat="server"
            ErrorMessage="Thread Title is Required!"
            ControlToValidate="TextBoxTitle" />
</asp:Content>
