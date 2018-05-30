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
using System.IO;
public partial class Admin_frmAdminComposeMail : System.Web.UI.Page
{
    UserInboxBL inbox = new UserInboxBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Admin/frmAdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            FileUpload1.Visible = false;
            lnkRemove.Visible = false;
            txtFrom.Text = Session["UserName"].ToString() + "@Spicemail.Com";
            txtTo.Text =Session["From"].ToString();
        }
    }
    protected void lnkAttachment_Click(object sender, EventArgs e)
    {
        FileUpload1.Visible = true;
        lnkRemove.Visible = true;

    }
    protected void lnkRemove_Click(object sender, EventArgs e)
    {
        FileUpload1.Visible = false;
        lnkRemove.Visible = false;
    }
    protected void imgSend1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            inbox.LoginName = Session["UserName"].ToString();
            inbox.From = txtFrom.Text.Trim();
            inbox.To = txtTo.Text.Trim();
            inbox.Subject = txtSubject.Text.Trim();
            inbox.FullMessage = txtMailMessage.Text.Trim();
            inbox.Date = System.DateTime.Now;
            string Attachments;
            if (FileUpload1.HasFile)
            {
                Attachments = Server.MapPath("~/Attachments/");//+ FileUpload1.FileName);
                if (!Directory.Exists(Attachments))
                    Directory.CreateDirectory(Attachments);
                FileUpload1.PostedFile.SaveAs(Attachments + FileUpload1.FileName);
                inbox.Attachement = FileUpload1.FileName;
                int size = 0;
                size = FileUpload1.PostedFile.ContentLength / 1024;

                inbox.Size = size.ToString() + "KB";
            }
            else
            {
                inbox.Attachement = "";
                inbox.Size = "";
            }

            inbox.SendStatus = "Not Sent";
                     
            inbox.InsertInUserInbox();
            Session["To"] = txtTo.Text.Trim();
            Response.Redirect("~/Admin/frmSendFeedbackToUser.aspx");

        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void ImgCancel1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Admin/frmViewUserFeedback.aspx");
    }
    protected void ImgSend2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            inbox.LoginName = Session["UserName"].ToString();
            inbox.From = txtFrom.Text.Trim();
            inbox.To = txtTo.Text.Trim();
            inbox.Subject = txtSubject.Text.Trim();
            inbox.FullMessage = txtMailMessage.Text.Trim();
            inbox.Date = System.DateTime.Now;
            string Attachments;
            if (FileUpload1.HasFile)
            {
                Attachments = Server.MapPath("~/Attachments/");//+ FileUpload1.FileName);
                if (!Directory.Exists(Attachments))
                    Directory.CreateDirectory(Attachments);
                FileUpload1.PostedFile.SaveAs(Attachments + FileUpload1.FileName);
                inbox.Attachement = FileUpload1.FileName;
                int size = 0;
                size = FileUpload1.PostedFile.ContentLength / 1024;

                inbox.Size = size.ToString() + "KB";
            }
            else
            {
                inbox.Attachement = "";
                inbox.Size = "";
            }

            inbox.SendStatus = "Not Sent";

            inbox.InsertInUserInbox();
            Session["To"] = txtTo.Text.Trim();
            Response.Redirect("~/Admin/frmSendFeedbackToUser.aspx");

        }
        catch (Exception)
        {

            throw;
        }

    }
    protected void ImgCancel2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Admin/frmViewUserFeedback.aspx");

    }
}
