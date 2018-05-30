<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMenuMasterPage.master" AutoEventWireup="true" CodeFile="frmViewUserFeedback.aspx.cs" Inherits="Admin_frmViewUserFeedback" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align: center">
        <table border="0" cellpadding="0" cellspacing="0" align="center" width="90%">
            <tr>
                <td colspan="2" style="font-weight: bold; font-size: 13pt; color: #006600">
                    &nbsp; &nbsp; View User Feedback</td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblView" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp; &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left">
                    <asp:CheckBox ID="CheckBox1" runat="server" Font-Bold="True" ForeColor="Black" OnCheckedChanged="CheckBox1_CheckedChanged"
                        Text="Select All" Width="90px" AutoPostBack="True" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="55px" OnClick="btnDelete_Click" /></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" PageSize="100" OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" >
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
                    <asp:LinkButton ID="lnk1" Text='<%#Eval("Subject") %>' CommandName="View" CommandArgument='<%#Eval("Id") %>'  runat="server"></asp:LinkButton>
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
                    
                     <asp:TemplateField HeaderText="Send Mail">
                    <ItemTemplate>
                    <asp:Button ID="btnsend" Text="Send Mail" CommandArgument='<%#Eval("From") %>' CommandName="Send" runat="server" />
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
        </table>
    </div>
</asp:Content>

