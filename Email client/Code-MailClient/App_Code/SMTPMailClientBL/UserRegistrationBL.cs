using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using SMTPMailClient.DAL;
/// <summary>
/// Summary description for UserRegistrationBL
/// </summary>
public class UserRegistrationBL:Connection
{
    public static DataSet ds;
	public UserRegistrationBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string _LoginName, _Password, _Question, _Answer,_LoginTime,_LogoutTime;
    public string LoginTime
    {
        get { return _LoginTime; }
        set { _LoginTime = value; }
    }
    public string LogoutTime
    {
        get { return _LogoutTime; }
        set { _LogoutTime = value; }
    }
    public string LoginName
    {
        get { return _LoginName; }
        set { _LoginName = value; }
    }
    public string Password
    {
        get { return _Password; }
        set { _Password = value; }
    }
    public string Question
    {
        get { return _Question; }
        set { _Question = value; }
    }
    public string Answer
    {
        get { return _Answer; }
        set { _Answer = value; }
    }
    private string _FirstName, _LastName, _Address, _City, _State, _Trritory, _PinCode, _Country, _Email, _Phone,  _Gender, _Language, _Income, _Occupation,_IndustryType,_Interest;
    public string FirstName
    {
        get { return _FirstName; }
        set { _FirstName = value; }
    }
    public string LastName
    {
        get { return _LastName; }
        set { _LastName = value; }
    }
    public string Address
    {
        get { return _Address; }
        set { _Address = value; }
    }
    public string City
    {        get { return _City; }
        set { _City = value; }
    }
    public string State
    {        get { return _State; }
        set { _State = value; }
    }
    public string Trritory
    {
        get { return _Trritory; }
        set { _Trritory = value; }
    }
    public string PinCode
    {        get { return _PinCode; }
        set { _PinCode = value; }
    }
    public string Country
    {
        get { return _Country; }
        set { _Country = value; }
    }
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string Phone
    {
        get { return _Phone; }
        set { _Phone = value; }
    }
    private DateTime _DOB,_LoginDate,_LogoutDate,_Date;
    public DateTime Date
    {
        get { return _Date; }
        set { _Date = value; }
    }
    public DateTime DOB
    {
        get { return _DOB; }
        set { _DOB = value; }
    }
    public DateTime LoginDate
    {
        get { return _LoginDate; }
        set { _LoginDate = value; }
    }
    public DateTime LogoutDate
    {
        get { return _LogoutDate; }
        set { _LogoutDate = value; }
    }
    public string Gender
    {
        get { return _Gender; }
        set { _Gender = value; }
    }
    public string Language
    {
        get { return _Language; }
        set { _Language = value; }
    }
    public string Income
    {
        get { return _Income; }
        set { _Income = value; }
    }
  
