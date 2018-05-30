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
/// Summary description for IndustryBL
/// </summary>
public class IndustryBL:Connection
{
    public static DataSet ds;

	public IndustryBL()
	{
		//
		// TODO: Add constructor logic here
		//
    } private int _Id;
    private string _Industry;
    public string Industry
    {
        get { return _Industry; }
        set { _Industry = value; }
    }
    public int Id
    {
        get { return _Id; }
        set { _Id = value; }
    }
    public void InsertIndustry()
    {

        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Industry", this._Industry);
        p[0].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Insert_Industry", p);

    }
    public DataSet ShowAllIndustry()
    {
        DataSet ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_AllIndustry");
        return ds;
    }
    public void UpdateIndustry()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@Industry", this._Industry);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Industry", p);
    }
    public void DeleteIndustry()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Industry", p);
    }
    public DataSet ShowIndustryById()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Industry_ById", p);
        return ds;

    }
}
