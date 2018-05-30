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
public partial class Registration_RegisterUser_frmViewUserAppointments : System.Web.UI.Page
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
        int time = 1;
        while (time <= 12)
        {
            ddlTime1.Items.Add(time.ToString());
            time++;

        }
        ddlTime1.Items.Insert(0, "Choose Time..");
    }
    private void BindGridview()
    {
        appointment.LoginName = Session["UserName"].ToString();
        appointment.DateOfAppointment = Calendar1.SelectedDate;
        GridView1.DataSource = appointment.ShowAppointmentByDate();
        GridView1.DataBind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            appointment.Id = int.Parse(ViewState["Id"].ToString());
            appointment.LoginName = Session["UserName"].ToString();
            appointment.DateOfAppointment = Calendar1.SelectedDate.Date;
            appointment.Appointment = txtAppointment.Text.Trim();
            appointment.AppointmentTime = ddlTime1.SelectedItem.Text + ddlTime2.SelectedItem.Text;
            appointment.UpdateAppointment();
            lblMsg.Text = "Your Appointment Has Updated...!";
            appointment.LoginName = Session["UserName"].ToString();
            appointment.DateOfAppointment = Calendar1.SelectedDate;
            GridView1.DataSource = appointment.ShowAppointmentByDate();
            GridView1.DataBind();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmUserCalendarHome.aspx");
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        appointment.LoginName = Session["UserName"].ToString();
        DataSet ds = new DataSet();
        ds = appointment.ShowMonth();
       if (ds.Tables[0].Rows.Count > 1)
        {
            for (int count = 0; count < ds.Tables[0].Rows.Count; count++)
            {

                if (!e.Day.IsOtherMonth)
                {
                    if (e.Day.Date.Month == Convert.ToDateTime(ds.Tables[0].Rows[count][0].ToString()).Date.Month)
                    {
                        if (e.Day.Date.Day == Convert.ToDateTime(ds.Tables[0].Rows[count][0].ToString()).Date.Day)
                        {
                            e.Cell.ForeColor = System.Drawing.Color.Red;
                            e.Cell.BackColor = System.Drawing.Color.Yellow;
                        }
                    }
                }
            }
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        try
        {
            BindGridview();
                  
        }
        catch (Exception)
        {
            
            throw;
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            appointment.Id = int.Parse(ViewState["Id"].ToString());
            appointment.LoginName = Session["UserName"].ToString();
            appointment.DeleteAppointment();
            lblMsg.Text = "Your Appointment Has Deleted...!";
            BindGridview();
            Panel1.Visible = false;
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        foreach (ListItem li1 in ddlTime1.Items)
        {
            if (li1.Selected == true)
                li1.Selected = false;
        }
        try
        {
            if (e.CommandName == "View")
            {
                Panel1.Visible = true;
                appointment.LoginName = Session["UserName"].ToString();
                appointment.Id = int.Parse(e.CommandArgument.ToString());
                ViewState["Id"] = appointment.Id;
                DataSet ds = new DataSet();
                ds = appointment.ShowAppointmentById();
                txtAppointment.Text = ds.Tables[0].Rows[0][0].ToString();
                ListItem li = ddlTime1.Items.FindByText(ds.Tables[0].Rows[0][1].ToString());
                if (li != null)
                {
                    li.Selected = true;
                }
               
            }

        }
        catch (Exception)
        {
            
            throw;
        }
    }
}