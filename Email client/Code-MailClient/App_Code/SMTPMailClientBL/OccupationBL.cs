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
/// Summary description for OccupationBL
/// </summary>
public class OccupationBL:Connection
{
    public static DataSet ds;
	public OccupationBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private int _Id;
    private string _Occupation;
    public string Occupation
    {
        get { return _Occupation; }
        set { _Occupation = value; }
    }
    public int Id
    {
        get { return _Id; }
        set { _Id = value; }
    }
    public void InsertOccupation()
    {

        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Occupation", this._Occupation);
        p[0].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Insert_Occupation", p);

    }
    public DataSet ShowAllOccupation()
    {
        DataSet ds = new DataSet();
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_AllOccupation");
        return ds;
    }
    public void UpdateOccupation()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@Occupation", this._Occupation);
        p[1].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Occupation", p);
    }
    public void DeleteOccupation()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Occupation", p);
    }
    public DataSet ShowOccupationById()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Occupation_ById", p);
        return ds;

    }
}
