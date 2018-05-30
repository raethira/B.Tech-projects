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

public partial class Registration_RegisterUser_frmUserCalendarHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            Calendar1.Visible = false;
        }

    }
    protected void lnkViewDay_Click(object sender, EventArgs e)
    {
        
       Calendar1.Visible = true;
       Calendar1.SelectionMode = CalendarSelectionMode.Day;
            
    }
    protected void lnkViewWeek_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
        Calendar1.SelectionMode = CalendarSelectionMode.DayWeek;
        Calendar1.SelectWeekText = "Show Week";
    }
    protected void lnkViewMonth_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
        Calendar1.SelectionMode = CalendarSelectionMode.DayWeekMonth;
        Calendar1.SelectMonthText = "Show Month";
        
    }
   
}
