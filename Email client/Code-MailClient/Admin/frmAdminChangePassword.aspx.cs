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

public partial class Admin_frmAdminChangePassword : System.Web.UI.Page
{
    AdminBL admin = new AdminBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/frmAdminLogin.aspx");
        }

    }
   protected void btnChange_Click(object sender, EventArgs e)
    {
        try
        {
            admin.LoginName = txtUserName.Text.Trim();
            admin.Password = txtPassword.Text.Trim();
            if (admin.CheckAdminValidity() == false)
            {
                lblMsg.Text = "Check Either Your Username or Password...";
            }
            else
            {
                admin.Password = txtNew.Text.Trim();
                admin.ChengeAdminPassword();
                lblMsg.Text = "Changed..";
            }
        }
        catch (Exception)
        {

            throw;
        }

    }
}
