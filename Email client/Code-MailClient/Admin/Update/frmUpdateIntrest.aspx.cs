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

public partial class Admin_Update_frmUpdateIntrest : System.Web.UI.Page
{
    IntrestBL intrest = new IntrestBL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/frmAdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            BindData();
        
        }
    }
    private void BindData()
    {
        intrest.Id = int.Parse(Request["Id"].ToString());
        DataSet ds = new DataSet();
        ds = intrest.ShowIntrestById();
        DataRow dr = ds.Tables[0].Rows[0];
        txtName.Text = dr[0].ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        { 
        intrest.Id = int.Parse(Request["Id"].ToString());
        intrest.Intrest = txtName.Text.Trim();
        intrest.UpdateIntrest();
        lblMsg.Text = "Updated...!";
        }
        catch (Exception)
        {
            
            throw;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/frmAddInterest.aspx");
    }
}
