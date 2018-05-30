<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddressBookUserControl.ascx.cs" Inherits="User_Control_AddressBookUserControl" %>
<div style="text-align: left">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 48%">
        <tr>
            <td>
                <asp:Button ID="btnMail" runat="server" Text="Mail" OnClick="btnMail_Click" Width="71px" /></td>
            <td>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="93px" /></td>
            <td style="width: 100px">
                <asp:Button ID="btnNewContact" runat="server" Text="New Contact" /></td>
            <td>
            </td>
            <td>
                <asp:Button ID="btnImportConatct" runat="server" Text="Import Contact" /></td>
            <td>
                <asp:Button ID="btnShowConatct" runat="server" Text="Show Contact" /></td>
        </tr>
    </table>
</div>
