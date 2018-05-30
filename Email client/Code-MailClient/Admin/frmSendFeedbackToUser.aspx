<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true" CodeFile="frmSendFeedbackToUser.aspx.cs" Inherits="Admin_frmSendFeedbackToUser"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table align="center" border="0" cellpadding="2" cellspacing="2" style="width: 100%;height:300px;
        ">
<tr>
<td valign="middle">


    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 70%;
        ">
        <tr>
            <td align="right" colspan="3" style="font-weight: bold; color: #ffffff">
                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back<<" Width="71px" /></td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: black; height: 19px">
                Your Message has been sent to the following receipient</td>
        </tr>
        <tr>
            <td align="center" colspan="4" style="font-weight: bold; color: #ffffff; height: 19px">
                &nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; height: 19px">
                &nbsp;<asp:Label ID="lblName" runat="server" ForeColor="#C00000"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; height: 19px">
                </td>
        </tr>
    </table>
    </td>
</tr>
</table>
</asp:Content>

