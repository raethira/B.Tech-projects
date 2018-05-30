<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master" AutoEventWireup="true" CodeFile="frmChangePassword.aspx.cs" Inherits="Registration_frmChangePassword" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table border="0" cellpadding="0" cellspacing="0" align="center" style="width: 100%">
            <tr>
                <td colspan="2" style="font-weight: bold; font-size: 12pt; color: #000000; background-color: #d5d7c9" align="left">
                    Change Your Password</td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp; &nbsp;
                </td>
            </tr>
            <tr>
                <td style="font-weight: bold; color: black;" align="left">
                    User Name:</td>
                <td align="left">
                    <asp:TextBox ID="txtName" runat="server" Width="151px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Require" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" style="font-weight: bold; color: black">
                    Old Password:</td>
                <td align="left">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="151px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Require" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" style="font-weight: bold; color: black">
                    New Password:</td>
                <td align="left">
                    <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password" Width="151px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPwd"
                        ErrorMessage="Require" Font-Bold="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" style="font-weight: bold; color: black">
                    Confirm Password:</td>
                <td align="left">
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="151px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPwd"
                        ControlToValidate="txtConfirm" ErrorMessage="Not Matched" Font-Bold="True"
                        ValidationGroup="g1"></asp:CompareValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="font-weight: bold; color: #ffffff">
                    <asp:Button ID="btnChange" runat="server" OnClick="btnChange_Click" Text="Change Password"
                        Width="117px" /></td>
            </tr>
            <tr>
                <td align="center" colspan="2" style="font-weight: bold; color: #ffffff">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Maroon"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>

