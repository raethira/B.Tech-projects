<%@ Page Language="C#" MasterPageFile="~/Admin/Update/MasterPage.master" AutoEventWireup="true" CodeFile="frmUpdateOccupation.aspx.cs" Inherits="Admin_Update_frmUpdateOccupation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table border="0" cellpadding="2" cellspacing="2" width="100%" height="350">
<tr>
<td valign="top">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="70%">
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; font-size: 13pt">
                Update Occupation</td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; font-size: 13pt">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" width="25%" style="font-weight: bold">
                Occupation Type:</td>
            <td align="left">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" Width="45px" />
                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" /></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red" Width="260px"></asp:Label></td>
        </tr>
    </table>
    </td>
</tr>
</table>
</asp:Content>

