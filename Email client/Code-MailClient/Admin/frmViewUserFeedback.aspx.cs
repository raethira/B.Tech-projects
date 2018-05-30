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

public partial class Admin_frmViewUserFeedback : System.Web.UI.Page
{
    UserFeedbackBL feedback = new UserFeedbackBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/frmAdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            CountFeedback();
            BindGridview();
        }
    }
    private void CountFeedback()
    {
        int ShowCount = 0;
        feedback.To = Session["UserName"].ToString() + "@spicemail.com";
        lblView.Text ="("+feedback.SetNewFeedbackCount(ShowCount).ToString()+")"+"New Message";
    }
    private void BindGridview()
    {
        feedback.To = Session["UserName"].ToString() + "@spicemail.com";
        GridView1.DataSource = feedback.ShowAllUserFeedback();
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            feedback.To = Session["UserName"].ToString() + "@spicemail.com";
            feedback.Id = int.Parse(e.CommandArgument.ToString());
            feedback.UpdateFeedbackReadingStatus();
            Session["To"] = feedback.To;
            Session["Id"] = int.Parse(e.CommandArgument.ToString());
            Response.Redirect("~/Admin/frmViewFullMessage.aspx");
        }
        else if (e.CommandName == "Send")
        {
            Session["To"] = feedback.To;
            foreach (GridViewRow gr in GridView1.Rows)
            {
                Session["From"] = e.CommandArgument.ToString();
                Response.Redirect("~/Admin/frmAdminComposeMail.aspx");

            }

        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridview();
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            chk = (CheckBox)gr.FindControl("chk1");
            if (CheckBox1.Checked)
            {
                chk.Checked = true;

            }
            else
            {
                chk.Checked = false;
            }
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Label lbl;
        CheckBox chk;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            chk = (CheckBox)gr.FindControl("chk1");
            if (chk.Checked)
            {
                lbl = (Label)gr.FindControl("lblid");
                feedback.Id = int.Parse(lbl.Text);
                feedback.DeleteFeedback();
                BindGridview();
            }
            else
            {
                lblView.Text = "No Data Selected...!";
            }
        }
    }
}
