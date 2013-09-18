<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BgTatkoForum.Users" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Users on BGTatko Forum</h1>
     
    <asp:GridView runat="server" 
        ID="GridViewUsers"
        AutoGenerateColumns="false" 
        ItemType="BgTatkoForum.Models.UserDetail"         
        ShowHeader="false"
        DataKeyNames="Avatar, DisplayName, Score, Id" OnSelectedIndexChanged="GridViewUsers_SelectedIndexChanged">
        
        <Columns>
            <asp:ImageField DataImageUrlField="Id" ItemStyle-CssClass="userImg" DataImageUrlFormatString="~/ImageHandler.ashx?userId={0}"/>
            <asp:HyperLinkField 
                  DataNavigateUrlFields="Id"    
                  DataTextField="DisplayName" 
                  DataNavigateUrlFormatString="UserDetails.aspx?userId={0}"                               
                  runat="server"/>
            <asp:BoundField DataField="Score"
                SortExpression="Score" />                
        </Columns>
    </asp:GridView>

</asp:Content>
