<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmUserCalendarHome.aspx.cs" Inherits="Registration_RegisterUser_frmUserCalendarHome"
    %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: left">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td align="center" valign="top">
                    <cc1:GMDatePicker ID="GMDatePicker1" runat="server" BackColor="#0072B8" CalendarTheme="Silver"
                        EnableDropShadow="False" Font-Bold="True" ForeColor="White" ImageUrl="../../images/CalendarView.jpg"
                        InitialText="View Date">
                    </cc1:GMDatePicker>
                </td>
                <td align="center" style="width: 76px" valign="top">
                    <asp:LinkButton ID="lnkViewDay" runat="server" Font-Bold="True" ForeColor="Maroon"
                        OnClick="lnkViewDay_Click" Width="80px">View Day</asp:LinkButton></td>
                <td align="center" valign="top">
                    <asp:LinkButton ID="lnkViewWeek" runat="server" Font-Bold="True" ForeColor="Maroon"
                        Width="80px" OnClick="lnkViewWeek_Click">View Week</asp:LinkButton></td>
                <td align="center" valign="top">
                    <asp:LinkButton ID="lnkViewMonth" runat="server" Font-Bold="True" ForeColor="Maroon"
                        OnClick="lnkViewMonth_Click" Width="83px">View Month</asp:LinkButton></td>
                <td align="center" valign="top">
                    <asp:Menu ID="Menu1" runat="server" Font-Bold="True" ForeColor="Maroon" Orientation="Horizontal"
                        Width="95px">
                        <Items>
                            <asp:MenuItem Text="Action" Value="Action">
                                <asp:MenuItem NavigateUrl="~/Registration/RegisterUser/frmCalendar.aspx" Text="New "
                                    Value="New "></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Registration/RegisterUser/frmViewUserAppointments.aspx"
                                    Text="Edit" Value="Edit"></asp:MenuItem>
                            </asp:MenuItem>
                        </Items>
                        <DynamicMenuItemStyle BackColor="DodgerBlue" Font-Bold="True" ForeColor="White" />
                    </asp:Menu>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="5">
                    <asp:Calendar ID="Calendar1" runat="server" Height="292px" Width="550px" NextPrevFormat="ShortMonth">
                        <NextPrevStyle Font-Bold="True" Font-Size="Medium" ForeColor="SlateBlue" />
                    </asp:Calendar>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
