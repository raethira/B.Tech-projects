<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmShowContactByType.aspx.cs" Inherits="Registration_RegisterUser_frmShowContactByType"
     %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td align="right" colspan="1">
                <asp:LinkButton ID="lnkReturn" runat="server" Font-Bold="True" ForeColor="Maroon"
                    OnClick="lnkReturn_Click" Width="95px" CausesValidation="False">Return To<<</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton ID="lnkPersonal" runat="server" Font-Bold="True" ForeColor="Maroon"
                    Width="117px" OnClick="lnkPersonal_Click" CausesValidation="False">Personal Contact</asp:LinkButton>
                <asp:LinkButton ID="lnkOfficial" runat="server" Font-Bold="True" ForeColor="Maroon"
                    Width="107px" OnClick="lnkOfficial_Click" CausesValidation="False">Official Contact</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="Panel3" runat="server"  Width="100%">
                <strong>Personal Contact</strong>
                    <asp:GridView ID="GridView3" runat="server" Width="100%" AutoGenerateColumns="False"
                        AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView3_PageIndexChanging"
                        OnRowDeleting="GridView3_RowDeleting" OnRowUpdating="GridView3_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl1" runat="server" Text='<%#Eval("FirstName") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl2" runat="server" Text='<%#Eval("LastName") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl3" runat="server" Text='<%#Eval("Mobile") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl4" runat="server" Text='<%#Eval("Email") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete ?">
                                <ItemTemplate>
                                    <asp:Button ID="btndelete" Text="Delete ?" OnClientClick="return confirm('Are U Sure ?')"
                                        CommandName="Delete" CommandArgument='<%#Eval("Id") %>' runat="server" CausesValidation="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Update ?">
                                <ItemTemplate>
                                    <asp:Button ID="btnupdate" Text="Update ?" CommandName="Update" CommandArgument='<%#Eval("Id") %>'
                                        runat="server"  CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#0072B8" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    &nbsp;
                </asp:Panel>
                &nbsp; &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="Panel5" runat="server" Width="100%">
                    <table align="center" bgcolor="#0072b8" border="1" cellpadding="0" cellspacing="0"
                        style="width: 100%">
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Yellow"
                                    ></asp:Label>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="left" colspan="2" style="font-weight: bold; font-size: 12pt; background-color: darkgray; color: white;">
                                Update Personal Contact</td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                First Name:</td>
                            <td align="left">
                                <asp:TextBox ID="txtFName" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtFName"
                                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter First Name"
                                    ValidationGroup="g2" Width="55px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Last Name:</td>
                            <td align="left">
                                <asp:TextBox ID="txtLName" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtLName"
                                    ErrorMessage="Rrequire" Font-Bold="True" ToolTip="Enter Last Name"
                                    ValidationGroup="g2" Width="55px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Gender:</td>
                            <td align="left" style="width: 340px">
                                <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="g2">
                                    <asp:ListItem>Choose One...</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtLName"
                                    ErrorMessage="Require" Font-Bold="True" InitialValue="Choose One..."
                                    ToolTip="Enter Last Name" ValidationGroup="g2" Width="47px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Address:</td>
                            <td align="left">
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" ValidationGroup="g2"
                                    Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtAddress"
                                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Address"
                                    ValidationGroup="g2" Width="53px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                City</td>
                            <td align="left">
                                <asp:TextBox ID="txtCity" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtCity"
                                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter City"
                                    ValidationGroup="g2" Width="53px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                State:</td>
                            <td align="left">
                                <asp:DropDownList ID="ddlState" runat="server" Width="157px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="ddlState"
                                    ErrorMessage="Require" Font-Bold="True" InitialValue="Choose One..."
                                    ToolTip="Enter City" ValidationGroup="g2" Width="53px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Country:</td>
                            <td align="left">
                                <asp:DropDownList ID="ddlCountry" runat="server" Width="157px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="ddlCountry"
                                    ErrorMessage="Require" Font-Bold="True" InitialValue="Choose One..."
                                    ToolTip="Enter City" ValidationGroup="g2" Width="53px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Zip or Postal Code:</td>
                            <td align="left">
                                <asp:TextBox ID="txtPinCode" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtPinCode"
                                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Postal Code"
                                    ValidationGroup="g2" Width="25px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Phone Number.:</td>
                            <td align="left" style="width: 340px">
                                <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="g2" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtPhone"
                                    ErrorMessage="Require" Font-Bold="True" ToolTip="Enter Phone"
                                    ValidationGroup="g2" Width="25px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Mobile:</td>
                            <td align="left" style="width: 340px">
                                <asp:TextBox ID="txtMobile" runat="server" Width="168px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Email Address:</td>
                            <td align="left" style="width: 340px">
                                <asp:TextBox ID="txtMail" runat="server" Width="201px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Birthday:</td>
                            <td align="left" style="width: 340px; height: 24px">
                                <cc2:GMDatePicker ID="GMDatePicker2" runat="server" AutoPosition="True" CalendarOffsetX="-200px"
                                    CalendarOffsetY="25px" CalendarTheme="None" CalendarWidth="200px" CallbackEventReference=""
                                    Culture="English (United States)" EnableDropShadow="True" MaxDate="9999-12-31"
                                    MinDate="" NextMonthText=">" NoneButtonText="None" ShowNoneButton="True" ShowTodayButton="True"
                                    TextBoxWidth="100" ZIndex="1">
                                </cc2:GMDatePicker>
                                &nbsp; &nbsp; &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="font-weight: bold">
                                <asp:Button ID="btnUpdatePersonal" runat="server" Text="Update Contact" ValidationGroup="g2"
                                    OnClick="btnUpdatePersonal_Click" />
                                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="Panel4" runat="server" Width="100%">
                <strong>Official Contact</strong>
                    <asp:GridView ID="GridView4" runat="server" Width="100%" AutoGenerateColumns="False"
                        AllowPaging="True" PageSize="5" OnPageIndexChanging="GridView4_PageIndexChanging"
                        OnRowDeleting="GridView4_RowDeleting" OnRowUpdating="GridView4_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="Company Name">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl1" runat="server" Text='<%#Eval("CompanyName") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl2" runat="server" Text='<%#Eval("FirstName") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl3" runat="server" Text='<%#Eval("Phone") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Website">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl4" runat="server" Text='<%#Eval("Website") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete ?">
                                <ItemTemplate>
                                    <asp:Button ID="btndelete1" Text="Delete ?" OnClientClick="return confirm('Are U Sure ?')"
                                        CommandName="Delete" CommandArgument='<%#Eval("Id") %>' runat="server"  CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Update !">
                                <ItemTemplate>
                                    <asp:Button ID="btnupdate1" Text="Update ?" CommandName="Update" CommandArgument='<%#Eval("Id") %>'
                                        runat="server"  CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#0072B8" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="Panel6" runat="server" Width="100%">
                    <table align="center" bgcolor="#0072b8" border="1" cellpadding="0" cellspacing="0"
                        style="width: 100%">
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Label ID="lblMsg1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Yellow"
                                    Width="455px"></asp:Label>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="left" colspan="2" style="font-weight: bold; font-size: 12pt; background-color: darkgray; color: white;">
                                Update Official Contact</td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Company Name:</td>
                            <td align="left">
                                <asp:TextBox ID="txtCompanyName" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCompanyName"
                                    ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Organization Name"
                                    ValidationGroup="g1" Width="55px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                First Name:</td>
                            <td align="left">
                                <asp:TextBox ID="txtFName1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtFName1"
                                    ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter First Name"
                                    ValidationGroup="g1" Width="55px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Last Name:</td>
                            <td align="left">
                                <asp:TextBox ID="txtLName1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtLName1"
                                    ErrorMessage="Rrequire" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Last Name"
                                    ValidationGroup="g1" Width="55px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Address:</td>
                            <td align="left">
                                <asp:TextBox ID="txtAddress1" runat="server" TextMode="MultiLine" ValidationGroup="g1"
                                    Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtAddress1"
                                    ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Address"
                                    ValidationGroup="g1" Width="53px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                City</td>
                            <td align="left">
                                <asp:TextBox ID="txtCity1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtCity1"
                                    ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter City"
                                    ValidationGroup="g1" Width="53px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                State:</td>
                            <td align="left">
                                <asp:DropDownList ID="ddlState1" runat="server" Width="157px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlState1"
                                    ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" InitialValue="Choose One..."
                                    ToolTip="Enter City" ValidationGroup="g1" Width="53px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Country:</td>
                            <td align="left">
                                <asp:DropDownList ID="ddlCountry1" runat="server" Width="157px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlCountry1"
                                    ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" InitialValue="Choose One..."
                                    ToolTip="Enter City" ValidationGroup="g1" Width="53px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Zip or Postal Code:</td>
                            <td align="left">
                                <asp:TextBox ID="txtPinCode1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtPinCode1"
                                    ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Postal Code"
                                    ValidationGroup="g1" Width="25px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Phone Number.:</td>
                            <td align="left" style="width: 340px">
                                <asp:TextBox ID="txtPhone1" runat="server" ValidationGroup="g1" Width="168px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtPhone1"
                                    ErrorMessage="Require" Font-Bold="True" ForeColor="Gold" ToolTip="Enter Phone"
                                    ValidationGroup="g1" Width="25px"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Mobile:</td>
                            <td align="left" style="width: 340px">
                                <asp:TextBox ID="txtMobile1" runat="server" Width="168px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Fax No.:</td>
                            <td align="left" style="width: 340px">
                                <asp:TextBox ID="txtFaxNo" runat="server" Width="168px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Email Address:</td>
                            <td align="left" style="width: 340px">
                                <asp:TextBox ID="txtMail1" runat="server" Width="201px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; font-size: 10pt; color: white;">
                                Website:</td>
                            <td align="left" style="width: 340px; height: 24px">
                                <asp:TextBox ID="txtWebsite" runat="server" Width="201px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="font-weight: bold">
                                <asp:Button ID="btnUpdateOfficial" runat="server" Text="Update Contact" ValidationGroup="g1"
                                    OnClick="btnUpdateOfficial_Click" />
                                <asp:Button ID="btnBack1" runat="server" Text="Back" OnClick="btnBack1_Click" CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
