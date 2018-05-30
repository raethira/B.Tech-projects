<%@ Page Language="C#" MasterPageFile="~/Registration/RegisterUserMasterPage.master"  AutoEventWireup="true" CodeFile="frmUserAddressBook.aspx.cs" Inherits="Registration_RegisterUser_frmSeeContactBook"  %>

<%@ Register Src="../User Control/AddressBookUserControl.ascx" TagName="AddressBookUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="panel1" runat="server" ScrollBars="Horizontal" Width="100%">
        <table border="0" cellpadding="2" cellspacing="1" width="100%">
            <tr>
                <td colspan="3" style="font-weight: bold; font-size: 12pt; color: Maroon; background-color: #d5d7c9">
                    Address Book</td>
            </tr>
            <tr>
                <td style="font-weight: bold; color: Black;" align="right">
                    In:</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddlContactType" runat="server" Width="170px">
                        <asp:ListItem>Choose One...</asp:ListItem>
                        <asp:ListItem>Personal Address Book</asp:ListItem>
                        <asp:ListItem>Official Address Book</asp:ListItem>
                    </asp:DropDownList></td>
                
            </tr>
            <tr>
                <td style="font-weight: bold; color: Black;" align="right">
                    Find Contacts Whose:</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddlNameType" runat="server" Width="170px">
                        <asp:ListItem>Choose One...</asp:ListItem>
                        <asp:ListItem>First Name</asp:ListItem>
                        <asp:ListItem>Last Name</asp:ListItem>
                        <asp:ListItem>Company Name</asp:ListItem>
                    </asp:DropDownList></td>
                
            </tr>
            <tr>
                <td align="right" style="font-weight: bold; color: black">
                    Contains:</td>
                <td colspan="2">
                    <asp:TextBox ID="txtName" runat="server" Width="162px"></asp:TextBox></td>
               
            </tr>
            <tr>
                <td align="right" style="font-weight: bold; color: black">
                </td>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Find" OnClick="Button1_Click" Width="72px" /></td>
            </tr>
            <tr>
                <td align="right" style="font-weight: bold; color: black">
                </td>
                <td colspan="2">
                    <b>OR</b></td>
            </tr>
            <tr>
                <td align="right" style="font-weight: bold; color: black">
                    In:</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddlContactType1" runat="server" Width="170px">
                        <asp:ListItem>Choose One...</asp:ListItem>
                        <asp:ListItem>Personal Address Book</asp:ListItem>
                        <asp:ListItem>Official Address Book</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" style="font-weight: bold; color: Black">
                    Browse Conatct By:</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddlBrowseContact" runat="server" Width="170px" >
                        <asp:ListItem>Choose One...</asp:ListItem>
                        <asp:ListItem>First Name</asp:ListItem>
                        <asp:ListItem>Last Name</asp:ListItem>
                        <asp:ListItem>Company Name</asp:ListItem>
                    </asp:DropDownList></td>
                
            </tr>
            <tr>
                <td align="right" style="font-weight: bold; color: black">
                </td>
                <td colspan="2">
                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="27" ForeColor="Black" OnItemCommand="DataList1_ItemCommand" Font-Bold="True" Font-Size="X-Small" Width="100%">
                       <ItemTemplate>
                       <asp:LinkButton id="lnkBtnLetter" runat="server" Text='<%#Eval("Letter") %>' CommandArgument='<%#Eval("Letter") %>' CommandName="Letter"></asp:LinkButton>
                       </ItemTemplate>
                                              
                        <ItemStyle Font-Bold="True" ForeColor="Black" />
                        <SelectedItemStyle ForeColor="Black" />
                        <HeaderStyle ForeColor="Black" />
                    </asp:DataList></td>
                
            </tr>
            <tr>
                <td colspan="3" style="font-weight: bold; color: Black">
                 
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="font-weight: bold; color: Black" valign="baseline">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 48%">
                        <tr>
                            <td>
                                <asp:Button ID="btnMail" runat="server" OnClick="btnMail_Click" Text="Mail" Width="71px" /></td>
                            <td>
                                </td>
                            <td style="width: 100px">
                                <asp:Button ID="btnNewContact" runat="server" Text="New Contact" OnClick="btnNewContact_Click" /></td>
                            <td>
                            </td>
                            <td></td>
                            <td>
                                <asp:Button ID="btnShowConatct" runat="server" Text="Show Contact" OnClick="btnShowConatct_Click" /></td>
                        </tr>
                    </table>
                    </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="font-weight: bold; color: #ffffff">
                    <asp:GridView ID="GridView1" runat="server" Width="100%" EmptyDataText="No Contact Detail Found" ForeColor="#333333" PageSize="100" OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" AllowPaging="True" CellPadding="4" GridLines="None">
                        <EmptyDataRowStyle Font-Bold="True" Font-Size="12pt" ForeColor="Red" />
                        <EditRowStyle Font-Size="12pt" BackColor="#999999" />
                      <Columns>
                      <asp:TemplateField HeaderText="Select">
                      <ItemTemplate>
                      <asp:CheckBox ID="chk1" runat="server" />
                      </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="First Name">
                       <ItemTemplate>
                      <asp:Literal ID="ltl1" Text='<%#Eval("FirstName") %>' runat="server" />
                      </ItemTemplate>
                      </asp:TemplateField>
                      
                       <asp:TemplateField HeaderText="Last Name">
                       <ItemTemplate>
                      <asp:Literal ID="ltl2" Text='<%#Eval("LastName") %>' runat="server" />
                      </ItemTemplate>
                      </asp:TemplateField>
                      
                       <asp:TemplateField HeaderText="Email">
                       <ItemTemplate>
                      <asp:HyperLink ID="hyp1" Text='<%#Eval("Email") %>' runat="server" NavigateUrl="~/Registration/RegisterUser/frmComposeMail.aspx" />
                      </ItemTemplate>
                      </asp:TemplateField>
                      </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="font-weight: bold; color: #ffffff">
                    &nbsp; &nbsp;
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="font-weight: bold; color: #ffffff; height: 25px;">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Maroon" Width="100%"></asp:Label></td>
            </tr>
        </table>
</asp:Panel>
</asp:Content>

