
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
public class Doctor_patient {
    public static void main(String args[],String user)
    {		final Connection con;
		final Statement st ; 
                String[] patient=new String[10];
                
		try
		{
                    String n,d;
                int j=0;
		int i=0;
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                con = DriverManager.getConnection("jdbc:odbc:college","","");
                st = con.createStatement();
                ResultSet results = st.executeQuery("select did,pid from dp");
                String[] ColumnNames = {"PATIENT ID","PATIENT NAME","GENDER","CITY","OCCUPATION","PHONE NO","PROBLEM"};
                Object[][] Contents = new Object[10][7];
                while(results.next())
                {if(results.getString(1).matches(user))
                {       patient[i]=results.getString(2);
                                 Contents[j][0]= patient[i];
                                 
                                 //Contents[j][1] = results.getString(2);
                                  //Contents[j][2] = results.getString(3);
                                  //Contents[j][3]= results.getString(4);
                                  //Contents[j][4] = results.getString(5);
             i++;                            
	     j++;
                
                }
                }
                System.out.println(i+"  "+j);
                int k=i;
                j=0;
                for(i=0;i<k;i++)
                {
                System.out.println(patient[i]+" ");
                
                }
                 
                for(i=0;i<k;i++)
                {
                   ResultSet res = st.executeQuery("select pid,pname,gender,city,occp,phno,problems from ptdetails");
                while(res.next())
               {
                String s,p,q,r,t,u,v;
                System.out.println(s=res.getString(1));
                System.out.println( p=res.getString(2));
                System.out.println( q=res.getString(3));
                System.out.println( r=res.getString(4));
                System.out.println( t=res.getString(5));
                System.out.println( u=res.getString(6));
                System.out.println( v=res.getString(7));
                
                if(patient[i].matches(s)==true)
                {
                 Contents[j][1]=p;
                 Contents[j][2]=q;
                 Contents[j][3]=r;
                 Contents[j][4]=t;
                 Contents[j][5]=u;
                 Contents[j][6]=v;
                 //Contents[j][7]=p;
                 System.out.println(patient[i]+" "+Contents[j][1] );
                 
                 //Contents[j][1]=x;
                //i++;
                j++;
                }
                
                
                }
                }
                //
                Dpatient obj = new Dpatient(Contents, ColumnNames,user);
                obj.setVisible(true);

                
                }catch(   SQLException | ClassNotFoundException e)
	{
            
	System.out.println(e.toString());
	}
               
    }
    
}
