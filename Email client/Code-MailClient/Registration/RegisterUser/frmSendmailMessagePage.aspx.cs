using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Registration_RegisterUser_frmSendmailMessagePage : System.Web.UI.Page
{
    UserAddressBookBL address =new UserAddressBookBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            lblName.Text = Session["To"].ToString();
            Panel1.Visible = false;
        }
    }
    protected void imgAddContact_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            address.LoginName = Session["UserName"].ToString();
            address.FirstName = txtFName.Text.Trim();
            address.LastName = txtLName.Text.Trim();
            address.CompanyName = txtCompanyName.Text.Trim();
           
            address.InsertInitialAddressbookDetail();
            address.InsertInitialOfficialAddressbookDetail();
            lblMsg.Text = "The Recepient has added to your address book...";
            Panel1.Visible = false;
        }
        catch (Exception)
        {
            
            throw;
        }
    }
    protected void ImgReturnToInbox_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmUserInbox.aspx");
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
            Panel1.Visible = true;
        else
            Panel1.Visible = false;
    }
}
