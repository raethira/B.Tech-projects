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

public partial class Registration_RegisterUser_frmAddContactType : System.Web.UI.Page
{
    Country country = new Country();
    StateBL state = new StateBL();
    UserAddressBookBL address = new UserAddressBookBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)
        {
            BindData();
            BindData1();
        }
    }
    private void BindData()
    {
        ddlCountry.DataSource = country.ShowCountry();
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Choose One...");

        ddlState.DataSource = state.ShowAllState();
        ddlState.DataTextField = "StateName";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "Choose One...");

    }
    private void BindData1()
    {
        ddlCountry1.DataSource = country.ShowCountry();
        ddlCountry1.DataTextField = "CountryName";
        ddlCountry1.DataBind();
        ddlCountry1.Items.Insert(0, "Choose One...");

        ddlState1.DataSource = state.ShowAllState();
        ddlState1.DataTextField = "StateName";
        ddlState1.DataBind();
        ddlState1.Items.Insert(0, "Choose One...");

    }
    protected void btnAddContact_Click(object sender, EventArgs e)
    {
        try
        {
            address.LoginName = Session["UserName"].ToString();
            address.FirstName = txtFName.Text.Trim();
            address.LastName = txtLName.Text.Trim();
            address.Gender = ddlGender.SelectedItem.Text;
            address.Address = txtAddress.Text.Trim();
            address.City = txtCity.Text.Trim();
            address.Country = ddlCountry.SelectedItem.Text;
            address.State = ddlState.SelectedItem.Text;
            address.PinCode = txtPinCode.Text.Trim();
            address.Phone = txtPhone.Text.Trim();
            address.Mobile = txtMobile.Text.Trim();
            address.Email = txtMail.Text.Trim();
            address.DOB = GMDatePicker1.Date;
            address.InsertAddressbookDetail();
            lblMsg.Text = "Contact Added...!";
        }
        catch (Exception)
        {

            throw;
        }

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmUserAddressBook.aspx");
    }
    protected void btnAddOfficialContact_Click(object sender, EventArgs e)
    {
        try
        {

            address.LoginName = Session["UserName"].ToString();
            address.CompanyName = txtCompanyName.Text.Trim();
            address.FirstName = txtFName1.Text.Trim();
            address.LastName = txtLName1.Text.Trim();
            address.Address = txtAddress1.Text.Trim();
            address.City = txtCity1.Text.Trim();
            address.Country = ddlCountry1.SelectedItem.Text;
            address.State = ddlState1.SelectedItem.Text;
            address.PinCode = txtPinCode1.Text.Trim();
            address.Phone = txtPhone1.Text.Trim();
            address.Mobile = txtMobile1.Text.Trim();
            address.FaxNo = txtFaxNo.Text.Trim();
            address.Email = txtMail1.Text.Trim();
            address.Website = txtWebsite.Text.Trim();
            address.InsertOfficialAddressbookDetail();
            lblMsg1.Text = "Contact Added...!";
        }
        catch (Exception)
        {

            throw;
        }

    }
    protected void btnBack1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmUserAddressBook.aspx");

    }



   
}
