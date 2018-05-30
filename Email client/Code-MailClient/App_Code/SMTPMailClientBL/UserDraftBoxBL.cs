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
/// Summary description for UserDraftBoxBL
/// </summary>
public class UserDraftBoxBL:Connection
{
    public static DataSet ds;
	public UserDraftBoxBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string _LoginName, _From, _Subject, _FullMessage, _Size, _To, _Attachement, _SendStatus;
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
    public void InsertInDraftItem()
    {
        SqlParameter[] p = new SqlParameter[8];
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
        //p[8] = new SqlParameter("@SendStatus", this._SendStatus);
        //p[8].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Insert_In_DraftItem", p);
    }
    public DataSet ShowAllDraftItem()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_All_DraftItem", p);
        return ds;
    }
    public void DeleteMailFromDraft()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@From", this._From);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Mail_FromDraft", p);
    }
    public DataSet ShowDraftItemById()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.String;
        ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_DraftItem_ById", p);
        return ds;
    }
    public void UpdateDraftItemStatus()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@LoginName", this._LoginName);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_DraftItem_Status", p);
    }
}
