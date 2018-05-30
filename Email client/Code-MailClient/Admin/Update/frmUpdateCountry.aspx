<%@ Page Language="C#" MasterPageFile="~/Admin/Update/MasterPage.master" AutoEventWireup="true" CodeFile="frmUpdateCountry.aspx.cs" Inherits="Admin_Update_frmUpdateCountry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="2" cellspacing="2" align="center" width="100%" height="350">
    <tr>
    <td valign="top"> 
    <table border="0" cellpadding="2" cellspacing="2" align="center" width="100%">
        <tr>
            <td colspan="2" style="font-weight: bold; font-size: 13pt" align="center">
                Update Country</td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold" width="15%">
                Country Name:</td>
            <td align="left">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold;">
                Description:</td>
            <td align="left">
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnUPdate" runat="server" Text="Update" OnClick="btnUPdate_Click" />&nbsp;<asp:Button ID="btnBack"
                    runat="server" Text="Back" OnClick="btnBack_Click" Width="53px" /></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>
    </td>
    </tr>
    </table>
</asp:Content>

