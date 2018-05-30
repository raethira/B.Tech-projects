<%@ Page Language="C#" MasterPageFile="~/Registration/MasterPage.master" AutoEventWireup="true"
    CodeFile="frmInvalidUserNamePassword.aspx.cs" Inherits="Registration_frmInvalidUserNamePassword"
     %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="300">
    <tr>
    <td>
   
        <table border="0" cellpadding="2" cellspacing="2" width="80%" style="border-right: maroon 2px dotted; border-top: maroon 2px dotted; border-left: maroon 2px dotted; border-bottom: maroon 2px dotted">
            <tr>
                <td align="center" colspan="4" style="font-weight: bold; font-size: 12pt; color: Red">
                    Invalid User Name or Password Try Again !</td>
            </tr>
            <tr>
                <td colspan="4"><asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;</td>
            </tr>
            <tr>
                <td align="left" colspan="2" style="font-weight: bold; font-size: 14pt; color: Black;
                    background-color: silver">
                    Existing Users</td>
                <td align="left" colspan="1" style="background-color: white" rowspan="6">
                </td>
                <td align="left" colspan="1" style="font-weight: bold; font-size: 14pt; color: Black;
                    background-color: silver">
                    New User !</td>
            </tr>
            <tr>
                <td align="right" style="font-weight: bold; color: black; width: 97px;" valign="baseline">
                    Login Name:</td>
                <td align="left" style="width: 428px">
                    <asp:TextBox ID="txtLoginName" runat="server" ValidationGroup="g1"></asp:TextBox><span
                        style="color: #ffffff"><strong style="color: #000000">@Spicemail.Com</strong></span><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLoginName"
                            ErrorMessage="Enter User Name" Font-Bold="True" Width="125px"
                            ValidationGroup="g1"></asp:RequiredFieldValidator></td>
                <td align="center">
                    <asp:LinkButton ID="lnkHome" runat="server" Font-Bold="True" ForeColor="Black" OnClick="lnkHome_Click"
                        Width="105px" CausesValidation="False">Return To<<</asp:LinkButton></td>
            </tr>
            <tr>
                <td align="right" style="font-weight: bold; width: 97px; color: black" valign="baseline">
                    Password:</td>
                <td align="left" style="width: 428px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="147px" ValidationGroup="g1"
                        TabIndex="1"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password"
                            Font-Bold="True" Width="127px" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
                <td align="center">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                </td>
                <td align="center" colspan="1">
                    <asp:LinkButton ID="lnkNewUser" runat="server" Font-Bold="True" ForeColor="Maroon"
                        OnClick="lnkNewUser_Click" Width="100px" CausesValidation="False">Sign Up Now !</asp:LinkButton></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnSignUp" runat="server" Text="Login" OnClick="btnSignUp_Click"
                        ValidationGroup="g1" Width="68px" /></td>
                <td align="right" colspan="1">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:LinkButton ID="lnkPasswordForgot" runat="server" Font-Bold="True" ForeColor="Maroon"
                        Width="197px" OnClick="lnkPasswordForgot_Click" CausesValidation="False">Forgot Password ?</asp:LinkButton></td>
                <td align="center" colspan="1">
                </td>
            </tr>
        </table>
         
    </td>
    </tr>
    </table>
    </div>
</asp:Content>
