<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmViewUserAppointments.aspx.cs" Inherits="Registration_RegisterUser_frmViewUserAppointments"
    %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="right" colspan="5" style="font-weight: bold; color: #ffffff">
                   <asp:Button ID="btnBack" runat="server" Text="Back<<" Width="79px" OnClick="btnBack_Click" CausesValidation="False" /></td>
        </tr>
        <tr>
            <td colspan="5" style="font-weight: bold; color: black">
                Please Select Date To See Appointment
            </td>
        </tr>
        <tr>
            <td colspan="5" style="font-weight: bold; color: #ffcc00" align="center">
                <asp:Calendar ID="Calendar1" runat="server" Height="242px" Width="531px" OnDayRender="Calendar1_DayRender"
                    OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399">
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                        Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="font-weight: bold; color: #ffcc00">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                    Width="100%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <Columns>
                        <asp:TemplateField HeaderText="View Appointment">
                            <ItemTemplate>
                                <asp:LinkButton ID="LnkView" Text="View" CommandArgument='<%#Eval("Id") %>' CommandName="View"
                                    runat="server"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Of Appointment">
                            <ItemTemplate>
                                <asp:Literal ID="LtlDate" Text='<%#Eval("DateOfAppointment","{0:dd-MMM-yyyy}") %>'
                                    runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Time Of Appointment">
                            <ItemTemplate>
                                <asp:Literal ID="LtlTime" Text='<%#Eval("AppointmentTime") %>' runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Panel ID="Panel1" runat="server" Width="100%">
                    <div style="text-align: center">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="2" style="font-weight: bold; color: black">
                                    &nbsp;Update Your Appointment</td>
                                <td colspan="1" style="font-weight: bold; color: #ffffff">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:TextBox ID="txtAppointment" runat="server" Height="97px" TextMode="MultiLine"
                                        ValidationGroup="g1" Width="500px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAppointment"
                                        ErrorMessage="*" Font-Bold="True" SetFocusOnError="True"
                                        ToolTip="Enter Appointment" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                    &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2" style="font-weight: bold; color: black">
                                    Appointment Time:</td>
                                <td align="left" colspan="1">
                                    <asp:DropDownList ID="ddlTime1" runat="server" Width="83px" ValidationGroup="g1">
                                    </asp:DropDownList><asp:DropDownList ID="ddlTime2" runat="server">
                                        <asp:ListItem>AM</asp:ListItem>
                                        <asp:ListItem>PM</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTime1"
                                        ErrorMessage="Choose Time" Font-Bold="True" ForeColor="Maroon" InitialValue="Choose Time.."
                                        ValidationGroup="g1"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="#004000"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" ValidationGroup="g1" Width="73px"
                                        OnClick="btnUpdate_Click" />&nbsp;
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="73px" OnClick="btnDelete_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="67px" OnClick="btnCancel_Click" CausesValidation="False" /></td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
