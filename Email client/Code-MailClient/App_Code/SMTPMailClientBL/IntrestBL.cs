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
/// Summary description for IntrestBL
/// </summary>
public class IntrestBL:Connection
{
public static DataSet ds;

	public IntrestBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private int _Id;
    private string _Intrest;
    public string Intrest
    {
        get{return _Intrest;}
        set{_Intrest=value;}
    } 
    public int Id
    {
        get{return _Id;}
        set{_Id=value;}
    }
    public void InsertIntrest()
    {

        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Intrest", this._Intrest);
        p[0].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_InsertIntrest", p);

    }
    public DataSet ShowAllIntrest()
    {
        DataSet ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_AllIntrest");
        return ds;
    }
    public void UpdateIntrest()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@Intrest", this._Intrest);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Intrest", p);
    }
    public void DeleteIntrest()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Intrest", p);
    }
    public DataSet ShowIntrestById()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Intrest_ById", p);
        return ds;
    
    }
}
