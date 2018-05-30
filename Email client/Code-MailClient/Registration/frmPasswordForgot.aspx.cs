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

public partial class Registration_frmPasswordForgot : System.Web.UI.Page
{
    UserRegistrationBL registration = new UserRegistrationBL();
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }
    protected void lnkNewUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmUserRegistration.aspx");
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        try
        {
            registration.LoginName = txtLoginName.Text.Trim();
            registration.Question = txtQuestion.Text.Trim();
            registration.Answer = txtAnswer.Text.Trim();
            if (registration.CheckPasswordInfo() == true)
            {
                DataSet ds = new DataSet();
                ds = registration.SelectPassword();
                int num,num1;
                Random ran = new Random();
                Random ran1 = new Random();
                num = ran.Next(100);
                num1 = ran1.Next(1000);
                registration.Password=num+ds.Tables[0].Rows[0][0].ToString()+num1;
                registration.UpdateNewPassword();
                Session["Password"] = registration.Password;
                Response.Redirect("~/Registration/frmNewUserPassword.aspx");
            }
            else
            {
                lblMsg.Text = "Enter Correct Value...!";
               
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
        txtAnswer.Text = "";
        txtLoginName.Text = "";
        txtQuestion.Text = "";
        

    }
}
