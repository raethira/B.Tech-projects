<%@ Page Language="C#" MasterPageFile="~/HomeMasterPage.master" AutoEventWireup="true" CodeFile="frmContactUs.aspx.cs" Inherits="frmContactUs"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="800" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                 <img src="Images/contactus_04.jpg" width="800" />
            </td>
        </tr>
        <tr>
            <td height="200" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="50%" valign="top" align="center">
                        <br />
                        <img src="Images/img4.jpg" style="border-right: blue thin dotted; border-top: blue thin dotted; border-left: blue thin dotted; border-bottom: blue thin dotted" />
                        </td>
                        <td width="50%" valign="top">
                            <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                <tr>
                                    <td width="25%">
                                        <b>Name</b></td>
                                    <td width="2%">
                                        <b>:</b></td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Email ID</b>
                                    </td>
                                    <td>
                                        <b>:</b>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmailId" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailId"
                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Contact No</b></td>
                                    <td>
                                        <b>:</b></td>
                                    <td>
                                        <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactNo"
                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Subject</b></td>
                                    <td>
                                        <b>:</b></td>
                                    <td>
                                        <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSubject"
                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Message</b></td>
                                    <td>
                                        <b>:</b></td>
                                    <td>
                                        <asp:TextBox ID="txtMessage" runat="server" Height="72px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMessage"
                                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" CssClass="btnstyle" Text="Submit" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

