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
/// Summary description for UserInboxBL
/// </summary>
public class UserInboxBL:Connection
{
    public static DataSet ds;
	public UserInboxBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private string _LoginName, _From, _Subject, _FullMessage, _Size, _To, _Attachement,_SendStatus;
    public string SendStatus
    {
        get { return _SendStatus; }
        set { _SendStatus = value; }
    }
    public string LoginName
    {
        get { return _LoginName; }
        set { _LoginName = value; }
    }
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
    public string FullMessage
    {
        get { return _FullMessage; }
        set { _FullMessage = value; }
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
    public void InsertInUserInbox()
    {
        SqlParameter[] p = new SqlParameter[9];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@From", this._From);
        p[1].DbType = DbType.String;
        p[2] = new SqlParameter("@To", this._To);
        p[2].DbType = DbType.String;
        p[3] = new SqlParameter("@Subject", this._Subject);
        p[3].DbType = DbType.String;
        p[4] = new SqlParameter("@FullMessage", this._FullMessage);
        p[4].DbType = DbType.String;
        p[5] = new SqlParameter("@Date", this._Date);
        p[5].DbType = DbType.Date;
        p[6] = new SqlParameter("@Attachement", this._Attachement);
        p[6].DbType = DbType.String;
        p[7] = new SqlParameter("@Size", this._Size);
        p[7].DbType = DbType.String;
        p[8] = new SqlParameter("@SendStatus", this._SendStatus);
        p[8].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Insert_In_UserInbox", p);
    }
    public DataSet ShowAllMailInbox()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@To", this._To);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_UserMail_Inbox", p);
        return ds;
    }

    public DataSet ShowUserFullMessage()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@To", this._To);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@Id", this._Id);
        p[1].DbType = DbType.Int16;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_UserFullMessage", p);
        return ds;
    }

    public int SetNewMailCount(int count)
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@To", this._To);
        p[0].DbType = DbType.String;
        count=int.Parse(SqlHelper.ExecuteScalar(con, CommandType.StoredProcedure, "Sp_Set_New_MailCount", p).ToString());
        return count;
       
    }

    public void UpdateMailReadingStatus()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@To", this._To);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Mail_ReadingStatus", p);
    }
    public void UpdateMailSaveStatus()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@To", this._To);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_MailSaveStatus", p);
    }
    public void UpdateDraftStatus()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@To", this._To);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Draft_Status", p);
    }
    public void DeleteMailFromInbox()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@To", this._To);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Mail_FromInbox", p);
    }
    public DataSet ShowMessgaeInfoForReply()
    {
        SqlParameter[] p = new SqlParameter[1];
        //p[0] = new SqlParameter("@To", this._To);
        //p[0].DbType = DbType.String;
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_MessgaeInfo_For_Reply", p);
        return ds;
    }
    public DataSet ShowAllDeletedMail()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@To", this._To);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_All_DeletedMail", p);
        return ds;
    }
    public void RestoreMailToInbox()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@To", this._To);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Restore_Mail_ToInbox", p);
    }
    public void DeleteMailPermanently()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@To", this._To);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Mail_Permanently", p);
    }
    public DataSet ShowAllSentMail()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@From", this._From);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_All_SentMail", p);
        return ds;
    }
    public void DeleteMailFromSentItem()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@From", this._From);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Mail_FromSentItem", p);
    }
    public DataSet ShowAllDeletedMailFromSent()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_All_DeletedMailFromSent", p);
        return ds;
    }
    public DataSet ShowSavedItems()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@To", this._To);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Saved_Items", p);
        return ds;
    }
 }

