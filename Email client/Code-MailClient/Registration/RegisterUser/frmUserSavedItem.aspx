<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmUserSavedItem.aspx.cs" Inherits="Registration_RegisterUser_frmUserSpam"
   %>

<%@ Register Src="../../User Control/InboxUserUserControl.ascx" TagName="InboxUserUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="left" border="1" bordercolor="#f0f0e8" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" style="background-color: #f0f0e8" valign="top" >
                <table border="0" cellpadding="0" cellspacing="0" style="width: 155px">
                    <tr>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgForward" runat="server" ImageUrl="~/images/Forward.jpg" OnClick="ImgForward_Click" /></td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgDelete" runat="server" ImageUrl="~/images/Delete.jpg" OnClick="ImgDelete_Click" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red" Width="265px"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" valign="top" >
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Font-Bold="True"
                    ForeColor="White" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Select All"
                    Width="113px" /></td>
        </tr>
        <tr>
            <td align="left" valign="top" >
                &nbsp;
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td colspan="6">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="Your Inbox Is Empty"
                                OnRowCommand="GridView1_RowCommand" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <EmptyDataRowStyle Font-Bold="True" Font-Size="Large" ForeColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("Id") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chk1" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl1" runat="server" Text='<%#Eval("From") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk1" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="View"
                                                Text='<%#Eval("Subject") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl3" runat="server" Text='<%#Eval("Date") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Size">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl4" runat="server" Text='<%#Eval("Size") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <EditRowStyle BackColor="#999999" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                
            </td>
           
        </tr>
       
    </table>
</asp:Content>
