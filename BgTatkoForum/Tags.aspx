<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tags.aspx.cs" Inherits="BgTatkoForum.Tags" %>
<asp:Content ID="ContentTags" ContentPlaceHolderID="MainContent" runat="server">
   <asp:GridView runat="server" ID="GridViewTags" ItemType="BgTatkoForum.Models.Tag" 
       AutoGenerateColumns="false" PageSize="3" AllowPaging="true" 
       SelectMethod="GridViewTags_GetData">   
        <Columns>
             <asp:TemplateField HeaderText="Most popular tags">
                <ItemTemplate>
                     <div><asp:LinkButton Text='<%#: Item.Name %>' runat="server"/> x <%# Item.Threads.Count %></div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
