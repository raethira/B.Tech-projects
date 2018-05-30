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

public partial class Registration_RegisterUser_frmUserInbox : System.Web.UI.Page
{
    UserInboxBL inbox = new UserInboxBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            BindGridview();
        }

    }
    private void BindGridview()
    {
        inbox.To = Session["UserName"].ToString() + "@spicemail.com";
        DataSet dsTemp = inbox.ShowAllMailInbox();
        if (dsTemp.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = dsTemp.Tables[0];
            GridView1.DataBind();
        }
        else
        {
            CheckBox1.Visible = false;
            lblError.Visible = true;
            lblError.Text = "No Mail Available....";
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            inbox.To = Session["UserName"].ToString() + "@spicemail.com";
            inbox.Id = int.Parse(e.CommandArgument.ToString());
            inbox.UpdateMailReadingStatus();
            Session["To"] = inbox.To;
            Session["Id"] = int.Parse(e.CommandArgument.ToString());
            Response.Redirect("~/Registration/RegisterUser/frmFullMailPage.aspx");
        }
    }
    protected void ImgDelete_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox chk;
        Label lbl;

        foreach (GridViewRow gr in GridView1.Rows)
        {
            lbl = (Label)gr.FindControl("lblid");
            inbox.Id = int.Parse(lbl.Text);
            inbox.To = Session["UserName"].ToString() + "@spicemail.com";
            chk = (CheckBox)gr.FindControl("chk1");
            if (chk.Checked == true)
            {
                inbox.DeleteMailFromInbox();
                BindGridview();
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Plz Select Mail...!"; 
            }
        }
    }
    protected void ImgReply_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox chk;
        Label lbl;
        Literal lbl1;

        foreach (GridViewRow gr in GridView1.Rows)
        {          
            chk = (CheckBox)gr.FindControl("chk1");
            if (chk.Checked == true)
            {
                lbl = (Label)gr.FindControl("lblid");
                lbl1 = (Literal)gr.FindControl("ltl1");
                inbox.Id = int.Parse(lbl.Text);
                inbox.To = Session["UserName"].ToString() + "@spicemail.com";
                Session["To"] = lbl1.Text;
                Session["Id"] = inbox.Id;
                Response.Redirect("~/Registration/RegisterUser/frmUserReply.aspx");
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Plz Select Mail...!";
            }   
        }
        
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            chk = (CheckBox)gr.FindControl("chk1");
            if (CheckBox1.Checked == true)
                chk.Checked = true;
            else
                chk.Checked = false;
        }
    }
    protected void ImgForward_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox chk;
        Label lbl;
      foreach (GridViewRow gr in GridView1.Rows)
        {
            chk = (CheckBox)gr.FindControl("chk1");
            if (chk.Checked == true)
            {
                lbl = (Label)gr.FindControl("lblid");
                inbox.Id = int.Parse(lbl.Text);
                Session["Id"] = inbox.Id;
                Response.Redirect("~/Registration/RegisterUser/frmUserForwardMail.aspx");

            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Plz Select Mail...!";
            }   
        }
        
    }
    protected void imgSave_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox chk;
        Label lbl;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            chk = (CheckBox)gr.FindControl("chk1");
            if (chk.Checked == true)
            {
                lbl = (Label)gr.FindControl("lblid");
                inbox.Id = int.Parse(lbl.Text);
                inbox.To = Session["UserName"].ToString() + "@spicemail.com";
                inbox.UpdateMailSaveStatus();
                BindGridview();
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Plz Select Mail...!";
            }   
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridview();
    }
}

