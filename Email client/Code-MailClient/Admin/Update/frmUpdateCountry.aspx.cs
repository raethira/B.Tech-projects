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

public partial class Admin_Update_frmUpdateCountry : System.Web.UI.Page
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
        country.CountryId = int.Parse(Request["Id"].ToString());
        DataSet ds = new DataSet();
        ds = country.ShowCountryInfoById();
        DataRow dr = ds.Tables[0].Rows[0];
        txtName.Text = dr[0].ToString();
    }
  
   
    protected void btnUPdate_Click(object sender, EventArgs e)
    {
        try
        {
            country.CountryId = int.Parse(Request["Id"].ToString());
            country.Name = txtName.Text.Trim();
            country.Description = txtDescription.Text.Trim();
            country.UpdateCountry();
            lblMsg.Text = "Updated...!";
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/frmAddCountry.aspx");
    }
}
