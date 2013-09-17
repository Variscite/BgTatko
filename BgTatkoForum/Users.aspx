<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BgTatkoForum.Users" %>

<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Users on BGTatko Forum</h1>
    <asp:GridView runat="server" 
        ID="GridViewUsers"
        ItemType="BgTatkoForum.Models.UserDetails" >
        <Columns>
         <asp:TemplateField>
            <ItemTemplate>
                <asp:ListView runat="server"
                    ID="ListViewDetails"
                    ItemType="BgTatkoForum.Models.UserDetail">
                    <ItemTemplate>               
                        <asp:HyperLink runat="server"
                            DataNavigateUrlFields="Id" 
                            NavigateUrl="UserDetails.aspx?id={0}"
                            DataTextField="FullName" 
                            HeaderText="" >
                            <asp:Image runat="server"
                                ID="ImageUser"  
                                ItemType="<%# Item.Avatar %>"
                                ImageUrl="<%# Item.Avatar %>" />
                        </asp:HyperLink>
                        <asp:HyperLink runat="server" 
                            DataNavigateUrlFields="Id" 
                            NavigateUrl="UserDetails.aspx?id={0}"
                            DataTextField="DisplayName" 
                            HeaderText="" />
                        </ItemTemplate> 
                    </asp:ListView>
            </ItemTemplate>
          </asp:TemplateField>            
        </Columns>

    </asp:GridView>

</asp:Content>
        <!--<Columns>
            <asp:BoundField runat="server" 
                ID="LabelUserScore"
                DataField="Score"/>
        </Columns>-->