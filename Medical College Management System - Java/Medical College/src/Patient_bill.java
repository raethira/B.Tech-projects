
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
public class Patient_bill {
    public static void main(String[] args,String user)
    {
        try {
            Connection con;
            Statement st ; 
            String u;
            String billno="";
           Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                   con = DriverManager.getConnection("jdbc:odbc:college");
                   st = con.createStatement();
                   System.out.println("Connection established");
                ResultSet results = st.executeQuery("Select pid,pno from pbill");
                while(results.next())
                {u=results.getString(1);
                   if(user.matches(u)==true)
                   {System.out.println("user matched");
                      // System.out.println("user vierified");
                   billno=results.getString(2);
                   System.out.println(billno);
                   }
                }
                
                
                ResultSet res=st.executeQuery("select * from bill");
                while(res.next())
                {
                if(billno.matches(res.getString(1)))
                {
                    String[] arg=new String[] {""};
                Patientbill.main(arg,user,billno,res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getString(6));
                }
                
                }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Student_detail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Student_detail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
