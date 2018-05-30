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

public partial class User_Control_HeaderUserControl : System.Web.UI.UserControl
{
    UserRegistrationBL registration = new UserRegistrationBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }


    }
    private void BindData()
    {
        if (Session["UserName"] != null)
        {
            lblLogin.Text = Session["UserName"].ToString() + "@spicemail.com";
            registration.LoginName = Session["UserName"].ToString();
            DataSet ds = new DataSet();
            ds = registration.SelectName();
            lblUserName.Text = ds.Tables[0].Rows[0][0].ToString() + "  " + ds.Tables[0].Rows[0][1].ToString();
        }
        else
        {
            Response.Redirect("../Default.aspx");
        }

    }
   
    protected void lnkHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmUserHomePage.aspx");
    }
    protected void lnkFeedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmUserFeedback.aspx");

    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        registration.LoginName = Session["UserName"].ToString();
        registration.LogoutDate = System.DateTime.Now.Date;
        registration.LogoutTime = System.DateTime.Now.ToShortTimeString();
        registration.InsertUserLogoutHistory();
        Session.Abandon();
        Session.Remove("UserName");
        Response.Redirect("~/Default.aspx");
    }
   
}
