<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master"
    AutoEventWireup="true" CodeFile="frmUserDraftItems.aspx.cs" Inherits="Registration_RegisterUser_frmUserDraftItems"
   %>

<%@ Register Src="../../User Control/InboxUserUserControl.ascx" TagName="InboxUserUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="left" border="1" bordercolor="#f0f0e8" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="left" style="background-color: #f0f0e8" valign="top" >
                <table border="0" cellpadding="0" cellspacing="0" style="width: 155px">
                    <tr>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgSend" runat="server" ImageUrl="~/images/SendMail.jpg" OnClick="ImgSend_Click" /></td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgDelete" runat="server" ImageUrl="~/images/Delete.jpg" OnClick="ImgDelete_Click" /></td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgPrint" runat="server" ImageUrl="~/images/Print.jpg" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold; font-size: 14pt; color: #ffcc66" valign="middle"
                width="50%">
                <img src="../../images/Drafts.png" style="width: 36px" />
                &nbsp;Draft &nbsp;Mail&nbsp; Folder</td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold; font-size: 12pt; color: #ffcc66" valign="top"
              >
                &nbsp;<asp:Label ID="lblMsg" runat="server" ForeColor="Red" Width="325px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left" valign="top" >
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Font-Bold="True"
                    ForeColor="White" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Select All"
                    Width="113px" /></td>
        </tr>
        <tr>
            <td align="left" valign="top"  >
                &nbsp;
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td colspan="6">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="Your Folder Is Empty"
                                Width="100%">
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
                                    <asp:TemplateField HeaderText="To">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl1" runat="server" Text='<%#Eval("To") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:Literal ID="ltl2" runat="server" Text='<%#Eval("Subject") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk1" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="View"
                                                Text='<%#Eval("Subject") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
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
                                <HeaderStyle BackColor="#F0F0E8" Font-Bold="True" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="1" valign="top">
            </td>
        </tr>
    </table>
</asp:Content>
