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

public partial class Admin_frmUserLogOutHistory : System.Web.UI.Page
{AdminBL admin=new AdminBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/frmAdminLogin.aspx");
        }

    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        try
        {
            if (GMDatePicker1.IsNull || GMDatePicker2.IsNull)
            {
                lblMsg.Text = "Plz Select Date...!";
                return;

                }
            else
            {
                admin.Date = GMDatePicker1.Date;
                admin.Date1 = GMDatePicker2.Date;
                GridView1.DataSource = admin.ShowUserLogoutHistory();
                GridView1.DataBind();
            }
            
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            if (GMDatePicker1.IsNull || GMDatePicker2.IsNull)

                lblMsg.Text = "Plz Select Date...!";
            else
            {
                GridView1.PageIndex = e.NewPageIndex;
                admin.Date = GMDatePicker1.Date;
                admin.Date1 = GMDatePicker2.Date;
                GridView1.DataSource = admin.ShowUserLogoutHistory();
                GridView1.DataBind();
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
}
