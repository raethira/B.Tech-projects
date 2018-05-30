<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true" CodeFile="frmViewUserByRegisterationDate.aspx.cs" Inherits="Admin_frmViewUserByRegisterationDate" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; font-size: 13pt;">
                View All User By Date</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;<asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red" Width="388px"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; color: black">
                From &nbsp;<cc1:gmdatepicker id="GMDatePicker1" runat="server" CalendarTheme="Green" InitialValueMode="Null" NoneButtonText="Clear"></cc1:gmdatepicker>
                &nbsp; &nbsp; &nbsp; &nbsp;To&nbsp;
                <cc1:gmdatepicker id="GMDatePicker2" runat="server" CalendarTheme="Green" InitialValueMode="Null"></cc1:gmdatepicker>
            <asp:Button ID="btnView" runat="server" Text="View" Width="76px" OnClick="btnView_Click" /></td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; color: #ffffff; height: 19px">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; color: #ffffff; height: 19px">
                <asp:Panel ID="Panel2" runat="server" Height="50px" Width="125px">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 100px">
                <asp:Button ID="btnExportToExcel" runat="server" OnClick="btnExportToExcel_Click"
                    Text="Export To Excel" ValidationGroup="g1" /></td>
                            <td style="width: 100px">
                                <asp:Button ID="btnExportToPDF" runat="server" OnClick="btnExportToPDF_Click" Text="Export To PDF"
                    ValidationGroup="g1" /></td>
                            <td style="width: 100px">
                <input id="Submit1" type="submit" value="Print" onclick="window.print()"/></td>
                        </tr>
                    </table>
                </asp:Panel>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; color: #ffffff; height: 19px">
                &nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    EmptyDataText="No Data Found" PageSize="5"
                    Width="618px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="14pt" ForeColor="Red" />
                    <Columns>
                        <asp:TemplateField HeaderText="Login Id">
                            <ItemTemplate>
                               <%#Eval("LoginId") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Literal ID="ltl2" runat="server" Text='<%#Eval("FirstName") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <asp:Literal ID="ltl3" runat="server" Text='<%#Eval("Gender") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Literal ID="ltl4" runat="server" Text='<%#Eval("Address") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:Literal ID="ltl5" runat="server" Text='<%#Eval("City") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="State">
                            <ItemTemplate>
                                <asp:Literal ID="ltl6" runat="server" Text='<%#Eval("State") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <asp:Literal ID="ltl7" runat="server" Text='<%#Eval("Country") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <EditRowStyle BackColor="#999999" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <strong><span style="color: black">Enter CPF Number For More Info</span></strong>.<asp:TextBox
                    ID="txtSearch" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
                    <table align="center" border="0" cellpadding="3" cellspacing="2" style="width: 80%; border-right: green 1px double; border-top: green 1px double; border-left: green 1px double; border-bottom: green 1px double;">
                        <tr>
                            <td align="center" colspan="2">
                                &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" colspan="2" style="font-weight: bold; background-color: darkgray">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; width: 216px">
                                First Name:</td>
                            <td align="left">
                                <asp:Label ID="lblFName" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; width: 216px">
                                Last Name:</td>
                            <td align="left">
                                <asp:Label ID="lblLName" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; width: 216px">
                                Address:</td>
                            <td align="left">
                                <asp:Label ID="lblAddress" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; width: 216px">
                            </td>
                            <td align="left" style="width: 340px">
                            </td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; width: 216px; height: 5px">
                                City</td>
                            <td align="left">
                                <asp:Label ID="lblCity" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr style="font-size: 12pt; font-family: Times New Roman">
                            <td align="right" style="font-weight: bold; width: 216px">
                                State:</td>
                            <td align="left">
                                <asp:Label ID="lblState" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px; height: 26px">
                                Zip or Postal Code:</td>
                            <td align="left">
                                <asp:Label ID="lblPinCode" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Country:</td>
                            <td align="left">
                                <asp:Label ID="lblCountry" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Email Address:</td>
                            <td align="left" style="width: 340px">
                                <asp:Label ID="lblMail" runat="server" Font-Bold="True" Width="286px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Phone Number.:</td>
                            <td align="left" style="width: 340px">
                                <asp:Label ID="lblPhone" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="font-weight: bold; background-color: darkgray">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px; height: 24px">
                                Birthday:</td>
                            <td align="left" style="width: 340px; height: 24px">
                                <asp:Label ID="lblDOB" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Gender:</td>
                            <td align="left" style="width: 340px">
                                <asp:Label ID="lblGender" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Primary Language:</td>
                            <td align="left" style="width: 340px">
                                <asp:Label ID="lblLanguage" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Household Income:</td>
                            <td align="left" style="width: 340px">
                                <asp:Label ID="lblIncome" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Occupation:</td>
                            <td align="left" style="width: 340px">
                                <asp:Label ID="lblOccupation" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Industry:</td>
                            <td align="left" style="width: 340px">
                                <asp:Label ID="lblIndustry" runat="server" Font-Bold="True" Width="190px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                            </td>
                            <td style="width: 340px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="font-weight: bold; width: 216px">
                                Intrests:</td>
                            <td align="left" style="width: 340px">
                                <asp:CheckBoxList ID="chklistInrest" runat="server" Enabled="False" Height="139px"
                                    RepeatColumns="3" RepeatDirection="Horizontal" Width="455px">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="font-weight: bold">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    &nbsp;
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

