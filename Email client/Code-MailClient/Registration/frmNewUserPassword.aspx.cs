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

public partial class Registration_frmNewUserPassword : System.Web.UI.Page
{
    UserRegistrationBL registration = new UserRegistrationBL();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            BindPassword();
        
        }

    }
    private void BindPassword()
    {
        lblPassword.Text = Session["Password"].ToString();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}
