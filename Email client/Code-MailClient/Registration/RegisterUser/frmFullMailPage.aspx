<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmFullMailPage.aspx.cs" Inherits="Registration_RegisterUser_frmFullMailPage"
     %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="center" colspan="3" style="background-color: #f0f0e8">
                <div style="text-align: left">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td style="width: 100px">
                                <asp:ImageButton ID="ImgReturnToInbox" runat="server" ImageUrl="~/images/ReturnToInbox.jpg"
                                    OnClick="ImgReturnToInbox_Click" /></td>
                        </tr>
                    </table>
                </div>
            </td>
            <td align="center" colspan="1" style="background-color: #f0f0e8" valign="top">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4" style="font-weight: bold; color: #ffffff">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" colspan="5" style="font-weight: bold; color: #ffffff; ">
                <asp:Label ID="lblFullMsg" runat="server" Height="189px" Width="544px" ForeColor="Black"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="font-weight: bold; color: #ffffff; ">
                &nbsp;</td>
            <td align="center" colspan="1" style="font-weight: bold; color: #ffffff; ">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="font-weight: bold; color: black; ">
                Download Attachment&nbsp;
                <asp:HyperLink ID="HypAttachment" runat="server" Font-Bold="True" ForeColor="Maroon"
                    Width="193px">[HypAttachment]</asp:HyperLink></td>
            <td align="center" colspan="1" style="font-weight: bold; color: #ffffff; ">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; ">
                <asp:Label ID="lblMsg" runat="server" ForeColor="#004040" Width="331px"></asp:Label></td>
            <td align="center" colspan="1" style="font-weight: bold; color: #ffffff; ">
            </td>
        </tr>
    </table>
</asp:Content>
