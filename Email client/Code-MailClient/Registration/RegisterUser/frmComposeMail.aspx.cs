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
public partial class Registration_RegisterUser_frmComposeMail : System.Web.UI.Page
{
    UserInboxBL inbox = new UserInboxBL();
    UserDraftBoxBL draft = new UserDraftBoxBL();
    UserRegistrationBL user = new UserRegistrationBL();
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
                txtFrom.Text = Session["UserName"].ToString() + "@Spicemail.Com";
            }
       
    }
    //if (IsPostBack)
    //{
    //    if (Session["Email"].ToString() != null)
    //    {
    //        txtTo.Text = Session["Email"].ToString();
    //    }
    //    else
    //    {
    //        txtTo.Text = "";
    //    }
    //}
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
            string[] Name = txtTo.Text.Trim().Split('@');
            user.LoginName = Name[0].ToString();
            if (user.CheckUserAvailability() == true)
            {
                inbox.To = txtTo.Text.Trim();
            }
            else
            {
                lblMsg.Text = "Invalid Email Id...!";
                return;
            }
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
              size = FileUpload1.PostedFile.ContentLength/1024;
              
              inbox.Size = size.ToString()+"KB";
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
       // }
    //    else
    //{
    //    Label1.Text="Recepient is not a valid user";
    //}
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
            lblMsg.Text = "Your Mail has sent to draft folder";

        }
        catch (Exception)
        {

            throw;
        }
       

    }
    protected void ImgSend2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            inbox.LoginName = Session["UserName"].ToString();
            inbox.From = txtFrom.Text.Trim();
            string[] Name = txtTo.Text.Trim().Split('@');
            user.LoginName = Name[0].ToString();
            if (user.CheckUserAvailability() == true)
            {
                inbox.To = txtTo.Text.Trim();
            }
            else
            {
                lblMsg.Text = "Invalid Email Id...!";
                return;
            }
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
                inbox.SendStatus = "";

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
    protected void ImgCancel1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Registration/frmUserHomePage.aspx");

    }
    protected void ImgCancel2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Registration/frmUserHomePage.aspx");
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
}
