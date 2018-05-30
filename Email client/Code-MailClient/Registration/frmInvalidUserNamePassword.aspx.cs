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

public partial class Registration_frmInvalidUserNamePassword : System.Web.UI.Page
{
    UserRegistrationBL registeration = new UserRegistrationBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            registeration.LoginName = txtLoginName.Text.Trim();
            registeration.Password = txtPassword.Text.Trim();
            if (registeration.CheckUserValidity() == true)
            {
                Session["UserName"] = registeration.LoginName;
                registeration.LoginName = txtLoginName.Text.Trim();
                registeration.LoginDate = System.DateTime.Now.Date;
                registeration.LoginTime = System.DateTime.Now.ToShortTimeString();
                registeration.InsertUserLoginHistory();
                Response.Redirect("~/Registration/frmUserHomePage.aspx");


            }
            else
            {
                lblMsg.Text = "Try Again...!";
                txtLoginName.Focus();

            }
        }
        catch (Exception)
        {

            throw;
        }

    }


    protected void lnkNewUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmUserRegistration.aspx");
    }
    protected void lnkHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    protected void lnkPasswordForgot_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmPasswordForgot.aspx");
    }
}
