<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master" AutoEventWireup="true" CodeFile="frmAddContactType.aspx.cs" Inherits="Registration_RegisterUser_frmAddContactType"  %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager id="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="text-align: center">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px" align="center">
                    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="346px"
                        Width="377px" BackColor="#C0C0FF" BorderColor="#0072B8">
                          <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                            <ContentTemplate>
                                <table align="center" border="1" cellpadding="0" cellspacing="0" style="width: 400px" bgcolor="#0072b8">
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Gold"
                                                Width="455px"></asp:Label></td>
                                    </tr>
                                    <tr style="font-size: 12pt; color:White; font-family: Times New Roman">
                                        <td align="left" colspan="2" style="font-weight: bold; background-color: Gray; font-size: 12pt;">
                                            Add Your New Contact</td>
                                    </tr>
                                    <tr style="font-size: 12pt;color:White; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold">
                                            First Name:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtFName" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFName"
                                                ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter First Name"
                                                ValidationGroup="g2" Width="55px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right"  style="font-weight: bold; color:White;">
                                            Last Name:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtLName" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLName"
                                                ErrorMessage="Rrequire" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Last Name"
                                                ValidationGroup="g2" Width="55px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold; color:White;">
                                            Gender:</td>
                                        <td align="left" style="width: 340px">
                                            <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="g2">
                                                <asp:ListItem>Choose One...</asp:ListItem>
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLName"
                                                ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Last Name"
                                                ValidationGroup="g2" Width="47px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold; color:White;">
                                            Address:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" ValidationGroup="g2"
                                                Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress"
                                                ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Address"
                                                ValidationGroup="g2" Width="53px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold;color:White;">
                                            City:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtCity" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity"
                                                ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter City"
                                                ValidationGroup="g2" Width="53px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold;color:White;">
                                            State:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlState" runat="server" Width="157px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Country:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlCountry" runat="server" Width="157px">
                                            </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Zip or Postal Code:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtPinCode" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPinCode"
                                                ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Postal Code"
                                                ValidationGroup="g2" Width="25px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Phone Number:</td>
                                        <td align="left" style="width: 340px">
                                            <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Mobile:</td>
                                        <td align="left" style="width: 340px">
                                            <asp:TextBox ID="txtMobile" runat="server" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile"
                                                ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Phone"
                                                ValidationGroup="g2" Width="25px"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold; color:White;">
                                            Email Address:</td>
                                        <td align="left" style="width: 340px">
                                            <asp:TextBox ID="txtMail" runat="server" Width="201px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Birthday:</td>
                                        <td align="left" style="width: 340px; height: 24px">
                                            <cc2:gmdatepicker id="GMDatePicker1" runat="server" autoposition="True" calendaroffsetx="-200px"
                                                calendaroffsety="25px" calendartheme="None" calendarwidth="200px" callbackeventreference=""
                                                culture="English (United States)" enabledropshadow="True" maxdate="9999-12-31"
                                                mindate="" nextmonthtext=">" nonebuttontext="None" shownonebutton="True" showtodaybutton="True"
                                                textboxwidth="100" zindex="1"></cc2:gmdatepicker>
                                          
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="font-weight: bold">
                                            <asp:Button ID="btnAddContact" runat="server" OnClick="btnAddContact_Click" Text="Add Contact"
                                                ValidationGroup="g2" />
                                            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" CausesValidation="False" /></td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <HeaderTemplate>
                                Personal Contact Detail
                            </HeaderTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                            <ContentTemplate>
                                <table align="center" border="1" cellpadding="0" cellspacing="0" style="width: 400px" bgcolor="#0072b8">
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Label ID="lblMsg1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Gold"
                                                Width="455px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="left" colspan="2" style="font-weight: bold; color:White; font-size: 12pt; background-color: Gray">
                                            Add Your New Official Contact</td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Company Name:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtCompanyName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCompanyName"
                                                ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Organization Name" ValidationGroup="g1"
                                                Width="55px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold;color:White;">
                                            First Name:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtFName1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="Req5" runat="server" ControlToValidate="txtFName1"
                                                ErrorMessage="Require" Font-Bold="True" ToolTip="Enter First Name" ValidationGroup="g1"
                                                Width="55px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Last Name:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtLName1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="Req6" runat="server" ControlToValidate="txtLName1"
                                                ErrorMessage="Rrequire" Font-Bold="True" ToolTip="Enter Last Name" ValidationGroup="g1"
                                                Width="55px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Address:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtAddress1" runat="server" TextMode="MultiLine" ValidationGroup="g1"
                                                Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="Req7" runat="server" ControlToValidate="txtAddress1"
                                                ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Address" ValidationGroup="g1"
                                                Width="53px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold;color:White;">
                                            City:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtCity1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="Req8" runat="server" ControlToValidate="txtCity1"
                                                ErrorMessage="Require" Font-Bold="True" ToolTip="Enter City" ValidationGroup="g1"
                                                Width="53px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style="font-size: 12pt; font-family: Times New Roman">
                                        <td align="right" style="font-weight: bold;color:White;">
                                            State:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlState1" runat="server" Width="157px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="Req1" runat="server" ControlToValidate="ddlState1"
                                                ErrorMessage="Require" Font-Bold="True" InitialValue="Choose One..." ToolTip="Enter City"
                                                ValidationGroup="g1" Width="53px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Country:</td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlCountry1" runat="server" Width="157px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="Req4" runat="server" ControlToValidate="ddlCountry1"
                                                ErrorMessage="Require" Font-Bold="True" InitialValue="Choose One..." ToolTip="Enter City"
                                                ValidationGroup="g1" Width="53px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Zip or Postal Code:</td>
                                        <td align="left">
                                            <asp:TextBox ID="txtPinCode1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="Req9" runat="server" ControlToValidate="txtPinCode1"
                                                ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Postal Code" ValidationGroup="g1"
                                                Width="25px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Phone Number.:</td>
                                        <td align="left" style="width: 340px">
                                            <asp:TextBox ID="txtPhone1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Mobile:</td>
                                        <td align="left" style="width: 340px">
                                            <asp:TextBox ID="txtMobile1" runat="server" Width="168px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="Req2" runat="server" ControlToValidate="txtMobile1"
                                                ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Phone" ValidationGroup="g1"
                                                Width="25px" ForeColor="Gold"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Fax No.:</td>
                                        <td align="left" style="width: 340px">
                                            <asp:TextBox ID="txtFaxNo" runat="server" Width="168px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold; color:White;">
                                            Email Address:</td>
                                        <td align="left" style="width: 340px">
                                            <asp:TextBox ID="txtMail1" runat="server" Width="201px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;color:White;">
                                            Website:</td>
                                        <td align="left" style="width: 340px; height: 24px">
                                            <asp:TextBox ID="txtWebsite" runat="server" Width="201px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="font-weight: bold">
                                            <asp:Button ID="btnAddOfficialContact" runat="server" OnClick="btnAddOfficialContact_Click" Text="Add Contact"
                                                ValidationGroup="g1" />
                                            <asp:Button ID="btnBack1" runat="server" OnClick="btnBack1_Click" Text="Back" CausesValidation="False" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <HeaderTemplate>
                                Official Contact Detail
                            </HeaderTemplate>
                        </cc1:TabPanel>
                      
                    </cc1:TabContainer></td>
            </tr>
        </table>
    </div>
</asp:Content>

