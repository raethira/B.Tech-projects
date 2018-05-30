<%@ Page Language="C#" MasterPageFile="~/Admin/Update/MasterPage.master" AutoEventWireup="true" CodeFile="frmUpdateUserProfile.aspx.cs" Inherits="Admin_Update_frmUpdateUserProfile" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 80%; border-right: maroon 1px groove; border-top: maroon 1px groove; border-left: maroon 1px groove; border-bottom: maroon 1px groove;">
        <tr>
            <td align="center" colspan="2">
                &nbsp;<asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" colspan="2" style="font-weight: bold; font-size: 13pt">
                Update User Profile</td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" colspan="2" style="font-weight: bold; background-color: darkgray">
            </td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; width: 216px">
                First Name:</td>
            <td align="left">
                <asp:TextBox ID="txtFName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFName"
                    Display="Dynamic" ErrorMessage="Enter First Name" Font-Bold="True" ValidationGroup="g1"
                    Width="125px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; width: 216px">
                Last Name:</td>
            <td align="left">
                <asp:TextBox ID="txtLName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLName"
                    Display="Dynamic" ErrorMessage="Enter Last Name" Font-Bold="True" ValidationGroup="g1"
                    Width="125px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; width: 216px">
                Address:</td>
            <td align="left">
                <asp:TextBox ID="txtAddress" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress"
                    Display="Dynamic" ErrorMessage="Enter Address" Font-Bold="True" ValidationGroup="g1"
                    Width="125px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; width: 216px; height: 5px">
                City</td>
            <td align="left">
                <asp:TextBox ID="txtCity" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity"
                    Display="Dynamic" ErrorMessage="Enter City" Font-Bold="True" ValidationGroup="g1"
                    Width="125px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; width: 216px">
                State:</td>
            <td align="left">
                <asp:DropDownList ID="ddlState" runat="server" Width="157px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="font-size: 12pt; font-family: Times New Roman">
            <td align="right" style="font-weight: bold; width: 216px">
                </td>
            <td style="width: 340px" align="left">
                <asp:TextBox ID="txtTerritory" runat="server" Width="168px" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px; height: 26px">
                Zip or Postal Code:</td>
            <td align="left">
                <asp:TextBox ID="txtPinCode" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPinCode"
                    Display="Dynamic" ErrorMessage="Enter Postal Code" Font-Bold="True" ValidationGroup="g1"
                    Width="125px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Country:</td>
            <td align="left">
                <asp:DropDownList ID="ddlCountry" runat="server" Width="157px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Email Address:</td>
            <td style="width: 340px" align="left">
                <asp:TextBox ID="txtMail" runat="server" Width="201px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMail"
                    Display="Dynamic" ErrorMessage="Invalid Email Address" Font-Bold="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="g1"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Phone Number.:</td>
            <td align="left">
                <asp:TextBox ID="txtPhone" runat="server" Width="168px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhone"
                    Display="Dynamic" ErrorMessage="Enter Phone No" Font-Bold="True" ValidationGroup="g1"
                    Width="125px"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="font-weight: bold; background-color: darkgray">
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px; height: 24px">
                Birthday:</td>
            <td style="width: 340px; height: 24px" align="left">
                <cc1:gmdatepicker id="GMDatePicker1" runat="server"></cc1:gmdatepicker>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Gender:</td>
            <td style="width: 340px" align="left">
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem>Choose One...</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Primary Language:</td>
            <td style="width: 340px" align="left">
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
            <td align="right" style="font-weight: bold; width: 216px">
                Household Income:</td>
            <td style="width: 340px" align="left">
                <asp:DropDownList ID="ddlIncome" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Occupation:</td>
            <td style="width: 340px" align="left">
                <asp:DropDownList ID="ddlOccupation" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Industry:</td>
            <td style="width: 340px" align="left">
                <asp:DropDownList ID="ddlIndustry" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px">
                Intrests:</td>
            <td style="width: 340px" align="left">
                <asp:CheckBoxList ID="chklistInrest" runat="server" Height="88px" RepeatColumns="3"
                    RepeatDirection="Horizontal" Width="455px">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold">
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Change Profile"
                    ValidationGroup="g1" />
                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" ValidationGroup="g1" /></td>
        </tr>
    </table>
</asp:Content>

