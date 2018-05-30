
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 */
public class Patient_doctor {
    public static void main(String[] args,String user)
    {
        try {
            Connection con;
            Statement st ; 
            String u;
            String doctorid="";
           Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                   con = DriverManager.getConnection("jdbc:odbc:college");
                   st = con.createStatement();
                   System.out.println("Connection established");
                ResultSet results = st.executeQuery("Select pid,did from dp");
                while(results.next())
                {u=results.getString(1);
                   if(user.matches(u)==true)
                   {System.out.println("user matched");
                      // System.out.println("user vierified");
                   doctorid=results.getString(2);
                   System.out.println(doctorid);
                   }
                }
                
                
                ResultSet res=st.executeQuery("select * from ddetails");
                while(res.next())
                {
                if(doctorid.matches(res.getString(1)))
                {
                    String[] arg=new String[] {""};
                Pdoctor.main(arg,user,doctorid,res.getString(2),res.getString(7),res.getString(9));
                }
                
                }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Student_detail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Student_detail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
