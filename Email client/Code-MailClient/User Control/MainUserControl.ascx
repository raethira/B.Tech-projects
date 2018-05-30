<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainUserControl.ascx.cs" Inherits="User_Control_MainUserControl" %>
<table border="0" cellpadding="2" cellspacing="1" style="width: 100%">
    <tr>
        <td align="left" style="background-color: #d7d9cb">
            <asp:Menu ID="Menu2" runat="server" BackColor="#F1F2EE" Height="26px" Orientation="Horizontal"
                Width="100px">
                <Items>
                    <asp:MenuItem ImageUrl="~/images/address_book.gif" ToolTip="Address Book" NavigateUrl="~/Registration/frmUserAddressBook.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/Calander.jpg" ToolTip="Calendar" NavigateUrl="~/Registration/RegisterUser/frmUserCalendarHome.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="|" Value="|"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/AddNewContact.png" ToolTip="Compose Mail" NavigateUrl="~/Registration/RegisterUser/frmComposeMail.aspx"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </td>
        <td align="left" style="background-color: #d7d9cb">
        </td>
    </tr>
    <tr>
        <td align="left" colspan="1">
            <asp:Menu ID="Menu3" runat="server" Font-Bold="True" ForeColor="#666666" Height="78px"
                Width="1px" BackColor="#E3EAEB" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="12px" StaticSubMenuIndent="10px">
                <Items>
                    <asp:MenuItem ImageUrl="~/images/Inbox.png" Text=" Inbox" Value="Inbox" NavigateUrl="~/Registration/RegisterUser/frmUserInbox.aspx"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/Drafts.png" Text=" ONGC-Forms" Value="Drafts" NavigateUrl="~/Registration/RegisterUser/frmUserDraftItems.aspx"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/Trash.png" Text=" Trash" Value="Trash" NavigateUrl="~/Registration/RegisterUser/frmUserDeletedMail.aspx"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/Sent.png" Text=" Sent" Value="Sent" NavigateUrl="~/Registration/RegisterUser/frmUserSentItems.aspx"></asp:MenuItem>
                    <asp:MenuItem ImageUrl="~/images/SaveItem.bmp" NavigateUrl="~/Registration/RegisterUser/frmUserSavedItem.aspx"
                        Text=" Saved Item" Value="Save Item"></asp:MenuItem>
                </Items>
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                <DynamicMenuStyle BackColor="#E3EAEB" />
                <StaticSelectedStyle BackColor="#1C5E55" />
                <DynamicSelectedStyle BackColor="#1C5E55" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#666666" ForeColor="White" />
            </asp:Menu>
            
           
        </td>
        <td align="left" colspan="1" valign="top">
            <asp:Label ID="lblCount" runat="server" Font-Bold="True" ForeColor="Maroon" Width="105px"></asp:Label></td>
    </tr>
</table>
