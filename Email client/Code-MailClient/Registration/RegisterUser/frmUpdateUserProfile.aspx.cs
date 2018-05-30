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

public partial class Registration_frmUpdateUserProfile : System.Web.UI.Page
{
    Country country = new Country();
    StateBL state = new StateBL();
    IntrestBL intrest = new IntrestBL();
    OccupationBL occupation = new OccupationBL();
    IncomeBL income = new IncomeBL();
    IndustryBL industry = new IndustryBL();
    UserRegistrationBL user = new UserRegistrationBL();
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
            BindDropDown();
            BindData();
              
        }
        GMDatePicker1.Attributes.Add("readonly", "readonly()");
    }
    //----------------------------------------------------
    //private void BindAllDropDown()
    //{
    //    int day = 1;
    //    while (day <= 31)
    //    {
    //        ddlDay.Items.Add(day.ToString());
    //        day += 1;
    //    }
    //    int Year = 1950;
    //    while (Year <= 2010)
    //    {
    //        ddlYear.Items.Add(Year.ToString());
    //        Year += 1;
    //    }
    //}
    //------------------------------------------------------
    private void BindDropDown()
    {
        ddlCountry.DataSource = country.ShowCountry();
        ddlCountry.DataTextField = "CountryName";
        ddlCountry.DataValueField = "CountryId";
        ddlCountry.DataBind();
        ddlCountry.Items.Insert(0, "Choose One...");

        ddlState.DataSource = state.ShowAllState();
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateId";
        ddlState.DataBind();
        ddlState.Items.Insert(0, "Choose One...");

        chklistInrest.DataSource = intrest.ShowAllIntrest();
        chklistInrest.DataTextField = "Interest";
        chklistInrest.DataValueField = "Id";
        chklistInrest.DataBind();


        ddlIncome.DataSource = income.ShowAllIncome();
        ddlIncome.DataTextField = "Income";
        ddlIncome.DataValueField = "Id";
        ddlIncome.DataBind();
        ddlIncome.Items.Insert(0, "Choose One...");

        ddlIndustry.DataSource = industry.ShowAllIndustry();
        ddlIndustry.DataTextField = "IndustryType";
        ddlIndustry.DataValueField = "Id";
        ddlIndustry.DataBind();
        ddlIndustry.Items.Insert(0, "Choose One...");

        ddlOccupation.DataSource = occupation.ShowAllOccupation();
        ddlOccupation.DataTextField = "Occupation";
        ddlOccupation.DataBind();
        ddlOccupation.Items.Insert(0, "Choose One...");

    }
    //-------------------------------------------------------
    private void BindData()
    {
        user.LoginName = Session["UserName"].ToString();
        DataSet ds = new DataSet();
        ds = user.ShowUserInfo();
        DataRow dr = ds.Tables[0].Rows[0];
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtFName.Text = dr[0].ToString();
            txtLName.Text = dr[1].ToString();
            txtAddress.Text = dr[2].ToString();
            txtCity.Text = dr[3].ToString();
            ListItem li=ddlState.Items.FindByText(dr[4].ToString());
            if (li != null)
            {
                li.Selected = true;
            }
            else
            {
                ddlState.DataSource = state.ShowAllState();
                ddlState.DataTextField = "StateName";
                ddlState.DataValueField = "StateId";
                ddlState.DataBind();
                ddlState.Items.Insert(0, "Choose One...");

            }
           
            txtPinCode.Text = dr[5].ToString();
            ListItem li1 = ddlCountry.Items.FindByText(dr[6].ToString());
            if (li1 != null)
            {
                li1.Selected = true;
            }
            else
            {
                ddlCountry.DataSource = country.ShowCountry();
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataValueField = "CountryId";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, "Choose One...");

            }
            txtMail.Text=dr[7].ToString();
            txtPhone.Text = dr[8].ToString();
            GMDatePicker1.Date = Convert.ToDateTime(dr[9].ToString());
            ListItem li2 = ddlGender.Items.FindByText(dr[10].ToString());
            if (li2 != null)
            {
                li2.Selected = true;
            }
            ListItem li3 = ddlLanguage.Items.FindByText(dr[11].ToString());
            if (li3 != null)
            {
                li3.Selected = true;
            }
                   ListItem li5 = ddlIncome.Items.FindByText(dr[12].ToString());
            if (li5 != null)
            {
                li5.Selected = true;
            }

            ListItem li6 = ddlOccupation.Items.FindByText(dr[13].ToString());
            if (li6 != null)
            {
                li6.Selected = true;
            }
            ListItem li7 = ddlIndustry.Items.FindByText(dr[14].ToString());
            if (li7 != null)
            {
                li7.Selected = true;
            }

            string[] str = dr[15].ToString().Split(',');
            foreach (ListItem li8 in chklistInrest.Items)
            {
                for (int i = 0; i < str.Length; i++)
                { 
                if(str[i]==li8.Text)
                    {
                    li8.Selected=true;
                    }
                }
            
            }

        }
        else
        {
            lblMsg.Text = "No Row Found...!";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration/frmUserHomePage.aspx");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            user.LoginName = Session["UserName"].ToString();
            user.FirstName = txtFName.Text.Trim();
            user.LastName = txtLName.Text.Trim();
            user.Address = txtAddress.Text.Trim();
            user.City = txtCity.Text.Trim();
            user.State = ddlState.SelectedItem.Text;
             user.PinCode = txtPinCode.Text.Trim();
                user.Country = ddlCountry.SelectedItem.Text;
                user.Email = txtMail.Text.Trim();
                user.Phone = txtPhone.Text.Trim();
                user.DOB = GMDatePicker1.Date;
            
                user.Gender = ddlGender.SelectedItem.Text;
                if (ddlLanguage.SelectedIndex == 0)
                    user.Language = "";
                else
            user.Language = ddlLanguage.SelectedItem.Text;
        if (ddlIncome.SelectedIndex == 0)
            user.Income = "";
        else
            user.Income = ddlIncome.SelectedItem.Text;
        if (ddlOccupation.SelectedIndex == 0)
            user.Occupation = "";
        else
            user.Occupation = ddlOccupation.SelectedItem.Text;
        if (ddlIndustry.SelectedIndex == 0)
            user.IndustryType = "";
        else
            user.IndustryType = ddlIndustry.SelectedItem.Text;
                string Intrest = "";
                for (int i = 0; i < chklistInrest.Items.Count; i++)
                {
                    if (chklistInrest.Items[i].Selected == true)
                        Intrest = Intrest + chklistInrest.Items[i].Text + ",";

                }
                Intrest = Intrest.Remove(Intrest.Length - 1, 1);
                user.Interest = Intrest;
                user.UpdateUserProfile();
                lblMsg.Text = "Your Profile Has Updated...!";
            }
          
           
       
        catch (Exception)
        {
            
            throw;
        }
    }
}
