<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true" CodeFile="frmViewFullMessage.aspx.cs" Inherits="Admin_frmViewFullMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="0" cellpadding="2" cellspacing="2" style="width: 80%">
        <tr>
            <td align="center" colspan="3">
                <div style="text-align: left">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 699px">
                        <tr>
                            <td align="right">
                                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back<<" Width="69px" /></td>
                        </tr>
                    </table>
                </div>
            </td>
            <td align="center" colspan="1" style="background-color: #f0f0e8" valign="top">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="5" style="font-weight: bold; color: #ffffff; height: 19px">
                <asp:Label ID="lblFullMsg" runat="server" ForeColor="Black" Height="311px" Width="695px"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; height: 19px">
                &nbsp;</td>
            <td align="center" colspan="1" style="font-weight: bold; color: #ffffff; height: 19px">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="font-weight: bold">
                Download Attachments:<asp:HyperLink ID="HypAttachment" runat="server" Font-Bold="True"
                    ForeColor="Maroon">[HypAttachment]</asp:HyperLink></td>
            <td align="center" colspan="1" style="font-weight: bold; color: #ffffff; height: 19px">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; height: 19px">
                <asp:Label ID="lblMsg" runat="server" ForeColor="#004000"></asp:Label></td>
            <td align="center" colspan="1" style="font-weight: bold; color: #ffffff; height: 19px">
            </td>
        </tr>
    </table>
</asp:Content>

