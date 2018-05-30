
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
public class Teacher_c_student {
     public static void main(String args[], String user,String course) throws SQLException
    {
		final Connection con;
		final Statement st ; 
                String[] student=new String[10];
                
		try
		{
                    String n,p,d;
                int j=0;
		int i=0;
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                con = DriverManager.getConnection("jdbc:odbc:college");
                st = con.createStatement();
                ResultSet results = st.executeQuery("select tid,cid,sid from tcs");
                String[] ColumnNames = {"STUDENT ID","STUDENT NAME"};
                Object[][] Contents = new Object[10][2];
                while(results.next())
                {if(results.getString(1).matches(user))
                {if(results.getString(2).matches(course))
                {               student[i]=results.getString(3);
                                 Contents[j][0]= student[i];
                                 
                                 //Contents[j][1] = results.getString(2);
                                  //Contents[j][2] = results.getString(3);
                                  //Contents[j][3]= results.getString(4);
                                  //Contents[j][4] = results.getString(5);
             i++;                            
	     j++;
                }
                }
                }
                System.out.println(i+"  "+j);
                int k=i;
                j=0;
                for(i=0;i<k;i++)
                {
                System.out.println(student[i]+" ");
                
                }
                 
                for(i=0;i<k;i++)
                {
                   ResultSet res = st.executeQuery("select sid,sname from sdetails");
                while(res.next())
               {
                
                String s=""+res.getString(1);
                String x=""+res.getString(2);
                if(student[i].matches(s)==true)
                {
                 Contents[j][1]=x;
                 System.out.println(student[i]+" "+Contents[j][1] );
                 //Contents[j][1]=x;
                //i++;
                j++;
                }
                
                
                }
                }
                //
                Tcstudent obj = new Tcstudent(Contents, ColumnNames,user);
                obj.setVisible(true);

                
                }catch(   SQLException | ClassNotFoundException e)
	{
            
	System.out.println(e.toString());
	}
               
    
    }
    
    
}
