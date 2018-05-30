
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
public class Student_detail {
    public static void main(String[] args,String user,String pass)
    {
        try {
            Connection con;
            Statement st ; 
           
           Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                   con = DriverManager.getConnection("jdbc:odbc:college");
                   st = con.createStatement();
                ResultSet results = st.executeQuery("Select * from sdetails");
                while(results.next())
                {String u=""+results.getString(1);
                 String p=""+results.getString(5);
                   if(user.matches(u))
                   {
                       System.out.println("user vierified");
                   if(pass.matches(p))
                   {
                   System.out.println("pass verified");
                   String[] arg=new String[] {""};
                   Studentdisplay.main(arg,u,results.getString(2),results.getString(3),results.getString(4),p,results.getString(6),results.getString(7),results.getString(8));
                   
                   }
                   }
                }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Student_detail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Student_detail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
