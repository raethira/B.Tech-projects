<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="frmAdminLogin.aspx.cs" Inherits="Admin_frmAdminLogin"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%" height="380">
<tr>
<td>

    <table align="center" border="0" cellpadding="2" cellspacing="2" style="width: 45%; border-right: green 1px dashed; border-top: green 1px dashed; border-left: green 1px dashed; border-bottom: green 1px dashed;" bgcolor="#acb4b9">
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; font-size: 12pt" bgcolor="#ffffcc">
                Admin Login</td>
        </tr>
        <tr>
            <td align="center" colspan="2" bgcolor="#f2eafa">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td align="left">
                User Name:</td>
            <td align="left">
                <asp:TextBox ID="txtUserName" runat="server" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="Enter User Name" Font-Bold="True" Font-Size="9pt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="left">
                Password:</td>
            <td align="left">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="160px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Enter Password" Font-Bold="True" Font-Size="9pt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" Width="65px" /></td>
        </tr>
    </table>
    
</td>
</tr>]
</table>
</asp:Content>
