<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true" CodeFile="frmAddCountry.aspx.cs" Inherits="Admin_frmAddCountry"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table border="0" cellpadding="2" cellspacing="2" width="100%">
            <tr>
                <td colspan="2" style="font-weight: bold; font-size: 12pt;">
                    Add Country</td>
            </tr>
            <tr>
                <td align="left" width="20%" style="font-weight: bold">
                    Country Name:</td>
                <td align="left">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Please Enter Country" Font-Bold="True" Font-Size="10pt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="left" style="font-weight: bold;">
                    Description:</td>
                <td align="left">
                    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription"
                        ErrorMessage="Please Enter Description" Font-Bold="True" Font-Size="10pt"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" Width="50px" />
                    <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" Width="61px" CausesValidation="False" /></td>
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
                        Width="70%" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Country Name">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl1" runat="server" Text='<%#Eval("CountryName") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Literal ID="ltl2" runat="server" Text='<%#Eval("description") %>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:Button ID="btndelete" runat="server" CommandArgument='<%#Eval("CountryId") %>' CommandName="Delete"
                                        OnClientClick="return confirm('Are U Sure ?')" Text="Delete ?"  CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Update">
                                <ItemTemplate>
                                    <asp:Button ID="btnupdate" runat="server" CommandArgument='<%#Eval("CountryId") %>' CommandName="Update"
                                        Text="Update !" CausesValidation="false"/>
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
    </div>
</asp:Content>

