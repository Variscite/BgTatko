﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="BgTatkoForum.Categories" %>
<asp:Content ID="ContentCategories" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" ID="GridViewCategories" ItemType="BgTatkoForum.Models.Category" 
        AutoGenerateColumns="false" PageSize="3" AllowPaging="true" 
        SelectMethod="GridViewCategories_GetData">   
        <Columns>
             <asp:TemplateField HeaderText="Browse categories">
                <ItemTemplate>
                     <div><b><%#: Item.Name %></b> - <asp:LinkButton ID="LinkButtonCategory" runat="server"
                         OnCommand="LinkButtonCategory_Command" 
                         CommandArgument="<%# Item.CategoryId %>" 
                         Text='<%# Item.Threads.Count + " threads" %>'  /> 
                         - <%#: Item.Desription %></div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
