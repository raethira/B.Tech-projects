<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmSendmailMessagePage.aspx.cs" Inherits="Registration_RegisterUser_frmSendmailMessagePage"
    %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="center" colspan="3" style="background-color: #f0f0e8">
                <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 155px">
                    <tr>
                        <td>
                            <asp:ImageButton ID="imgAddContact" runat="server" ImageUrl="~/images/AddToContact.jpg"
                                OnClick="imgAddContact_Click" /></td>
                        <td>
                            <asp:ImageButton ID="ImgReturnToInbox" runat="server" ImageUrl="~/images/ReturnToInbox.jpg"
                                OnClick="ImgReturnToInbox_Click" /></td>
                        <td>
                        </td>
                    </tr>
                </table>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff">
                &nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" colspan="4" style="font-weight: bold; color: black;" >
                Your Message has been sent to the following receipient</td>
        </tr>
        <tr>
            <td align="right" colspan="4" style="font-weight: bold; color: #ffffff; ">
            </td>
        </tr>
        <tr>
            <td align="left" colspan="3" style="font-weight: bold; color: #ffffff;">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Add Contact" Width="134px" AutoPostBack="True"
                    OnCheckedChanged="CheckBox1_CheckedChanged" ForeColor="Black" />
                <asp:Label ID="lblName" runat="server" Width="278px" ForeColor="Black"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff;">
                <asp:Panel ID="Panel1" runat="server" Width="100%">
                    <div style="text-align: center">
                        <table border="0" cellpadding="2" cellspacing="2" style="width: 100%">
                            <tr>
                                <td align="left" style="color: black">
                                    First Name<br />
                                    <asp:TextBox ID="txtFName" runat="server"></asp:TextBox></td>
                                <td align="left" style="color: black">
                                    Last Name<br />
                                    <asp:TextBox ID="txtLName" runat="server"></asp:TextBox></td>
                                <td align="left" style="color: black">
                                    Company Name<br />
                                    <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox></td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; ">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Maroon" Width="331px"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
