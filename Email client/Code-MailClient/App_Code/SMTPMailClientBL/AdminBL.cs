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
/// Summary description for AdminBL
/// </summary>
public class AdminBL:Connection
{
    public static DataSet ds;
	public AdminBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string _LoginName,_LoginTime,_LogoutTime,_Password;
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
   private DateTime _LoginDate,_LogoutDate,_Date,_Date1;
   
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
    public DateTime Date
    {
        get { return _Date; }
        set { _Date = value; }
    }
    public DateTime Date1
    {
        get { return _Date1; }
        set { _Date1 = value; }
    }
      public string Password
    {
        get { return _Password; }
        set { _Password = value; }
    }
    public DataSet ViewAllUserToAdmin()
    {
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_View_AllUserToAdmin");
        return ds;
    }
    public void DeleteUserLogin()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_UserLogin", p);
    }

    public DataSet ShowUserLoginHistory()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Date", this._Date);
        p[0].DbType = DbType.Date;
        p[1] = new SqlParameter("@Date1", this._Date1);
        p[1].DbType = DbType.Date;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_UserLoginHistory",p);
        return ds;
    }
    public DataSet ShowUserLogoutHistory()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Date", this._Date);
        p[0].DbType = DbType.Date;
        p[1] = new SqlParameter("@Date1", this._Date1);
        p[1].DbType = DbType.Date;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_UserLogoutHistory",p);
        return ds;
    }
    public DataSet ShowUserByDate()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Date", this._Date);
        p[0].DbType = DbType.Date;
        p[1] = new SqlParameter("@Date1", this._Date1);
        p[1].DbType = DbType.Date;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_User_ByDate", p);
        return ds;
    }
    public bool CheckAdminValidity()
    {
        int count;
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Password", this._Password);
        p[1].DbType = DbType.String;
        count = int.Parse(SqlHelper.ExecuteScalar(con, CommandType.StoredProcedure, "Sp_CheckAdminValidity", p).ToString());
        if (count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    public void ChengeAdminPassword()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Password", this._Password);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Chenge_AdminPassword", p);
    }
}
