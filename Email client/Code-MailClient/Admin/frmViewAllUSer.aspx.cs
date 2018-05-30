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

public partial class Admin_frmViewAllUSer : System.Web.UI.Page
{
    AdminBL admin = new AdminBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/frmAdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            BindGridview();
        }

    }
    private void BindGridview()
    {
        GridView1.DataSource = admin.ViewAllUserToAdmin();
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridview();
    }
   
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Button btn;
        //foreach (GridViewRow gr in GridView1.Rows)
        //{
        //    if (gr.RowIndex == e.RowIndex)
        //    {
        //        btn = (Button)gr.FindControl("btndelete");
        //        admin.LoginName = btn.CommandArgument.ToString();
        //    }
        //   admin.DeleteUserLogin();
        //   lblMsg.Text = "User Deleted...!";
        //   BindGridview();
        //}
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
          admin.LoginName = e.CommandArgument.ToString();
          admin.DeleteUserLogin();
          lblMsg.Text = "User Deleted...!";
          BindGridview();
        }
        else if (e.CommandName == "Update")
        {
            Session["LoginName"] = e.CommandArgument.ToString();
            Response.Redirect("~/Admin/Update/frmUpdateUserProfile.aspx");
        }
    }
}
