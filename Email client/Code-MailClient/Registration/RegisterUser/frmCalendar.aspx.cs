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
using System.Drawing;
public partial class Registration_RegisterUser_frmCalendar : System.Web.UI.Page
{
    UserAppointmentBL appointment = new UserAppointmentBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            Panel1.Visible = false;
            BindDropdown();          
        }
    }
    private void BindDropdown()
    {
        int time=1;
        while (time <= 12)
        {
            ddlTime1.Items.Add(time.ToString());
            time++;
          
        }
        ddlTime1.Items.Insert(0, "Choose Time..");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        txtAppointment.Text = "";
        lblMsg.Text = "";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            appointment.LoginName = Session["UserName"].ToString();
            appointment.DateOfAppointment = Calendar1.SelectedDate.Date;
            appointment.Appointment = txtAppointment.Text.Trim();
            appointment.AppointmentTime = ddlTime1.SelectedItem.Text + ddlTime2.SelectedItem.Text;
            appointment.InserUserAppointment();
            lblMsg.Text = "Your Appointment is Added...!";

        }
        catch (Exception ex)
        {lblMsg.Text=ex.Message.ToString();
        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }



    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmUserCalendarHome.aspx");
    }
}
