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

public partial class Registration_frmChangePassword : System.Web.UI.Page
{
    UserRegistrationBL registration = new UserRegistrationBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }

    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        try
        {
            registration.LoginName = txtName.Text.Trim();
            registration.Password = txtPassword.Text.Trim();
            if (registration.CheckUserValidity() == true)
            {
                if(txtNewPwd.Text.Trim().Length<6)
                {
                lblMsg.Text = "Password Should Have 6 Characters...!";
                return;
                }
            else
                registration.Password = txtNewPwd.Text.Trim();
                registration.UpdatePassword();
                lblMsg.Text = "Your Password Has Changed...!";
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                lblMsg.Text = "Either Your LoginName or Password is Wrong...!";
            }
        }
        catch (Exception)
        {
            
            throw;
        }
    }
}