    public string Occupation
    {
        get { return _Occupation; }
        set { _Occupation = value; }
    }
    public string IndustryType
    {
        get { return _IndustryType; }
        set { _IndustryType = value; }
    }
    public string Interest
    {
        get { return _Interest; }
        set { _Interest = value; }
    }
    public void InsertUserLoginInfo()
    { 
        SqlParameter[] p=new SqlParameter[4];
        p[0]=new SqlParameter("@LoginName",this._LoginName);
        p[0].DbType=DbType.String;
        p[1]=new SqlParameter("@Password",this._Password);
        p[1].DbType=DbType.String;
        p[2]=new SqlParameter("@Question",this._Question);
        p[2].DbType=DbType.String;
        p[3]=new SqlParameter("@Answer",this._Answer);
        p[3].DbType=DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_InsertUserLoginInfo", p);
    }
    public void InsertRegistrationInfo()
    {
        SqlParameter[] p = new SqlParameter[18];
        p[0] = new SqlParameter("@LoginId", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@FirstName", this._FirstName);
        p[1].DbType = DbType.String;
        p[2] = new SqlParameter("@LastName", this._LastName);
        p[2].DbType = DbType.String;
        p[3] = new SqlParameter("@Address", this._Address);
        p[3].DbType = DbType.String;
        p[4] = new SqlParameter("@City", this._City);
        p[4].DbType = DbType.String;
        p[5] = new SqlParameter("@State", this._State);
        p[5].DbType = DbType.String;
        p[6] = new SqlParameter("@PinCode", this._PinCode);
        p[6].DbType = DbType.String;
        p[7] = new SqlParameter("@Country", this._Country);
        p[7].DbType = DbType.String;
        p[8] = new SqlParameter("@Email", this._Email);
        p[8].DbType = DbType.String;
        p[9] = new SqlParameter("@Phone", this._Phone);
        p[9].DbType = DbType.String;
        p[10] = new SqlParameter("@DOB", this._DOB);
        p[10].DbType = DbType.Date;
        p[11] = new SqlParameter("@Gender", this._Gender);
        p[11].DbType = DbType.String;
        p[12] = new SqlParameter("@Language", this._Language);
        p[12].DbType = DbType.String;
        p[13] = new SqlParameter("@Income", this._Income);
        p[13].DbType = DbType.String;
        p[14] = new SqlParameter("@Occupation", this._Occupation);
        p[14].DbType = DbType.String;
        p[15] = new SqlParameter("@IndustryType", this._IndustryType);
        p[15].DbType = DbType.String;
        p[16] = new SqlParameter("@Interest", this._Interest);
        p[16].DbType = DbType.String;
        p[17] = new SqlParameter("@Date", this._Date);
        p[17].DbType = DbType.Date;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Insert_RegistrationInfo", p);
    }
    public bool CheckUserAvailability()
    {
        int count;
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        count=int.Parse(SqlHelper.ExecuteScalar(con,CommandType.StoredProcedure,"Sp_CheckUserAvailability",p).ToString());
        if(count>0)
        {
        return true;
        }
        else
	{
            return false;
	}
    }
    public bool CheckUserValidity()
    {  int count;
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Password", this._Password);
        p[1].DbType = DbType.String;
        count = int.Parse(SqlHelper.ExecuteScalar(con, CommandType.StoredProcedure, "Sp_CheckUserValidity", p).ToString());
        if (count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }
    public DataSet ShowUserInfo()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_UserInfo",p);
        return ds;
    }
    public bool CheckPasswordInfo()
    {
        int count;
        SqlParameter[] p = new SqlParameter[3];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Question", this._Question);
        p[1].DbType = DbType.String;
        p[2] = new SqlParameter("@Answer", this._Answer);
        p[2].DbType = DbType.String;
        count = int.Parse(SqlHelper.ExecuteScalar(con, CommandType.StoredProcedure, "Sp_Check_PasswordInfo", p).ToString());
        if (count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public DataSet SelectPassword()
    {
        SqlParameter[] p = new SqlParameter[3];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Question", this._Question);
        p[1].DbType = DbType.String;
        p[2] = new SqlParameter("@Answer", this._Answer);
        p[2].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Select_Password", p);
        return ds;
    }
    public void UpdateNewPassword()
    {
        SqlParameter[] p = new SqlParameter[4];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Password", this._Password);
        p[1].DbType = DbType.String;
        p[2] = new SqlParameter("@Question", this._Question);
        p[2].DbType = DbType.String;
        p[3] = new SqlParameter("@Answer", this._Answer);
        p[3].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_New_Password", p);
    }
    public DataSet SelectName()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Select_Name", p);
        return ds;
    }
    public void UpdatePassword()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Password", this._Password);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Password", p);
    }
    public void UpdateUserProfile()
    {
        SqlParameter[] p = new SqlParameter[17];
        p[0] = new SqlParameter("@LoginId", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@FirstName", this._FirstName);
        p[1].DbType = DbType.String;
        p[2] = new SqlParameter("@LastName", this._LastName);
        p[2].DbType = DbType.String;
        p[3] = new SqlParameter("@Address", this._Address);
        p[3].DbType = DbType.String;
        p[4] = new SqlParameter("@City", this._City);
        p[4].DbType = DbType.String;
        p[5] = new SqlParameter("@State", this._State);
        p[5].DbType = DbType.String;
        p[6] = new SqlParameter("@PinCode", this._PinCode);
        p[6].DbType = DbType.String;
        p[7] = new SqlParameter("@Country", this._Country);
        p[7].DbType = DbType.String;
        p[8] = new SqlParameter("@Email", this._Email);
        p[8].DbType = DbType.String;
        p[9] = new SqlParameter("@Phone", this._Phone);
        p[9].DbType = DbType.String;
        p[10] = new SqlParameter("@DOB", this._DOB);
        p[10].DbType = DbType.Date;
        p[11] = new SqlParameter("@Gender", this._Gender);
        p[11].DbType = DbType.String;
        p[12] = new SqlParameter("@Language", this._Language);
        p[12].DbType = DbType.String;
        p[13] = new SqlParameter("@Income", this._Income);
        p[13].DbType = DbType.String;
        p[14] = new SqlParameter("@Occupation", this._Occupation);
        p[14].DbType = DbType.String;
        p[15] = new SqlParameter("@IndustryType", this._IndustryType);
        p[15].DbType = DbType.String;
        p[16] = new SqlParameter("@Interest", this._Interest);
        p[16].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_UserProfile", p);
    }
    public void InsertUserLogoutHistory()
    {
        SqlParameter[] p = new SqlParameter[3];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@LogoutDate", this._LogoutDate);
        p[1].DbType = DbType.Date;
        p[2] = new SqlParameter("@LogoutTime", this._LogoutTime);
        p[2].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Insert_UserLogoutHistory", p);
    }
    public void InsertUserLoginHistory()
    {
        SqlParameter[] p = new SqlParameter[3];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@LoginDate", this._LoginDate);
        p[1].DbType = DbType.Date;
        p[2] = new SqlParameter("@LoginTime", this._LoginTime);
        p[2].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Insert_UserLoginHistory", p);
    }
}
