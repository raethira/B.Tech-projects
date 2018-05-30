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
/// Summary description for UserFeedbackBL
/// </summary>
public class UserFeedbackBL:Connection
{
    public static DataSet ds;
	public UserFeedbackBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string _From, _Subject, _Feedback, _Size, _To, _Attachement;
   
   public string From
    {
        get { return _From; }
        set { _From = value; }
    }
    public string Subject
    {
        get { return _Subject; }
        set { _Subject = value; }
    }
    public string Feedback
    {
        get { return _Feedback; }
        set { _Feedback = value; }
    }
    public string Size
    {
        get { return _Size; }
        set { _Size = value; }
    }
    public string To
    {
        get { return _To; }
        set { _To = value; }
    }

    private DateTime _Date;
    public DateTime Date
    {
        get { return _Date; }
        set { _Date = value; }
    }

    public string Attachement
    {
        get { return _Attachement; }
        set { _Attachement = value; }
    }
    private int _Id;
    public int Id
    {
        get { return _Id; }
        set { _Id = value; }
    }
    public void InsertFeedback()
    {
        SqlParameter[] p = new SqlParameter[7];
        p[0] = new SqlParameter("@From", this._From);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@To", this._To);
        p[1].DbType = DbType.String;
        p[2] = new SqlParameter("@Subject", this._Subject);
        p[2].DbType = DbType.String;
        p[3] = new SqlParameter("@Feedback", this._Feedback);
        p[3].DbType = DbType.String;
        p[4] = new SqlParameter("@Date", this._Date);
        p[4].DbType = DbType.Date;
        p[5] = new SqlParameter("@Attachement", this._Attachement);
        p[5].DbType = DbType.String;
        p[6] = new SqlParameter("@Size", this._Size);
        p[6].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_InsertFeedback", p);
    }
    public int SetNewFeedbackCount(int count)
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@To", this._To);
        p[0].DbType = DbType.String;
        count = int.Parse(SqlHelper.ExecuteScalar(con, CommandType.StoredProcedure, "Sp_Set_New_FeedbackCount", p).ToString());
        return count;

    }
    public DataSet ShowAllUserFeedback()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@To", this._To);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_UserFeedback_Inbox", p);
        return ds;
    }
    public void UpdateFeedbackReadingStatus()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@To", this._To);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Feedback_ReadingStatus", p);
    }
    public DataSet ShowUserFullFeedback()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@To", this._To);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Id", this._Id);
        p[1].DbType = DbType.Int16;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_UserFullFeedback", p);
        return ds;
    }
    public void DeleteFeedback()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Feedback", p);
    }
}
