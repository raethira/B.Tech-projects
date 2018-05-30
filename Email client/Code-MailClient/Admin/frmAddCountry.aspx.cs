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

public partial class Admin_frmAddCountry : System.Web.UI.Page
{
    Country country = new Country();
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
        GridView1.DataSource = country.ShowCountry();
        GridView1.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtName.Text == "" || txtDescription.Text == "")
                lblMsg.Text = "Plz Enter Value...!";
            else
            {
                country.Name = txtName.Text.Trim();
                country.Description = txtDescription.Text.Trim();
                country.InsertCountry();
                lblMsg.Text = "Country Inserted...!";
                BindData();
            }
           
        }
        catch (Exception)
        {
            
            throw;
        }

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtDescription.Text = "";
        txtName.Text = "";
        lblMsg.Text = "";
        txtName.Focus();
    }
   
   
   
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        Button btn;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            if (gr.RowIndex == e.RowIndex)
            {
                btn = (Button)gr.FindControl("btndelete");
                country.CountryId = int.Parse(btn.CommandArgument.ToString());
            }

            country.DeleteCountry();
            lblMsg.Text = "Deleted...!";
            BindData();

        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            Response.Redirect("~/Admin/Update/frmUpdateCountry.aspx?Id=" + int.Parse(e.CommandArgument.ToString()));
        }
    }
}
