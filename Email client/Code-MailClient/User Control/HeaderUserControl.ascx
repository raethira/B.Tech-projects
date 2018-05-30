<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderUserControl.ascx.cs" Inherits="User_Control_HeaderUserControl" %>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td align="center">
            <table align="center" style="width: 429px; height: 15px">
                <tr>
                    <td align="center" valign="top">
                        <asp:LinkButton ID="lnkHome" runat="server" Font-Bold="True" ForeColor="Maroon" Height="11px"
                            OnClick="lnkHome_Click" Width="106px" CausesValidation="False">Home</asp:LinkButton></td>
                    <td align="center" valign="top">
                        <asp:LinkButton ID="lnkFeedback" runat="server" Font-Bold="True" ForeColor="Maroon"
                            OnClick="lnkFeedback_Click" Width="99px" CausesValidation="False">Feedback</asp:LinkButton></td>
                    <td align="center" style="width: 100px">
            <asp:Menu ID="Menu1" runat="server" Font-Bold="True" ForeColor="Maroon" Orientation="Horizontal"
                Width="95px" >
                <Items>
                    <asp:MenuItem Text="Options" Value="Options">
                        <asp:MenuItem NavigateUrl="~/Registration/RegisterUser/frmChangePassword.aspx" Text="Change Password"
                            Value="Change Password"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Registration/RegisterUser/frmUpdateUserProfile.aspx" Text="Update Profile"
                            Value="Update Profile"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
                    </td>
                    <td align="center" valign="top">
                        <asp:LinkButton ID="lnkLogout" runat="server" Font-Bold="True" ForeColor="Maroon" OnClick="lnkLogout_Click"
                            Width="99px" CausesValidation="False">Logout</asp:LinkButton></td>
                </tr>
            </table>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center">
            <strong>
            Welcome,&nbsp;</strong><asp:Label ID="lblUserName" runat="server" Font-Bold="True" ForeColor="Green"></asp:Label>
            &nbsp;<strong>Email</strong>:&nbsp;<asp:Label ID="lblLogin" runat="server" Font-Bold="True" ForeColor="Green"></asp:Label></td>
    </tr>
    <tr>
        <td align="center">
            &nbsp; &nbsp;
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:TextBox ID="txtSearch" runat="server" Visible="False"></asp:TextBox><asp:Button ID="btnSearch"
                runat="server" Text="Search" Visible="False" /></td>
    </tr>
</table>
