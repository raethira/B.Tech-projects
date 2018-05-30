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
/// Summary description for UserAppointmentBL
/// </summary>
public class UserAppointmentBL:Connection
{
    public static DataSet ds;
	public UserAppointmentBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string _LoginName, _Appointment, _AppointmentTime;
    private DateTime _DateOfAppointment;
    public string LoginName
    {
        get { return _LoginName; }
        set { _LoginName = value; }
    }
    public string Appointment
    {
        get { return _Appointment; }
        set { _Appointment = value; }
    }
    public string AppointmentTime
    {
        get { return _AppointmentTime; }
        set { _AppointmentTime = value; }
    }
    public DateTime DateOfAppointment
    {
        get { return _DateOfAppointment; }
        set { _DateOfAppointment = value; }
    }
    private int _Month;
    public int Month
    {
        get { return _Month; }
        set { _Month = value; }
    }
    private int _Id;
    public int Id
    {
        get { return _Id; }
        set { _Id = value; }
    }
    public void InserUserAppointment()
    {
        SqlParameter[] p = new SqlParameter[4];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        p[1] = new SqlParameter("@DateOfAppointment", this._DateOfAppointment);
        p[1].DbType = DbType.Date;
        p[2] = new SqlParameter("@Appointment", this._Appointment);
        p[2].DbType = DbType.String;
        p[3] = new SqlParameter("@AppointmentTime", this._AppointmentTime);
        p[3].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Inser_UserAppointment", p);
    }

    public DataSet ShowMonth()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_AppointmentDate", p);
        return ds;
    }
    public DataSet ShowAppointmentByDate()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[2];
        p[1] = new SqlParameter("@DateOfAppointment", this._DateOfAppointment);
        p[1].DbType = DbType.String;
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_AppointmentByDate", p);
        return ds;
    }

    public DataSet ShowAppointmentById()
    {
        ds = new DataSet();
        SqlParameter[] p = new SqlParameter[2];
        p[1] = new SqlParameter("@Id", this._Id);
        p[1].DbType = DbType.Int16;
        p[0] = new SqlParameter("@LoginName", this._LoginName);
        p[0].DbType = DbType.String;
        ds = SqlHelper.ExecuteDataset(con, CommandType.StoredProcedure, "Sp_Show_Appointment_ById", p);
        return ds;
    }
    public void UpdateAppointment()
    {
        SqlParameter[] p = new SqlParameter[5];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@LoginName", this._LoginName);
        p[1].DbType = DbType.String;
        p[2] = new SqlParameter("@DateOfAppointment", this._DateOfAppointment);
        p[2].DbType = DbType.Date;
        p[3] = new SqlParameter("@Appointment", this._Appointment);
        p[3].DbType = DbType.String;
        p[4] = new SqlParameter("@AppointmentTime", this._AppointmentTime);
        p[4].DbType = DbType.String;
        SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Update_Appointment", p);
    }

    public void DeleteAppointment()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Id", this._Id);
        p[0].DbType = DbType.Int16;
        p[1] = new SqlParameter("@LoginName", this._LoginName);
        p[1].DbType = DbType.String;
       SqlHelper.ExecuteNonQuery(con, CommandType.StoredProcedure, "Sp_Delete_Appointment", p);
    }

}
