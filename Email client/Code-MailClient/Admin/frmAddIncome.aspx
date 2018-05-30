<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true" CodeFile="frmAddIncome.aspx.cs" Inherits="Admin_frmAddIncome"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <table align="center" border="0" cellpadding="2" cellspacing="2" width="100%">
        <tr>
            <td align="center" colspan="2" style="font-weight: bold; font-size: 12pt">
                Add Income</td>
        </tr>
        <tr>
            <td align="left" width="15%" style="font-weight: bold">
                Income Type:</td>
            <td align="left" >
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Please Enter Income" Font-Bold="True" Font-Size="10pt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" Width="50px" />
                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" Width="54px" /></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    EmptyDataText="No Data Found" OnPageIndexChanging="GridView1_PageIndexChanging"
                    OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" PageSize="25"
                    Width="60%" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="Income Type">
                            <ItemTemplate>
                                <asp:Literal ID="ltl1" runat="server" Text='<%#Eval("Income") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="btndelete" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="Delete"
                                    OnClientClick="return confirm('Are U Sure ?')" Text="Delete ?"  CausesValidation="false"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:Button ID="btnupdate" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="Update"
                                    Text="Update !"  CausesValidation="false"/>
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

