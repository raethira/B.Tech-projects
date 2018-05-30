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

public partial class Registration_RegisterUser_frmShowContactByType : System.Web.UI.Page
{
    Country country = new Country();
    StateBL state = new StateBL();
    UserAddressBookBL address = new UserAddressBookBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        GMDatePicker2.MaxDate = System.DateTime.Now;
        GMDatePicker2.MinDate = System.DateTime.Now.AddYears(-100);

        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            BindData();
            BindData1();
            BindGridView1();
            BindGridView2();
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }
        GMDatePicker2.Attributes.Add("readonly", "readonly()");
    }
    private void BindGridView1()
    {
        address.LoginName = Session["UserName"].ToString();
        GridView3.DataSource = address.ShowAllPersonalContact();
        GridView3.DataBind();

    }
    private void BindGridView2()
    {
        address.LoginName = Session["UserName"].ToString();
        GridView4.DataSource = address.ShowAllOfficialContact();
        GridView4.DataBind();

    }
    private void BindData()
    {
        ddlState.DataSource = state.ShowAllState();
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateId"; 
        ddlState.DataBind();
        ddlState.Items.Insert(0, "Choose One...");

        ddlCountry.DataSource = country.ShowCountry();
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Choose One...");


    }
    private void BindData1()
    {
        ddlCountry1.DataSource = country.ShowCountry();
        ddlCountry1.DataTextField = "CountryName";
        ddlCountry1.DataValueField = "CountryId";
        ddlCountry1.DataBind();
        ddlCountry1.Items.Insert(0, "Choose One...");

        ddlState1.DataSource = state.ShowAllState();
        ddlState1.DataTextField = "StateName";
        ddlState1.DataValueField = "StateId";
        ddlState1.DataBind();
        ddlState1.Items.Insert(0, "Choose One...");

    }

    
