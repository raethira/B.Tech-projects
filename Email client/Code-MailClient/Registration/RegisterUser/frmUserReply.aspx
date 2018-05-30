<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmUserReply.aspx.cs" Inherits="Registration_RegisterUser_frmUserReply"
   %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="center" colspan="3" style="background-color: #f0f0e8">
                <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 155px">
                    <tr>
                        <td>
                            <asp:ImageButton ID="imgSend1" runat="server" ImageUrl="~/images/SendMail.jpg" OnClick="imgSend1_Click" /></td>
                        <td>
                            <asp:ImageButton ID="ImgSave1" runat="server" ImageUrl="~/images/SaveDraft.jpg" OnClick="ImgSave1_Click" /></td>
                        <td>
                            <asp:ImageButton ID="ImgCancel1" runat="server" ImageUrl="~/images/CancelMail.jpg"
                                OnClick="ImgCancel1_Click" CausesValidation="False" /></td>
                    </tr>
                </table>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff">
                &nbsp; &nbsp;
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Width="169px"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="font-weight: bold; color: black">
                Separate each address with a comma</td>
        </tr>
        <tr>
            <td align="right" colspan="3" style="font-weight: bold; color: #ffffff">
                <asp:LinkButton ID="lnkUseeAddresbook" runat="server" ForeColor="Maroon" Width="121px">Use Addressbook</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold; color: black">
                From:</td>
            <td align="left">
                <asp:TextBox ID="txtFrom" runat="server" Width="420px"></asp:TextBox></td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold; color: black">
                To:</td>
            <td align="left">
                <asp:TextBox ID="txtTo" runat="server" Width="420px"></asp:TextBox></td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="left" style="font-weight: bold; color: black">
                Subject:</td>
            <td align="left">
                <asp:TextBox ID="txtSubject" runat="server" Width="420px"></asp:TextBox></td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="1">
                <asp:LinkButton ID="lnkAttachment" runat="server" Font-Bold="True" ForeColor="Maroon"
                    OnClick="lnkAttachment_Click" Width="121px">Add Attachment</asp:LinkButton></td>
            <td align="right" colspan="3">
                <asp:CheckBox ID="chkSave" runat="server" Checked="True" Font-Bold="True" ForeColor="Maroon"
                    Text="Save Copy To Sent Folder" /></td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="font-weight: bold; color: #ffffff; height: 22px;">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="350px" />
                <asp:LinkButton ID="lnkRemove" runat="server" Font-Bold="True" ForeColor="Maroon"
                    OnClick="lnkRemove_Click" Width="59px">Remove</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="font-weight: bold; color: #ffffff; height: 19px">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; height: 19px">
                <asp:TextBox ID="txtMailMessage" runat="server" Height="239px" Width="525px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="background-color: #f0f0e8">
                <div style="text-align: left">
                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 155px">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImgSend2" runat="server" ImageUrl="~/images/SendMail.jpg" OnClick="ImgSend2_Click" /></td>
                            <td>
                                <asp:ImageButton ID="ImgSave2" runat="server" ImageUrl="~/images/SaveDraft.jpg" OnClick="ImgSave2_Click" /></td>
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
