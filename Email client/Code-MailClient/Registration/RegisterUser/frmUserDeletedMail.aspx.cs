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

public partial class Registration_RegisterUser_frmUserDeletedMail : System.Web.UI.Page
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
        inbox.To = Session["UserName"].ToString()+"@spicemail.com";
        GridView1.DataSource = inbox.ShowAllDeletedMail();
        GridView1.DataBind();
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
    protected void btnRestore_Click(object sender, EventArgs e)
    {
        try
        {
            CheckBox chk;
            Label lbl;

            foreach (GridViewRow gr in GridView1.Rows)
            {
                lbl = (Label)gr.FindControl("lblid");
                inbox.Id = int.Parse(lbl.Text);
                //ViewState["Id"] = int.Parse(lbl.Text);
                inbox.To = Session["UserName"].ToString() + "@spicemail.com";
                chk = (CheckBox)gr.FindControl("chk1");
                if (chk.Checked == true)
                {
                    inbox.RestoreMailToInbox();
                    BindGridview();
                }

                else
                {
                    lblMsg.Text = "Plz Select Mail...!";
                }   
                
            }

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
                    inbox.DeleteMailPermanently();
                    BindGridview();
                }
                else
                {
                    lblMsg.Text = "Plz Select Mail...!";
                }   
                 
             }

        }
        catch (Exception)
        {

            throw;
        }

    }
}
