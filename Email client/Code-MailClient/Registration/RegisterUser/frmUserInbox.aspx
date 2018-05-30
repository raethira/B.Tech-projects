<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmUserInbox.aspx.cs" Inherits="Registration_RegisterUser_frmUserInbox" %>

<%@ Register Src="../../User Control/InboxUserUserControl.ascx" TagName="InboxUserUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="1" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="left" style="background-color: #f0f0e8" valign="top" colspan="2">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgReply" runat="server" ImageUrl="~/images/Reply.jpg" OnClick="ImgReply_Click" /></td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgForward" runat="server" ImageUrl="~/images/Forward.jpg" OnClick="ImgForward_Click" /></td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgDelete" runat="server" ImageUrl="~/images/Delete.jpg" OnClick="ImgDelete_Click" /></td>
                        <td style="width: 100px">
                        <a href="#" onclick="window.print();">
                        <img src="../../images/Print.jpg" alt="" border="0" />
                        </a>
                        
                            </td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="imgSave" runat="server" OnClick="imgSave_Click" Height="29px"
                                ImageUrl="~/images/SaveItem.bmp" ToolTip="Save " /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" colspan="2">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Font-Bold="True"
                    ForeColor="Black" Text="Select All" Width="113px" OnCheckedChanged="CheckBox1_CheckedChanged" />
                <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Red"
                    Visible="False" Width="299px"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" valign="top" width="90%">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td colspan="6">
                            <asp:GridView ID="GridView1" runat="server" Width="100%" EmptyDataText="Your Inbox Is Empty"
                                AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True"
                                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="50" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                                <EmptyDataRowStyle Font-Bold="True" Font-Size="Large" ForeColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("Id") %>' Visible="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chk1" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl1" Text='<%#Eval("From") %>' runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk1" Text='<%#Eval("Subject") %>' CommandName="View" CommandArgument='<%#Eval("Id") %>'
                                                runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl3" Text='<%#Eval("Date") %>' runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Size">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl4" Text='<%#Eval("Size") %>' runat="server"></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <FooterStyle BackColor="#CCCC99" />
                                <RowStyle BackColor="#F7F7DE" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
            <td align="right" rowspan="1" valign="top" width="30">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/SideBar.jpg" /></td>
        </tr>
    </table>
</asp:Content>
