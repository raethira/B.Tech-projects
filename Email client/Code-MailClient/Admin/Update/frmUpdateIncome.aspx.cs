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

public partial class Admin_Update_frmUpdateIncome : System.Web.UI.Page
{
    IncomeBL income = new IncomeBL();
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
        income.Id = int.Parse(Request["Id"].ToString());
        DataSet ds = new DataSet();
        ds = income.ShowIncomeById();
        DataRow dr = ds.Tables[0].Rows[0];
        txtName.Text = dr[0].ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            income.Id = int.Parse(Request["Id"].ToString());
            income.Income = txtName.Text.Trim();
            income.UpdateIncome();
            lblMsg.Text = "Updated...!";
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/frmAddIncome.aspx");
    }
}