//Gridview4 for  Official
    protected void GridView4_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        foreach (ListItem li1 in ddlCountry1.Items)
        {
            if (li1.Selected == true)
                li1.Selected = false;
        }
        foreach (ListItem li2 in ddlState1.Items)
        {
            if (li2.Selected == true)
                li2.Selected = false;
        }
    
        try
        {
            Panel6.Visible = true;
            Button btn;
            foreach (GridViewRow gr in GridView4.Rows)
            {
                if (gr.RowIndex == e.RowIndex)
                {
                    address.LoginName = Session["UserName"].ToString();

                    btn = (Button)gr.FindControl("btnupdate1");
                    address.Id = int.Parse(btn.CommandArgument.ToString());
                    ViewState["Id"] = address.Id;
                    DataSet ds = new DataSet();
                    ds = address.ShowOfficialContactById();

                    DataRow dr = ds.Tables[0].Rows[0];
                    txtCompanyName.Text = dr[0].ToString();
                    txtFName1.Text = dr[1].ToString();
                    txtLName1.Text = dr[2].ToString();
                    txtAddress1.Text = dr[3].ToString();
                    txtCity1.Text = dr[4].ToString();
                    ListItem li1 = ddlCountry1.Items.FindByText(dr[5].ToString());
                    if (li1 != null)
                    {
                        li1.Selected = true;
                    }
                    else
                    {
                        ddlCountry1.Items[0].Selected = true;

                    }
                    ListItem li2 = ddlState1.Items.FindByText(dr[6].ToString());
                    if (li2 != null)
                    {
                        li2.Selected = true;
                    }
                    else
                    {
                        ddlState1.Items[0].Selected = true;
                    }
                    txtPinCode1.Text = dr[7].ToString();
                    txtPhone1.Text = dr[8].ToString();
                    txtMobile1.Text = dr[9].ToString();
                    txtFaxNo.Text = dr[10].ToString();
                    txtMail1.Text = dr[11].ToString();
                    txtWebsite.Text = dr[12].ToString();

                }
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message.ToString();
        }

    }
    protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Button btn;
        foreach (GridViewRow gr in GridView4.Rows)
        {
            if (gr.RowIndex == e.RowIndex)
            {
                address.LoginName = Session["UserName"].ToString();
                btn = (Button)gr.FindControl("btndelete1");
                address.Id = int.Parse(btn.CommandArgument.ToString());
            }
            address.DeleteOfficialContact();
            lblMsg.Text = "Deleted...!";
            BindGridView2();

        }



    }
   

    protected void GridView4_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView4.PageIndex = e.NewPageIndex;
        BindGridView2();

    }

    //Gridview3 For PersonalDetail
    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Button btn;
        foreach (GridViewRow gr in GridView3.Rows)
        {
            if (gr.RowIndex == e.RowIndex)
            {
                address.LoginName = Session["UserName"].ToString();
                btn = (Button)gr.FindControl("btndelete");
                address.Id = int.Parse(btn.CommandArgument.ToString());
            }

            address.DeletePersonalContact();
            lblMsg.Text = "Deleted...!";
            BindGridView1();
        }

    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
        BindGridView1();

    }
    protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        foreach (ListItem li1 in ddlCountry.Items)
        {
            if (li1.Selected==true)
            li1.Selected=false;
        }
        foreach (ListItem li2 in ddlState.Items)
        {
            if (li2.Selected == true)
                li2.Selected = false;
        }
        foreach (ListItem li3 in ddlGender.Items)
        {
            if (li3.Selected == true)
                li3.Selected = false;
        }
        try
        {
            Button btn;
            foreach (GridViewRow gr in GridView3.Rows)
            {
                if (gr.RowIndex == e.RowIndex)
                {
                    address.LoginName = Session["UserName"].ToString();
                    Panel5.Visible = true;
                    btn = (Button)gr.FindControl("btnupdate");
                    address.Id = int.Parse(btn.CommandArgument.ToString());
                    ViewState["Id"] = address.Id;
                    DataSet ds = new DataSet();
                    ds = address.ShowPersonalContactById();
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow dr = ds.Tables[0].Rows[0];
                        txtFName.Text = dr[0].ToString();
                        txtLName.Text = dr[1].ToString();
                        ListItem li = ddlGender.Items.FindByText(dr[2].ToString());
                        if (li != null)
                        {
                            li.Selected = true;

                        }
                        else
                        {
                            ddlGender.Items[0].Selected = true;
                        }
                        txtAddress.Text = dr[3].ToString();
                        txtCity.Text = dr[4].ToString();
                        ListItem li1 = ddlCountry.Items.FindByText(dr[5].ToString());
                        if (li1 != null)
                        {
                            li1.Selected = true;
                        }
                        else
                        {
                            ddlCountry.Items[0].Selected = true;

                        }
                        ListItem li2 = ddlState.Items.FindByText(dr[6].ToString());
                        if (li2 != null)
                        {
                            li2.Selected = true;
                        }
                        else
                        {
                            ddlState.Items[0].Selected = true;
                        }
                        txtPinCode.Text = dr[7].ToString();
                        txtPhone.Text = dr[8].ToString();
                        txtMobile.Text = dr[9].ToString();
                        txtMail.Text = dr[10].ToString();
                        if (dr[11].ToString() != null)
                            GMDatePicker2.Date = Convert.ToDateTime(dr[11].ToString());
                        else
                            GMDatePicker2.Date = System.DateTime.Now.Date;
                    }
                    
                }
            }
        }
        catch (Exception ex)
        {

            lblMsg.Text = ex.Message.ToString();
        }
    }
    protected void lnkPersonal_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        Panel4.Visible = false;
        Panel6.Visible = false;
    }
    protected void lnkOfficial_Click(object sender, EventArgs e)
    {
        Panel3.Visible = false;
        Panel4.Visible = true;
        Panel5.Visible = false;
    }
    protected void btnUpdatePersonal_Click(object sender, EventArgs e)
    {
        try
        {
            address.LoginName = Session["UserName"].ToString();
            address.Id = int.Parse(ViewState["Id"].ToString());
            address.FirstName = txtFName.Text.Trim();
            address.LastName = txtLName.Text.Trim();
            address.Gender = ddlGender.SelectedItem.Text;
            address.Address = txtAddress.Text.Trim();
            address.City = txtCity.Text.Trim();
            address.Country = ddlState.SelectedItem.Text;
            address.State = ddlState.SelectedItem.Text;
            address.PinCode = txtPinCode.Text.Trim();
            address.Phone = txtPhone.Text.Trim();
            address.Mobile = txtMobile.Text.Trim();
            address.Email = txtMail.Text.Trim();
            address.DOB = GMDatePicker2.Date;
            address.UpdatePersonalConatctDetail();
            lblMsg.Text = "Contact Updated...!";
            BindGridView1();
        }
        catch (Exception)
        {

            throw;
        }

    }
    protected void btnUpdateOfficial_Click(object sender, EventArgs e)
    {
        try
        {           
            address.Id = int.Parse(ViewState["Id"].ToString());
            address.LoginName = Session["UserName"].ToString();
            address.CompanyName = txtCompanyName.Text.Trim();
            address.FirstName = txtFName1.Text.Trim();
            address.LastName = txtLName1.Text.Trim();
            address.Address = txtAddress1.Text.Trim();
            address.City = txtCity1.Text.Trim();
            address.Country = ddlState1.SelectedItem.Text;
            address.State = ddlState1.SelectedItem.Text;
            address.PinCode = txtPinCode1.Text.Trim();
            address.Phone = txtPhone1.Text.Trim();
            address.Mobile = txtMobile1.Text.Trim();
            address.FaxNo = txtFaxNo.Text.Trim();
            address.Email = txtMail1.Text.Trim();
            address.Website = txtWebsite.Text.Trim();
            address.UpdateOfficialConatctDetail();
            lblMsg1.Text = "Contact Updated...!";
            BindGridView2();
        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void btnBack1_Click(object sender, EventArgs e)
    {
        Panel6.Visible = false;
    }
    protected void lnkReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmUserAddressBook.aspx");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Panel5.Visible = false;
    }
}
