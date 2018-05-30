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

public partial class Registration_RegisterUser_frmFullMailPage : System.Web.UI.Page
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
            BindMailMessage();
        }
    }
    private void BindMailMessage()
    {
        inbox.To = Session["To"].ToString();
        inbox.Id =int.Parse(Session["Id"].ToString());
        DataSet ds = new DataSet();
        ds = inbox.ShowUserFullMessage();

        lblFullMsg.Text = ds.Tables[0].Rows[0][0].ToString().Replace("\n","<br>");
        if (System.IO.File.Exists(Server.MapPath("~/Attachments/" + ds.Tables[0].Rows[0][1].ToString())))
        {
            HypAttachment.Text =ds.Tables[0].Rows[0][1].ToString();
            HypAttachment.NavigateUrl = ("~/Attachments/" + ds.Tables[0].Rows[0][1].ToString());
            HypAttachment.Target = "_blank";
           
        }
        else
        {
            HypAttachment.Text = "No Attachment";

        }
     
    }
    protected void ImgReturnToInbox_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmUserInbox.aspx");
    }
    protected void ImgDelete_Click(object sender, ImageClickEventArgs e)
    {
        inbox.Id = int.Parse(Session["Id"].ToString());
        inbox.To = Session["To"].ToString();
        inbox.DeleteMailFromInbox();
        Response.Redirect("~/Registration/RegisterUser/frmUserInbox.aspx");
        lblMsg.Text = "Deleted...!";
    }
   
}
