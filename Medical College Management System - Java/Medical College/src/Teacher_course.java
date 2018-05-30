
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 */
public class Teacher_course {
    public static void main(String args[], String user) throws SQLException
    {
		final Connection con;
		final Statement st ; 
                //String[] name=new String[10];
                //String[] phonenum=new String[10];
                //String[] disease=new String[10];
		try
		{
                    String n,p,d;
                int j=0;
		int i=0;
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                con = DriverManager.getConnection("jdbc:odbc:college");
                st = con.createStatement();
                ResultSet results = st.executeQuery("select tid,cid from takes");
                String[] ColumnNames = {"COURSE ID"};
                Object[][] Contents = new Object[10][1];
      
                while(results.next())
                {if(results.getString(1).matches(user))
                {
                                 Contents[j][0]= results.getString(2);
                                  //Contents[j][1] = results.getString(2);
                                  //Contents[j][2] = results.getString(3);
                                  //Contents[j][3]= results.getString(4);
                                  //Contents[j][4] = results.getString(5);
                                         
	     j++;
                }
                }
                Teachertakes obj = new Teachertakes(Contents, ColumnNames,user);
                obj.setVisible(true);

                
                }catch(   SQLException | ClassNotFoundException e)
	{
            
	System.out.println(e.toString());
	}
               
    
    }
    
}
