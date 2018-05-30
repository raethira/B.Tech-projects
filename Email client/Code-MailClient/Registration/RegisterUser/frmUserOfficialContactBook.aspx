<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master" AutoEventWireup="true" CodeFile="frmUserOfficialContactBook.aspx.cs" Inherits="Registration_RegisterUser_frmUserOfficialContactBook"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 357px; border-right: blue 1px dotted; border-top: blue 1px dotted; border-left: blue 1px dotted; border-bottom: blue 1px dotted;">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#004000"
                    Width="455px"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="font-weight: bold; font-size: 12pt; color: white;
                background-color: #0072b8; text-align: left">
                Add Your New Official Contact</td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" colspan="2" style="font-weight: bold; background-color: darkgray">
            </td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold">
                Company Name:</td>
            <td align="left">
                <asp:TextBox ID="txtCompanyName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCompanyName"
                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Organization Name"
                    ValidationGroup="g1" Width="55px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold">
                First Name:</td>
            <td align="left">
                <asp:TextBox ID="txtFName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFName"
                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter First Name"
                    ValidationGroup="g1" Width="55px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold">
                Last Name:</td>
            <td align="left">
                <asp:TextBox ID="txtLName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLName"
                    ErrorMessage="Rrequire" Font-Bold="True" ToolTip="Enter Last Name"
                    ValidationGroup="g1" Width="55px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold">
                Address:</td>
            <td align="left">
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" ValidationGroup="g1"
                    Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Address"
                    ValidationGroup="g1" Width="53px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold">
                City</td>
            <td align="left">
                <asp:TextBox ID="txtCity" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter City"
                    ValidationGroup="g1" Width="53px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold">
                State:</td>
            <td align="left">
                <asp:DropDownList ID="ddlState" runat="server" Width="176px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="Require" Font-Bold="True" InitialValue="Choose One..."
                    ToolTip="Enter City" ValidationGroup="g1" Width="53px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Country:</td>
            <td align="left">
                <asp:DropDownList ID="ddlCountry" runat="server" Width="175px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="Require" Font-Bold="True" InitialValue="Choose One..."
                    ToolTip="Enter City" ValidationGroup="g1" Width="53px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Zip or Postal Code:</td>
            <td align="left">
                <asp:TextBox ID="txtPinCode" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPinCode"
                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Postal Code"
                    ValidationGroup="g1" Width="25px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Phone Number.:</td>
            <td align="left" style="width: 340px">
                <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Phone"
                    ValidationGroup="g1" Width="25px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Mobile:</td>
            <td align="left" style="width: 340px">
                <asp:TextBox ID="txtMobile" runat="server" Width="168px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Fax No.:</td>
            <td align="left" style="width: 340px">
                <asp:TextBox ID="txtFaxNo" runat="server" Width="168px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Email Address:</td>
            <td align="left" style="width: 340px">
                <asp:TextBox ID="txtMail" runat="server" Width="201px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Website:</td>
            <td align="left" style="width: 340px; height: 24px">
                <asp:TextBox ID="txtWebsite" runat="server" Width="201px"></asp:TextBox>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold">
                <asp:Button ID="btnAddContact" runat="server" OnClick="btnAddContact_Click" Text="Add Contact"
                    ValidationGroup="g1" />
                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" CausesValidation="False" /></td>
        </tr>
    </table>
</asp:Content>

