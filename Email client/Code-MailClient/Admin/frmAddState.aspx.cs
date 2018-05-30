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

public partial class Admin_frmAddState : System.Web.UI.Page
{
    Country country = new Country();
    StateBL state = new StateBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/frmAdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            BindData();
            BindGridview();
        }

    }
    private void BindData()
    {
        ddlCountry.DataSource = country.ShowCountry();
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Choose One...");
     
     
       
    
       }
    private void BindGridview()
    {
        GridView1.DataSource = state.ShowAllState();
        GridView1.DataBind();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtName.Text.Trim().Length > 0 || ddlCountry.SelectedIndex != 0)
                     
                
                { state.Name = txtName.Text.Trim();
                  state.Description = txtDescription.Text.Trim();
                    state.CountryId = int.Parse(ddlCountry.SelectedValue);
                    state.InsertState();
                    lblMsg.Text = "State Inserted...!";
                    BindGridview();

                }
            else
                 lblMsg.Text = "Plz Select Country...!";
              
                       
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
        BindGridview();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            Response.Redirect("~/Admin/Update/frmUpdateState.aspx?Id=" + int.Parse(e.CommandArgument.ToString()));
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
                state.StateId = int.Parse(btn.CommandArgument.ToString());
            }

            state.DeleteState();
            lblMsg.Text = "Deleted...!";
            BindData();

        }
    }
}
