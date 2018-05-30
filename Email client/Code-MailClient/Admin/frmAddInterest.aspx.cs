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

public partial class Admin_frmAddInterest : System.Web.UI.Page
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
        GridView1.DataSource = intrest.ShowAllIntrest();
        GridView1.DataBind(); 
    
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtName.Text == "" )
                lblMsg.Text = "Plz Enter Value...!";
            else
            {
                intrest.Intrest = txtName.Text.Trim();
                intrest.InsertIntrest();
                lblMsg.Text = "Inserted...!";
                BindData(); 
            }
           

        }
        catch (Exception ex)
        {
          lblMsg.Text=ex.Message.ToString();
        }

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        txtName.Text = "";
        txtName.Focus();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindData(); 

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            Response.Redirect("~/Admin/Update/frmUpdateIntrest.aspx?Id=" + int.Parse(e.CommandArgument.ToString()));
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Button btn;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            if (gr.RowIndex == e.RowIndex)
            {
                btn = (Button)gr.FindControl("btndelete");
                intrest.Id = int.Parse(btn.CommandArgument.ToString());
            }

            intrest.DeleteIntrest();
            lblMsg.Text = "Deleted...!";
            BindData();

        }
    }
}
