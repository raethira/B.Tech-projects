<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master" AutoEventWireup="true"
    CodeFile="frmUpdateUserProfile.aspx.cs" Inherits="Registration_frmUpdateUserProfile"
    Title="Untitled Page" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%; border-right: blue 1px dotted; border-top: blue 1px dotted; border-left: blue 1px dotted; border-bottom: blue 1px dotted;">
        <tr>
            <td align="center" colspan="2">
                &nbsp;<asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Maroon"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="font-weight: bold; font-size: 13pt; color: #ffffff;
                background-color: #0072b8; text-align: left">
                Update Your Profile</td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" colspan="2" style="font-weight: bold; background-color: Gray">
            </td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold;">
                First Name:</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFName" ErrorMessage="Enter First Name" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; ">
                Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLName" ErrorMessage="Enter Last Name" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; ">
                Address:</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="Enter Address" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold;">
                City</td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" ErrorMessage="Enter City" ValidationGroup="g1" Width="125px" Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; ">
                State:</td>
            <td>
                <asp:DropDownList ID="ddlState" runat="server" Width="157px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Zip or Postal Code:</td>
            <td>
                <asp:TextBox ID="txtPinCode" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPinCode" ErrorMessage="Enter Postal Code" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Country:</td>
            <td>
                <asp:DropDownList ID="ddlCountry" runat="server" Width="157px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Email Address:</td>
            <td>
                <asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Phone Number.:</td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" Width="168px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="font-weight: bold; background-color: Gray">
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Birthday:</td>
            <td>
                <cc1:GMDatePicker ID="GMDatePicker1" runat="server">
                </cc1:GMDatePicker>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Gender:</td>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem>Choose One...</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Primary Language:</td>
            <td>
                <asp:DropDownList ID="ddlLanguage" runat="server" Width="138px">
                    <asp:ListItem>Choose One...</asp:ListItem>
                    <asp:ListItem>English</asp:ListItem>
                    <asp:ListItem>Hindi</asp:ListItem>
                    <asp:ListItem>Spanish</asp:ListItem>
                    <asp:ListItem>Chinese</asp:ListItem>
                    <asp:ListItem>Latin</asp:ListItem>
                    <asp:ListItem>Greek</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Household Income:</td>
            <td>
                <asp:DropDownList ID="ddlIncome" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Occupation:</td>
            <td>
                <asp:DropDownList ID="ddlOccupation" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Industry:</td>
            <td>
                <asp:DropDownList ID="ddlIndustry" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
            </td>
            <td >
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Intrests:</td>
            <td>
                <asp:CheckBoxList ID="chklistInrest" runat="server" Height="100px" RepeatColumns="3"
                    RepeatDirection="Horizontal" Width="390px">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnUpdate" runat="server" Text="Change Profile" ValidationGroup="g1"
                    OnClick="btnUpdate_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" ValidationGroup="g1" OnClick="btnBack_Click" CausesValidation="False" /></td>
        </tr>
    </table>
</asp:Content>
