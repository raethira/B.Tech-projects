
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
public class Teacher_detail {
     public static void main(String[] args,String user,String pass)
    {
        
         try {
             Connection con;
             Statement st ; 
            
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    con = DriverManager.getConnection("jdbc:odbc:college");
                    st = con.createStatement();
                 ResultSet results = st.executeQuery("Select * from tdetails");
                 //String a=""+results.getString(1);
             //    System.out.println(results.getString(1));
                 System.out.println("connection establised...");
                 while(results.next())
                     
                 {System.out.println("connection establised...");
                 String u=""+results.getString(1);
                 String p=""+results.getString(5);
                    if(user.matches(u))
                    {
                        System.out.println("user vierified");
                    if(pass.matches(p))
                    {
                        
                    System.out.println("pass verified");
                    
                    String[] arg=new String[] {"123"};
                    //System.out.println(results.getString(2));
                    Teacherdisplay.main(arg,u,results.getString(2),results.getString(3),results.getString(4),p,results.getString(6),results.getString(7),results.getString(8));
                    
                    }
                    }
                 }
         } catch (ClassNotFoundException ex) {
             Logger.getLogger(Teacher_detail.class.getName()).log(Level.SEVERE, null, ex);
         } catch (SQLException ex) {
             Logger.getLogger(Teacher_detail.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    
}
