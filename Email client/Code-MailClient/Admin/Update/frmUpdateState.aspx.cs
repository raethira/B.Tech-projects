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

public partial class Admin_Update_frmUpdateState : System.Web.UI.Page
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
        }


    }
    private void BindData()
    {
        ddlCountry.DataSource = country.ShowCountry();
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Choose One...");

        state.StateId = int.Parse(Request["Id"].ToString());
        DataSet ds = new DataSet();
        ds = state.ShowStateInfoById();
        DataRow dr = ds.Tables[0].Rows[0];
        txtName.Text = dr[0].ToString();
        txtDescription.Text = dr[1].ToString();
        ListItem li = ddlCountry.Items.FindByText(dr[2].ToString());
        if (li != null)
        {
            li.Selected = true;
        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            state.StateId = int.Parse(Request["Id"].ToString());
            state.Name = txtName.Text.Trim();
            state.Description = txtDescription.Text.Trim();
            state.CountryId = int.Parse(ddlCountry.SelectedValue);
            state.UpdateState();
            lblMsg.Text = "Updated...!";
        }
        catch (Exception)
        {

            throw;
        }

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/frmAddState.aspx");
    }
}
