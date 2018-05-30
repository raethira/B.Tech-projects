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

public partial class Registration_RegisterUser_frmUserAddressBook : System.Web.UI.Page
{
    Country country = new Country();
    StateBL state = new StateBL();
    UserAddressBookBL address = new UserAddressBookBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        GMDatePicker1.MaxDate = System.DateTime.Now;
        GMDatePicker1.MinDate = System.DateTime.Now.AddYears(-100);
        if (Session["UserName"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        if (!IsPostBack)

        {
            BindData();
        }
        GMDatePicker1.Attributes.Add("readonly", "readonly()");
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
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmUserHomePage.aspx");
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
}
