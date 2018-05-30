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
/// Summary description for IncomeBL
/// </summary>
public class IncomeBL:Connection
{
    public static DataSet ds;
	public IncomeBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private int _Id;
    private string _Income;
    public string Income
    {
        get { return _Income; }
        set { _Income = value; }
    }
    public int Id
    {
        get { return _Id; }
        set { _Id = value; }
    }
    public void InsertIncome()
    {

        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Income", this._Income);
        p[0].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Insert_Income", p);

    }
    public DataSet ShowAllIncome()
    {
        DataSet ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_AllIncome");
        return ds;
    }
    public void UpdateIncome()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@Income", this._Income);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Income", p);
    }
    public void DeleteIncome()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Income", p);
    }
    public DataSet ShowIncomeById()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Income_ById", p);
        return ds;

    }
}
