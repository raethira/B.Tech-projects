<%@ Page Language="C#" MasterPageFile="~/Registration/MasterPage.master" AutoEventWireup="true"
    CodeFile="frmNewUserPassword.aspx.cs" Inherits="Registration_frmNewUserPassword"
    %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="800" height="340">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="80%" align="center" style="border-right: #990000 2px dashed; border-top: #990000 2px dashed; border-left: #990000 2px dashed; border-bottom: #990000 2px dashed">
                    <tr>
                        <td align="left" colspan="1" style="font-weight: bold; font-size: 12pt; width: 528px;
                            color: black; background-color: silver">
                            Reset Password</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="1" style="height: 19px">
                            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="1" style="font-weight: bold; font-size: 10pt; 
                            color: black">
                            &nbsp;You have successfully reset your password you may change it after login again
                            with change password option</td>
                    </tr>
                    <tr>
                        <td align="center" colspan="1" style="font-weight: bold; font-size: 10pt; width: 528px;
                            color: #ffffff">
                            &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="font-weight: bold; color: maroon">
                            Your &nbsp;Password Is:<asp:Label ID="lblPassword" runat="server" Font-Bold="True"
                                ForeColor="#004000" Width="178px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="1" style="font-weight: bold; color: #ffffff">
                            &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" style="background-color: silver">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="1">
                            <asp:Button ID="btnLogin" runat="server" Text="LogIn" OnClick="btnLogin_Click" Width="58px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
