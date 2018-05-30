<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmAddNewContactBook.aspx.cs" Inherits="Registration_RegisterUser_frmUserAddressBook"
    Title="Untitled Page" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 357px; border-right: blue 1px dotted; border-top: blue 1px dotted; border-left: blue 1px dotted; border-bottom: blue 1px dotted;">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#004000"
                    Width="455px"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="font-weight: bold; font-size: 12pt; color: #ffffff;
                background-color: #0072b8; text-align: left">
                Add Your New Contact</td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" colspan="2" style="font-weight: bold; background-color: darkgray">
            </td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt; width: 200px;">
                First Name:</td>
            <td align="left">
                <asp:TextBox ID="txtFName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFName"
                    ErrorMessage="Require" Font-Bold="True" ValidationGroup="g1"
                    Width="55px" ToolTip="Enter First Name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Last Name:</td>
            <td align="left">
                <asp:TextBox ID="txtLName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLName"
                    ErrorMessage="Rrequire" Font-Bold="True" ValidationGroup="g1"
                    Width="55px" ToolTip="Enter Last Name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Gender:</td>
            <td style="width: 340px" align="left">
                <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="g1">
                    <asp:ListItem>Choose One...</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLName"
                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Last Name"
                    ValidationGroup="g1" Width="47px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Address:</td>
            <td align="left">
                <asp:TextBox ID="txtAddress" runat="server" ValidationGroup="g1" Width="168px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Require" Font-Bold="True" ValidationGroup="g1"
                    Width="53px" ToolTip="Enter Address"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                City</td>
            <td align="left">
                <asp:TextBox ID="txtCity" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="Require" Font-Bold="True" ValidationGroup="g1"
                    Width="53px" ToolTip="Enter City"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                State:</td>
            <td align="left">
                <asp:DropDownList ID="ddlState" runat="server" Width="157px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Country:</td>
            <td align="left">
                <asp:DropDownList ID="ddlCountry" runat="server" Width="157px">
                </asp:DropDownList></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Zip or Postal Code:</td>
            <td align="left">
                <asp:TextBox ID="txtPinCode" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPinCode"
                    ErrorMessage="Require" Font-Bold="True" ValidationGroup="g1"
                    Width="25px" ToolTip="Enter Postal Code"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Phone Number.:</td>
            <td align="left" style="width: 340px">
                <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Phone"
                    ValidationGroup="g1" Width="25px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Mobile:</td>
            <td align="left" style="width: 340px">
                <asp:TextBox ID="txtMobile" runat="server" Width="168px"></asp:TextBox></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Email Address:</td>
            <td style="width: 340px" align="left">
                <asp:TextBox ID="txtMail" runat="server" Width="201px"></asp:TextBox>
            </td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; font-size: 10pt;">
                Birthday:</td>
            <td align="left" style="width: 340px; height: 24px">
                <cc1:GMDatePicker ID="GMDatePicker1" runat="server">
                </cc1:GMDatePicker>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold">
                <asp:Button ID="btnAddContact" runat="server" OnClick="btnAddContact_Click" Text="Add Contact"
                    ValidationGroup="g1" />
                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" /></td>
        </tr>
    </table>
</asp:Content>
