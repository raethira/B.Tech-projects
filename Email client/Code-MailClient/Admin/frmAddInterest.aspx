<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true"
    CodeFile="frmAddInterest.aspx.cs" Inherits="Admin_frmAddInterest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
        <tr>
            <td colspan="2" style="font-weight: bold; font-size: 12pt;" align="center">
                Add Interest</td>
        </tr>
        <tr>
            <td align="left" width="15%" style="font-weight: bold">
                Interest:</td>
            <td align="left">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Please Enter Interest" Font-Bold="True" Font-Size="10pt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" Width="51px" />
                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="CLear" CausesValidation="False" /></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red" Width="260px"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="60%"
                    AllowPaging="True" EmptyDataText="No Data Found" OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="Intrest">
                            <ItemTemplate>
                                <asp:Literal ID="ltl1" Text='<%#Eval("Interest") %>' runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="btndelete" CommandName="Delete" CommandArgument='<%#Eval("Id") %>'
                                    Text="Delete ?" runat="server" OnClientClick="return confirm('Are U Sure ?')"  CausesValidation="false"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:Button ID="btnupdate" CommandName="Update" CommandArgument='<%#Eval("Id") %>'
                                    Text="Update !" runat="server" CausesValidation="false"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataRowStyle Font-Bold="True" Font-Size="14pt" ForeColor="Red" />
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
    </table>
</asp:Content>
