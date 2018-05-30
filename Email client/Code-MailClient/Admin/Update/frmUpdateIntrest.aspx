<%@ Page Language="C#" MasterPageFile="~/Admin/Update/MasterPage.master" AutoEventWireup="true" CodeFile="frmUpdateIntrest.aspx.cs" Inherits="Admin_Update_frmUpdateIntrest"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table border="0" cellpadding="2" cellspacing="2" width="100%" height="350">
<tr>
<td valign="top">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="70%">
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; font-size: 13pt">
                Update Interest</td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; font-size: 13pt">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold" width="15%">
                Interest:</td>
            <td align="left">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" /></td>
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

