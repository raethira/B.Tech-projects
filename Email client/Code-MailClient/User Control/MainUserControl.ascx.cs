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

public partial class User_Control_MainUserControl : System.Web.UI.UserControl
{
    UserInboxBL inbox = new UserInboxBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindLabel();
        
        }
    }
    private void BindLabel()
    {
        int ShowCount = 0;
        inbox.To = Session["UserName"].ToString()+"@spicemail.com";
        lblCount.Text ="("+inbox.SetNewMailCount(ShowCount).ToString()+")"+"New Mail";
    }
}
