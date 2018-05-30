<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true" CodeFile="frmAdminComposeMail.aspx.cs" Inherits="Admin_frmAdminComposeMail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="0" cellpadding="2" cellspacing="2" style="width: 100%">
        <tr>
            <td align="center" colspan="3" style="background-color: #f0f0e8">
                <table align="left" border="0" cellpadding="2" cellspacing="2" style="width: 155px">
                    <tr>
                        <td>
                            <asp:ImageButton ID="imgSend1" runat="server" ImageUrl="~/images/SendMail.jpg" OnClick="imgSend1_Click" /></td>
                        <td>
                            <asp:ImageButton ID="ImgCancel1" runat="server" ImageUrl="~/images/CancelMail.jpg"
                                OnClick="ImgCancel1_Click" CausesValidation="False" /></td>
                    </tr>
                </table>
                </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold; color: #000000" width="15%">
                From:</td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtFrom" runat="server" Width="483px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold; color: #000000">
                To:</td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtTo" runat="server" Width="483px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold; color: #000000">
                Subject:</td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtSubject" runat="server" Width="483px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" colspan="1">
                <asp:LinkButton ID="lnkAttachment" runat="server" Font-Bold="True" ForeColor="Maroon"
                    OnClick="lnkAttachment_Click" Width="121px" CausesValidation="False">Add Attachment</asp:LinkButton></td>
            <td align="right" colspan="2">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="font-weight: bold; color: #ffffff">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                <asp:LinkButton ID="lnkRemove" runat="server" Font-Bold="True" ForeColor="Maroon"
                    OnClick="lnkRemove_Click" Width="59px" CausesValidation="False">Remove</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="left" colspan="2" style="font-weight: bold; color: #ffffff; height: 19px">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; height: 19px">
                <asp:TextBox ID="txtMailMessage" runat="server" Height="239px" Width="607px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="background-color: #f0f0e8">
                <div style="text-align: left">
                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 155px">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImgSend2" runat="server" ImageUrl="~/images/SendMail.jpg" OnClick="ImgSend2_Click" /></td>
                            <td>
                                <asp:ImageButton ID="ImgCancel2" runat="server" ImageUrl="~/images/CancelMail.jpg"
                                    OnClick="ImgCancel2_Click" CausesValidation="False" /></td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

