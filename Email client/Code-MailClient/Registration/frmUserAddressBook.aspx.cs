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

public partial class Registration_RegisterUser_frmSeeContactBook : System.Web.UI.Page
{
    UserAddressBookBL address = new UserAddressBookBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            BindSearchLetters();
        }

    }
    private void BindSearchLetters()
    {
        try
        {
            string strLetters = "ALL,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
            string[] strArray = strLetters.Split(',');
            DataTable dt = new DataTable();
            DataColumn dc = new DataColumn("Letter");
            dt.Columns.Add(dc);
            for (int i = 0; i < strArray.Length; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = strArray[i];
                dt.Rows.Add(dr);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
    private void BindGridview()
    {
        if (ddlContactType.SelectedIndex == 1 && ddlNameType.SelectedIndex == 1)
        {
            address.LoginName = Session["UserName"].ToString();
            address.FirstName = txtName.Text.Trim();
            GridView1.DataSource = address.SelectDetailOnFirstName();
            GridView1.DataBind();
        }
        else if (ddlContactType.SelectedIndex == 2 && ddlNameType.SelectedIndex == 1)
        {
            address.LoginName = Session["UserName"].ToString();
            address.FirstName = txtName.Text.Trim();
            GridView1.DataSource = address.SelectOfficialDetailOnFirstName();
            GridView1.DataBind();
        }
        else if (ddlContactType.SelectedIndex == 1 && ddlNameType.SelectedIndex == 2)
        {
            address.LoginName = Session["UserName"].ToString();
            address.LastName = txtName.Text.Trim();
            GridView1.DataSource = address.SelectDetailOnLastName();
            GridView1.DataBind();
        }
        else if (ddlContactType.SelectedIndex == 2 && ddlNameType.SelectedIndex == 2)
        {
            address.LoginName = Session["UserName"].ToString();
            address.LastName = txtName.Text.Trim();
            GridView1.DataSource = address.SelectOfficialDetailOnLastName();
            GridView1.DataBind();
        }
        else if (ddlContactType.SelectedIndex == 2 && ddlNameType.SelectedIndex == 3)
        {
            address.LoginName = Session["UserName"].ToString();
            address.CompanyName = txtName.Text.Trim();
            GridView1.DataSource = address.SelectOfficialDetailOnCompanyName();
            GridView1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BindGridview();    
    }
   
  
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridview();
    }

    protected void btnMail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmUserInbox.aspx");
    }
    protected void btnNewContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmAddContactType.aspx");
    }
    protected void btnShowConatct_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/RegisterUser/frmShowContactByType.aspx");
    }

    private void BindGridview1()
    {

        if (ddlContactType1.SelectedIndex == 1 && ddlBrowseContact.SelectedIndex == 1)
        {   GridView1.DataSource = address.ShowPersonalDetailBySelectedLetter();
            GridView1.DataBind();
        }
        else if (ddlContactType1.SelectedIndex == 2 && ddlBrowseContact.SelectedIndex == 1)
        {
            GridView1.DataSource = address.ShowOfficialDetailBySelectedFirstNameLetter();
            GridView1.DataBind();
        }
        else if (ddlContactType1.SelectedIndex == 1 && ddlBrowseContact.SelectedIndex == 2)
        {
            GridView1.DataSource = address.ShowPersonalDetailBySelectedLastNameLetter();
            GridView1.DataBind();
        }
        else if (ddlContactType1.SelectedIndex == 2 && ddlBrowseContact.SelectedIndex == 2)
        {
            GridView1.DataSource = address.ShowOfficialDetailBySelectedLastNameLetter();
            GridView1.DataBind();
        }
         else if (ddlContactType1.SelectedIndex == 2 && ddlBrowseContact.SelectedIndex == 3)
        {
            GridView1.DataSource = address.ShowOfficialDetailBySelectedCompanyNameLetter();
            GridView1.DataBind();
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Letter")
        {
           address.LoginName = Session["UserName"].ToString();
           address.FirstName = e.CommandArgument.ToString();
           address.LastName = e.CommandArgument.ToString();
           address.CompanyName = e.CommandArgument.ToString();
           BindGridview1();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       HyperLink hyp;
        try
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                if (gr.RowIndex == GridView1.SelectedIndex)
                {
                    hyp = (HyperLink)gr.FindControl("hyp1");                  
                }
            }
        }
        catch (Exception)
        {
            
            throw;
        }
    }

}
