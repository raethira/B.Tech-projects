<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Registration/MasterPage.master" CodeFile="frmSignUpSuccessful.aspx.cs" Inherits="Registration_frmSignUpSuccessful" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
         <table border="0" cellpadding="0" cellspacing="0" align="center" width="70%" style="border-right: #990033 2px groove; border-top: #990033 2px groove; border-left: #990033 2px groove; border-bottom: #990033 2px groove">
            <tr>
                <td align="center" colspan="2">
                    &nbsp;<asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Red"
                        Width="455px"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" style="font-weight: bold; font-size: 10pt; color: #ffffff; font-family: Arial;
                    background-color: #0072b8; text-align: left">
                    <span style="font-size: 12pt">Sign Up Successful</span><span style="font-size: 14pt"></span></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <span style="font-size: 10pt; font-family: Arial; font-weight:bold;">
                        Account Created Successfully<br /><br />
                            Your new email address is:<br /></span>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lblUserName" runat="server" Font-Bold="True" ForeColor="Green" Width="429px"></asp:Label>
                    <br />
                    </td>
            </tr>
             <tr>
                 <td align="center" colspan="2">
                     <table  cellpadding="2" cellspacing="2" style="width: 100%;">
                         <tr>
                             <td align="center" colspan="2" style="font-weight: bold; color: #ffffff; background-color: #938f74">
                                 Login</td>
                         </tr>
                         <tr>
                             <td align="right" style="font-weight: bold; width: 118px; color: black">
                                 User Name:</td>
                             <td align="left" style="font-weight: bold; color: black">
                                 <asp:TextBox ID="txtUserName" runat="server" ValidationGroup="g1"></asp:TextBox>@Spicemail.Com<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                                     ErrorMessage="Enter User Name" Font-Bold="True" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
                         </tr>
                         <tr>
                             <td align="right" style="font-weight: bold; width: 118px; color: black">
                                 Password:</td>
                             <td align="left" style="width: 264px">
                                 <asp:TextBox ID="txtPassword" runat="server" ValidationGroup="g1" TextMode="Password" Width="147px"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                     ErrorMessage="Enter Password" Font-Bold="True" ValidationGroup="g1"></asp:RequiredFieldValidator>
                             </td>
                         </tr>
                         <tr>
                             <td align="center" colspan="2" style="font-weight: bold; color: #ffffff">
                                 <asp:Button ID="btnSignUp" runat="server" OnClick="btnSignUp_Click" Text="Sign Up"
                                     ValidationGroup="g1" />
                             </td>
                         </tr>
                         <tr>
                             <td align="center" colspan="2" style="font-weight: bold; color: #ffffff">
                             </td>
                         </tr>
                         <tr>
                             <td align="center" colspan="2" style="font-weight: bold; color: #ffffff">
                                 <asp:LinkButton ID="lnkForgotPassword" runat="server" Font-Bold="True" ForeColor="Black"
                                     Width="163px" OnClick="lnkForgotPassword_Click" CausesValidation="False">Forgot Password ?</asp:LinkButton></td>
                         </tr>
                     </table>
                 </td>
             </tr>
        </table>
    
     </asp:Content>


