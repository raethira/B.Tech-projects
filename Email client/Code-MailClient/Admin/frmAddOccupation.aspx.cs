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

public partial class Admin_frmAddOccupation : System.Web.UI.Page
{
    OccupationBL occupation = new OccupationBL();
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
        GridView1.DataSource = occupation.ShowAllOccupation();
        GridView1.DataBind();

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
            Response.Redirect("~/Admin/Update/frmUpdateOccupation.aspx?Id=" + int.Parse(e.CommandArgument.ToString()));
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
                occupation.Id = int.Parse(btn.CommandArgument.ToString());
            }

            occupation.DeleteOccupation();
            lblMsg.Text = "Deleted...!";
            BindData();

        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtName.Text.Trim().Length > 0)
            {
                occupation.Occupation = txtName.Text.Trim();
                occupation.InsertOccupation();
                lblMsg.Text = "Inserted...!";
                BindData();
            }
            else
                lblMsg.Text = "Plz Enter Value...!";
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message.ToString();
        }
    }
}
