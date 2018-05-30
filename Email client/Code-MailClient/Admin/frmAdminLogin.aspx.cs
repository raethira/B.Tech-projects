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

public partial class Admin_frmAdminLogin : System.Web.UI.Page
{
    AdminBL admin = new AdminBL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            admin.LoginName = txtUserName.Text.Trim();
            admin.Password = txtPassword.Text.Trim();
            if (admin.CheckAdminValidity() == true)
            {
                Session["UserName"] = admin.LoginName;
                Response.Redirect("~/Admin/frmAdminHome.aspx");
            }
            else
            {
                lblMsg.Text = "Invalid Username or Password...!";
                lblMsg.Visible = true;
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
}
