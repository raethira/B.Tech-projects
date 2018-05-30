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

public partial class Registration_frmUserRegistration : System.Web.UI.Page
{
    Country country = new Country();
    StateBL state = new StateBL();
    IntrestBL intrest = new IntrestBL();
    OccupationBL occupation = new OccupationBL();
    IncomeBL income = new IncomeBL();
    IndustryBL industry = new IndustryBL();
    UserRegistrationBL registration = new UserRegistrationBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        GMDatePicker1.MaxDate = System.DateTime.Now;
        GMDatePicker1.MinDate = System.DateTime.Now.AddYears(-100);
        BindRandomNumber();
        if (!IsPostBack)
        {

            BindData();
        }
        GMDatePicker1.Attributes.Add("readonly", "readonly()");
    }

    //------------------------------------------------------------------------------
    private void BindRandomNumber()
    {
        Random num = new Random();
        txtRandomNumber.Text = num.Next(500000).ToString();
    }
    //---------------------------------------------------------------------------
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

        chklistInrest.DataSource = intrest.ShowAllIntrest();
        chklistInrest.DataTextField = "Interest";
        chklistInrest.DataBind();


        ddlIncome.DataSource = income.ShowAllIncome();
        ddlIncome.DataTextField = "Income";
        ddlIncome.DataBind();
        ddlIncome.Items.Insert(0, "Choose One...");

        ddlIndustry.DataSource = industry.ShowAllIndustry();
        ddlIndustry.DataTextField = "IndustryType";
        ddlIndustry.DataBind();
        ddlIndustry.Items.Insert(0, "Choose One...");

        ddlOccupation.DataSource = occupation.ShowAllOccupation();
        ddlOccupation.DataTextField = "Occupation";
        ddlOccupation.DataBind();
        ddlOccupation.Items.Insert(0, "Choose One...");

    }


    protected void lnkAvailability_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim().Length < 1)
        {
            lblAvailability.Text = "Plz Enter User Name...!";
            txtName.Focus();
            return;

        }
        registration.LoginName = txtName.Text.Trim();
        if (registration.CheckUserAvailability() == true)
        {
            lblAvailability.Text = "User Name Already Exists...!";

        }

        else
        {
            lblAvailability.Text = "User Name Not Exists...!";
        }
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        try
        {
            registration.LoginName = txtName.Text.Trim();
            if (txtPassword.Text.Trim().Length < 6)
            {
                lblMsg.Focus();
                lblMsg.Text = "Password Should Have Atleast 6 Characters";
                return;
            }
            else
            {
                registration.Password = txtPassword.Text.Trim();
                registration.Question = txtQuestion.Text.Trim();
                registration.Answer = txtAnswer.Text.Trim();
                registration.FirstName = txtFName.Text.Trim();
                registration.LastName = txtLName.Text.Trim();
                registration.Address = txtAddress.Text.Trim();
                registration.City = txtCity.Text.Trim();
                registration.State = ddlState.SelectedItem.Text.Trim();
                 
                registration.PinCode = txtPinCode.Text.Trim();
                registration.Country = ddlCountry.SelectedItem.Text.Trim();
                registration.Email = txtMail.Text.Trim();
                registration.Phone = txtPhone.Text.Trim();
                registration.DOB = GMDatePicker1.Date;
                registration.Gender = ddlGender.SelectedItem.Text.Trim();
                if (ddlLanguage.SelectedIndex == 0)
                    registration.Language = "";
                else
                registration.Language = ddlLanguage.SelectedItem.Text.Trim();
            if (ddlIncome.SelectedIndex == 0)
                registration.Income = "";
            else
                registration.Income = ddlIncome.SelectedItem.Text.Trim();
            if (ddlOccupation.SelectedIndex == 0)
                registration.Occupation = "";
            else
                registration.Occupation = ddlOccupation.SelectedItem.Text.Trim();
            if (ddlIndustry.SelectedIndex == 0)
                registration.IndustryType = "";
            else
                registration.IndustryType = ddlIndustry.SelectedItem.Text.Trim();
                string Intrest = "";
                for (int i = 0; i < chklistInrest.Items.Count; i++)
                {
                    if (chklistInrest.Items[i].Selected == true)
                        Intrest = Intrest + chklistInrest.Items[i].Text + ",";


                }
                Intrest = Intrest.Remove(Intrest.Length - 1, 1);
                registration.Interest = Intrest;
                registration.Date = System.DateTime.Now.Date;
                if (txtNumber.Text.Trim().Length < 1)
                {
                    lblMsg.Text = "Enter No. to Match...!";
                    return;
                }
                registration.InsertUserLoginInfo();
                registration.InsertRegistrationInfo();
                Session["UserName"] = registration.LoginName;
                Response.Redirect("~/Registration/frmSignUpSuccessful.aspx");

            }
           
        }
        catch (Exception ex)
        {
            lblMsg.Text = "User Name Already Exists...!";
              
        }


    }
}

