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
public partial class Registration_RegisterUser_frmUserReply : System.Web.UI.Page
{
    UserInboxBL inbox = new UserInboxBL();
    UserDraftBoxBL draft = new UserDraftBoxBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            FileUpload1.Visible = false;
            lnkRemove.Visible = false;
            BindMessage();    
        }

    }
    private void BindMessage()
    {
        inbox.Id = int.Parse(Session["Id"].ToString());
        inbox.To = Session["UserName"].ToString() + "@spicemail.com";
        DataSet ds = new DataSet();
        txtFrom.Text = Session["UserName"].ToString() + "@spicemail.com";
        txtTo.Text = Session["To"].ToString();
        ds = inbox.ShowMessgaeInfoForReply();
      if(ds.Tables[0].Rows[0][0].ToString() !=null)

        txtSubject.Text ="Rep:"+ ds.Tables[0].Rows[0][0].ToString();
    else
    {
        txtSubject.Text = "";
    }
        if(ds.Tables[0].Rows[0][1].ToString() !=null)

        txtMailMessage.Text = ds.Tables[0].Rows[0][1].ToString();
    else
    {
        txtMailMessage.Text = "";
    }
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

            if (chkSave.Checked == false)
            {
                inbox.SendStatus = "Not Sent";

            }
            else
            {
                inbox.SendStatus = "Sent";
            }
            inbox.InsertInUserInbox();
            Session["To"] = txtTo.Text.Trim();
            Response.Redirect("~/Registration/RegisterUser/frmSendmailMessagePage.aspx");

        }
        catch (Exception)
        {

            throw;
        }

    }
    protected void ImgSave1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            draft.LoginName = Session["UserName"].ToString();
            draft.From = txtFrom.Text.Trim();
            draft.To = txtTo.Text.Trim();
            draft.Subject = txtSubject.Text.Trim();
            draft.FullMessage = txtMailMessage.Text.Trim();
            draft.Date = System.DateTime.Now;
            string Attachments;
            if (FileUpload1.HasFile)
            {
                Attachments = Server.MapPath("~/Attachments/");//+ FileUpload1.FileName);
                if (!Directory.Exists(Attachments))
                    Directory.CreateDirectory(Attachments);
                FileUpload1.PostedFile.SaveAs(Attachments + FileUpload1.FileName);
                draft.Attachement = FileUpload1.FileName;
                int size = 0;
                size = FileUpload1.PostedFile.ContentLength / 1024;

                draft.Size = size.ToString() + "KB";
            }
            else
            {
                draft.Attachement = "";
                draft.Size = "";
            }

            draft.InsertInDraftItem();


        }
        catch (Exception)
        {

            throw;
        }
       
    }
    protected void ImgCancel1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Registration/frmUserHomePage.aspx");
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

            if (chkSave.Checked == false)
            {
                inbox.SendStatus = "Not Sent";

            }
            else
            {
                inbox.SendStatus = "Sent";
            }
            inbox.InsertInUserInbox();
            Session["To"] = txtTo.Text.Trim();
            Response.Redirect("~/Registration/RegisterUser/frmSendmailMessagePage.aspx");

        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void ImgSave2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            draft.LoginName = Session["UserName"].ToString();
            draft.From = txtFrom.Text.Trim();
            draft.To = txtTo.Text.Trim();
            draft.Subject = txtSubject.Text.Trim();
            draft.FullMessage = txtMailMessage.Text.Trim();
            draft.Date = System.DateTime.Now;
            string Attachments;
            if (FileUpload1.HasFile)
            {
                Attachments = Server.MapPath("~/Attachments/");//+ FileUpload1.FileName);
                if (!Directory.Exists(Attachments))
                    Directory.CreateDirectory(Attachments);
                FileUpload1.PostedFile.SaveAs(Attachments + FileUpload1.FileName);
                draft.Attachement = FileUpload1.FileName;
                int size = 0;
                size = FileUpload1.PostedFile.ContentLength / 1024;

                draft.Size = size.ToString() + "KB";
            }
            else
            {
                draft.Attachement = "";
                draft.Size = "";
            }

            draft.InsertInDraftItem();


        }
        catch (Exception)
        {

            throw;
        }
       
    }
    protected void ImgCancel2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Registration/frmUserHomePage.aspx");

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
}
