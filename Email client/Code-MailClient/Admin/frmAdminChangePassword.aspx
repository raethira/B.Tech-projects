<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true"
    CodeFile="frmAdminChangePassword.aspx.cs" Inherits="Admin_frmAdminChangePassword"
   %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: center">
    <table border="0" cellpadding="2" cellspacing="2" style="width: 100%" height="350">
    <tr>
    <td valign="top">
   
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td colspan="2" style="font-weight: bold; font-size: 12pt">
                    Change Password</td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td align="left" width="25%" style="font-weight: bold">
                    User Name:</td>
                <td align="left">
                    <asp:TextBox ID="txtUserName" runat="server" Width="165px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Enter User Name" Font-Bold="True" Font-Size="9pt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" style="font-weight: bold">
                    Old Password:</td>
                <td align="left">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="167px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password"
                        ValidationGroup="g1" Width="104px" Font-Bold="True" Font-Size="9pt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" style="font-weight: bold">
                    New Password:</td>
                <td align="left">
                    <asp:TextBox ID="txtNew" runat="server" TextMode="Password" Width="167px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password"
                        ValidationGroup="g1" Width="104px" Font-Bold="True" Font-Size="9pt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" style="font-weight: bold">
                    Confirm Password:</td>
                <td align="left">
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="167px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNew"
                        ControlToValidate="txtConfirm" ErrorMessage="Password Mismatch" Font-Bold="True" Font-Size="9pt"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td align="left">
                </td>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                </td>
                <td align="left">
                    <asp:Button ID="btnChange" runat="server" OnClick="btnChange_Click" Text="Change Password" /></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    </td>
            </tr>
        </table>
         
    </td>
    </tr>
    </table>
    </div>
</asp:Content>
