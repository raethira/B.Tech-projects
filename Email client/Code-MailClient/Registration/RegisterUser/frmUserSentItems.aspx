<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUser/MasterPage.master" AutoEventWireup="true" CodeFile="frmUserSentItems.aspx.cs" Inherits="Registration_RegisterUser_frmUserSentItems" %>

<%@ Register Src="../../User Control/InboxUserUserControl.ascx" TagName="InboxUserUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="left" border="1" bordercolor="#f0f0e8" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="left" style="background-color: #f0f0e8" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 255px">
                    <tr>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgReply" runat="server" ImageUrl="~/images/Reply.jpg" OnClick="ImgReply_Click" /></td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgForward" runat="server" ImageUrl="~/images/Forward.jpg" OnClick="ImgForward_Click" /></td>
                        <td style="width: 100px">
                            <asp:ImageButton ID="ImgDelete" runat="server" ImageUrl="~/images/Delete.jpg" OnClick="ImgDelete_Click" /></td>
                        <td style="width: 100px">
                        <a href="#" onclick="window.print();">
                        <img src="../../images/print.jpg"= alt="" border="0" />
                        </a>
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red" Width="312px"></asp:Label>&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold; font-size: 14pt; color: #ffcc66" valign="top"
                width="50%">
                <img src="../../images/Sent.png" style="width: 27px" />
                &nbsp;Sent Mail&nbsp; Folder</td>
        </tr>
        <tr>
            <td align="left" valign="top" >
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Font-Bold="True"
                    ForeColor="Black" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Select All"
                    Width="113px" /></td>
        </tr>
        <tr>
            <td align="left" valign="top" >
                             <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td colspan="6">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="This Folder Is Empty"
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
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#E3EAEB" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
       
    </table>
</asp:Content>

