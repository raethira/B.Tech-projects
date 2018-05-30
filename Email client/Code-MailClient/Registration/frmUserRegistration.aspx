<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Registration/MasterPage.master"
    CodeFile="frmUserRegistration.aspx.cs" Inherits="Registration_frmUserRegistration" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table border="0" cellpadding="2" cellspacing="0" align="right" width="100%">
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Red"
                    ></asp:Label></td>
        </tr>
        <tr>
            <td align="right" colspan="1" style="font-weight: bold; font-size: 12pt; color: #ffffff;
                background-color: #0072b8; text-align: left;">
                Create New Account</td>
            <td colspan="1" style="font-weight: bold; font-size: 14pt; color: #ffffff; background-color: #0072b8;
                text-align: right">
                </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
            User Name:
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Width="168px" ValidationGroup="g1"></asp:TextBox>
                 <span
                    style="color: Black"><strong>@Spicemail.com
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Enter User Name" ValidationGroup="g1" Width="135px"
                    Font-Bold="True"></asp:RequiredFieldValidator></strong></span></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                </td>
            <td>
               
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:LinkButton ID="lnkAvailability" runat="server" Font-Bold="True" ForeColor="Maroon"
                            OnClick="lnkAvailability_Click" Width="131px">Check Availability</asp:LinkButton>
                        <asp:Label ID="lblAvailability" runat="server" Font-Bold="True" ForeColor="Green"
                            Width="275px"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Password:</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Confirm Password:</td>
            <td style="width: 340px">
                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword"
                    ControlToValidate="txtConfirm" ErrorMessage="Password Mismatch" ValidationGroup="g1"
                    Font-Bold="True"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Hint Question:</td>
            <td>
                <asp:TextBox ID="txtQuestion" runat="server" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQuestion" ErrorMessage="Enter Hint Question" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Answer:</td>
            <td>
                <asp:TextBox ID="txtAnswer" runat="server" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAnswer" ErrorMessage="Enter Answer" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="font-weight: bold; background-color: Gray">
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                First Name:</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFName" ErrorMessage="Enter First Name" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLName" ErrorMessage="Enter Last Name" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Address:</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="Enter Address" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
            </td>
            <td style="width: 340px">
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                City</td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" ErrorMessage="Enter City" ValidationGroup="g1" Width="125px" Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                State:</td>
            <td style="width: 340px">
                <asp:DropDownList ID="ddlState" runat="server" Width="176px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlState" ErrorMessage="Select State" Font-Bold="True"
                    InitialValue="Choose One..." ValidationGroup="g1" Width="125px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; width: 216px; height: 26px;">
                Zip or Postal Code:</td>
            <td>
                <asp:TextBox ID="txtPinCode" runat="server" Width="168px" ValidationGroup="g1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPinCode" ErrorMessage="Enter Postal Code" ValidationGroup="g1" Width="125px"
                    Font-Bold="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Country:</td>
            <td style="width: 340px">
                <asp:DropDownList ID="ddlCountry" runat="server" Width="157px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Select Country" Font-Bold="True"
                    InitialValue="Choose One..." ValidationGroup="g1" Width="125px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Email Address:</td>
            <td style="width: 340px">
                <asp:TextBox ID="txtMail" runat="server" Width="201px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Phone Number:</td>
            <td style="width: 340px">
                <asp:TextBox ID="txtPhone" runat="server" Width="168px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="font-weight: bold; background-color: Gray">
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold;">
                Birthday:</td>
            <td style="width: 340px; height: 24px;">
                <cc1:GMDatePicker ID="GMDatePicker1" runat="server" CalendarTheme="Blue" NoneButtonText="Clear">
                </cc1:GMDatePicker>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Gender:</td>
            <td style="width: 340px">
                <asp:DropDownList ID="ddlGender" runat="server" Width="136px">
                    <asp:ListItem>Choose One...</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Primary Language:</td>
            <td style="width: 340px">
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
            <td style="width: 340px">
                <asp:DropDownList ID="ddlIncome" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Occupation:</td>
            <td style="width: 340px">
                <asp:DropDownList ID="ddlOccupation" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Industry:</td>
            <td style="width: 340px">
                <asp:DropDownList ID="ddlIndustry" runat="server" Width="161px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
            </td>
            <td style="width: 340px">
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Intrests:</td>
            <td style="width: 340px">
                <asp:CheckBoxList ID="chklistInrest" runat="server" Height="88px" RepeatColumns="3"
                    RepeatDirection="Horizontal" Width="455px">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td align="right" >
            </td>
            
            <td style="font-weight: bold">
            Numbers Verification This step helps prevent abuse. 
If you cannot read the numbers, refresh/reload this page to try a different set of numbers.</td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td style="font-weight: bold">
                <asp:TextBox ID="txtRandomNumber" runat="server" BackColor="LightGray" BorderColor="Black"
                    BorderWidth="1px" Height="20px" Width="110px" Font-Bold="True" Font-Size="14pt"
                    Font-Strikeout="True" ReadOnly="True" BorderStyle="None"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold; ">
                Enter No. As Shown:</td>
            <td>
                
                <asp:TextBox ID="txtNumber" runat="server" Width="197px" ValidationGroup="g1"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtRandomNumber"
                    ControlToValidate="txtNumber" ErrorMessage="No. Not Matched" Font-Bold="True"
                    Width="170px" ValidationGroup="g1"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold;" colspan="2">
                <asp:Button ID="btnContinue" runat="server" Text="submit" OnClick="btnContinue_Click"
                    ValidationGroup="g1" />
            </td>
        </tr>
    </table>
</asp:Content>
