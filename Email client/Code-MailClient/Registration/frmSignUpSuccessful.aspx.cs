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

public partial class Registration_frmSignUpSuccessful : System.Web.UI.Page
{
    UserRegistrationBL registeration = new UserRegistrationBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           lblUserName.Text = Session["UserName"].ToString()+"@SPICEMAIL.COM";
        }

    }
   
    protected void btnSignUp_Click(object sender, EventArgs e)
    {

        try
        {
            txtUserName.Text = Session["UserName"].ToString();
            registeration.LoginName = txtUserName.Text.Trim();
            registeration.Password = txtPassword.Text.Trim();
            if (registeration.CheckUserValidity() == true)
            {
                Session["UserName"] = registeration.LoginName;
                Response.Redirect("~/Registration/frmUserHomePage.aspx");


            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message;
            lblMsg.Visible = true;
        }
      
    }
    protected void lnkForgotPassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmPasswordForgot.aspx");
    }
}
