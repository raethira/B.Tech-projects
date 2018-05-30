/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package varun;

import java.io.*;

/**
 *
 * @author DELL
 */
public class Sudoku 
{
    public static class sudoku
    {
        int data;
        sudoku link;
    }
    
    
    public static class pair   
    {
        int count;
        int[] position=new int[9];
    }

    
    public static int elementCount;
    public static sudoku[][] head=new sudoku[9][9];
    public static sudoku temp;
    public static String str;
    
    
    
     
    public static void create3D(sudoku base)
    {
        int i;
        for(i=1;i<=9;i++)
        {
            temp=new sudoku();
            temp.link=null;
            temp.data=i;
            base.link=temp;
            base=temp;
        }
    }
    
    
    
    public static void in()
    {
        int i,j;
        for(i=0;i<9;i++)
            for(j=0;j<9;j++)
                head[i][j]=new sudoku();
    }
    
    
    
    public static void deleteFromRow(int row, int element)  
    {
        int i;
        sudoku curr,prev;
        for(i=0;i<9;i++)
            if(head[row][i].data==0) 
            {
                curr=head[row][i]; 
                prev=curr;
                while(curr!=null) 
                {
                    if (curr.data==element) 
                    {
                        prev.link=curr.link;
                        break;
                    }
                    else
                    {
                        prev=curr;
                        curr=curr.link;
                    }
                }
            }   
    }

    
    
    public static void deleteFromColumn(int column, int element)  
    {
        int j;
        sudoku curr,prev;
        for(j=0;j<9;j++) 
            if(head[j][column].data==0)
            {
                curr=head[j][column];
                prev=curr;
                while(curr!=null)
                {
                    if (curr.data == element)
                    {
                        prev.link=curr.link;
                        break;
                    }
                    else
                    {
                        prev=curr;
                        curr=curr.link;
                    }
                }
            }
    }
    

    public static void deleteFromBox(int row, int column, int element) 
    {
        int box,i,j,k,l,boxRow,boxColumn;
        sudoku curr,prev;
        box=findBox(row, column);
        boxRow=(box/3); 
        if(box%3==0)
            boxRow--;
        boxColumn=(box%3);
        if(boxColumn==0)
            boxColumn=3;
        boxColumn--;

        for(i=(boxRow)*3,j=0; j<3; i++,j++)
        {
            for(k=(boxColumn)*3,l=0; l<3; k++,l++)
            {
                if(head[i][k].data==0) 
                {
                    curr=head[i][k];
                    prev=curr;
                    while(curr!=null)
                    {
                        if (curr.data==element)
                         {
                             prev.link=curr.link;
                             break;
                         }
                         else
                         {
                             prev=curr;
                             curr=curr.link;
                         }
                    }
                }
            }
        }
    }
    

    public static int findBox(int row, int column)	
    {
         int boxRow, boxColumn; 
         boxRow=(row+1)/3;
         boxColumn=(column+1)/3;

         if ((row+1)%3!=0)
             boxRow++;

         if ((column+1)%3!=0)
             boxColumn++;
         
         return (3*(boxRow-1)+boxColumn);
    }
    

    public static void deleteElement(int row, int column) 
    {
        int element;
        element=head[row][column].data; 
        deleteFromRow(row,element);
        deleteFromColumn(column,element);
        deleteFromBox(row,column,element);
    }


    public static void del_elem()
    {
        int i,j;
        for(i=0;i<9;i++)
        {
            for(j=0;j<9;j++)
                if(head[i][j].data!=0)		
                {
                    elementCount++;  	
                    deleteElement(i,j);
                }
        }
         
    }

    public static void find_Singles()
    {
         int i,j,k,col;
         int[][] count=new int[2][10];
         sudoku current,prev;
         
         for(k=0;k<9;k++)       
         {
            for(i=0;i<2;i++)
               for(j=0;j<10;j++)
                   count[i][j]=0;

            for(j=0;j<9;j++)					
            {
                if(head[k][j].data==0)			
                {	
                    prev=head[k][j].link;
                    if(prev.link==null)		
                    {		
                        head[k][j].data=prev.data; 
                        head[k][j].link=null;
                        elementCount++;
                        deleteElement(k,j);
                    }
                }
            }


            for(j=0;j<9;j++)					
            {
                if(head[k][j].data==0)			
                {
                    current=head[k][j].link;
                    while(current!=null)		 	
                    {
                        count[0][current.data]++;
                        count[1][current.data]=j;
                        current=current.link;
                    }
                }
            }


            for(j=1;j<=9;j++)                   
            {
                if(count[0][j]==1)	
                {
                    col=count[1][j];		
                    head[k][col].data=j;	
                    current=head[k][col].link;	
                    while(current!=null)
                    {
                        temp=current;
                        current=current.link;
                    }
                    head[k][col].link=null;	
                    elementCount++;
                    deleteElement(k,col);
                }
            }
         }
    }

         



    public static void findHiddenPairs(int number, int RCB)
    {
        sudoku curr=null,var=null;
        pair[] element=new pair[9];
        int[] pos=new int[9];
        int flag=0,i,j,k=0,l,m,boxRow=0,boxColumn=0,box=0;
        
        for(i=0;i<9;i++)
            for(j=0;j<9;j++)
            {
                element[i]=new pair();
                element[i].count=0;
                element[i].position[j]=0;
            }

        if(RCB==3)
        {
            box=number;
            boxRow=(box%3)*3;
            boxColumn=(box/3)*3;
        }

        for(i=0;i<9;i++)
        {	
            if (RCB==1)					
                curr=head[number][i];
            if (RCB==2)					
                curr=head[i][number];
            if(RCB==3)					
                curr=head[boxRow+(i%3)][boxColumn+(i/3)];
                               	
            if(curr.data==0) 
            {
                curr=curr.link;
                while(curr!=null)
                {
                    element[curr.data-1].count++;
                    element[curr.data-1].position[i]=1;
                    curr=curr.link;
                }
                
            }
        }
        
        
        for(i=0;i<9;i++)
            if(element[i].count>=2)
                k=k+1;
        	

        if(k>=2)
        {
            for(j=0;j<8;j++)
                for(l=j+1;l<9;l++)
                {
                    flag=0;
                    for(i=0;i<9;i++)
                        if(j!=l && element[j].position[i]==element[l].position[i] && element[l].position[i]==1 )
                        {
                            pos[flag]=i;
                            flag++;
                        }
                    
                
                    if (flag==2)
                    {
                        for(m=0;m<2;m++)
                        {
                            i=pos[m];
                            if(RCB==1)
                                curr=head[number][i];
                            if(RCB==2)
                                curr=head[i][number];
                            if(RCB==3)
                                curr=head[boxRow+(i%3)][boxColumn+(i/3)];
                                 
                            var=curr.link;
                            while(curr.link!=null)
                            {
                                if(curr.link.data!=(j+1) && curr.link.data!=(l+1))
                                    var=curr.link;
                                curr=curr.link;
                                var=var.link;
                            }
                            
                        }
                    }
                }
        }
    }


    
    
    public static void find_Hidden_pair()
    {
        for(int row=0;row<9;row++)
            {
                findHiddenPairs(row,1);     
                findHiddenPairs(row,2);	
                findHiddenPairs(row,3);	
            }
    }
    
    
    
    public static void findHiddentriplets(int number, int RCB)
    {
        sudoku curr=null,var=null;
        pair[] element=new pair[9];
        int flag=0,i,j,k=0,l,m,m1,boxRow=0,boxColumn=0,box=0;
        int[] pos=new int[9];
        
        for(i=0;i<9;i++)
            for(j=0;j<9;j++)
            {
                element[i]=new pair();
                element[i].count=0;
                element[i].position[j]=0;
            }

        if(RCB==3)
        {
            box=number;
            boxRow=(box%3)*3;
            boxColumn=(box/3)*3;
        }

        for(i=0;i<9;i++)
        {	
            if (RCB==1)					
                curr=head[number][i];
            if (RCB==2)					
                curr=head[i][number];
            if(RCB==3)					
                curr=head[boxRow+(i%3)][boxColumn+(i/3)];
                               	
            if(curr.data==0) 
            {
                curr=curr.link;
                while(curr!=null)
                {
                    element[curr.data-1].count++;
                    element[curr.data-1].position[i]=1;
                    curr=curr.link;
                }
                
            }
        }
        
        
        for(i=0;i<9;i++)
            if(element[i].count>=3)
                k=k+1;
        	

        if(k>=3)
        {
            
            for(m=0;m<7;m++)
            for(j=m+1;j<8;j++)
                for(l=j+1;l<9;l++)
                {
                    //System.out.println("infinte");
                    flag=0;
                    for(i=0;i<9;i++)
                        if(m!=j && m!=l && l!=j && element[j].position[i]==element[l].position[i] 
                                && element[j].position[i]==element[m].position[i]
                                && element[l].position[i]==1 )
                        {
                            pos[flag]=i;
                            flag++;
                        }
                    
                    
                    if (flag==3)
                    {
                        for(m1=0;m1<3;m1++)
                        {
                            	i=pos[m1];
                                if(RCB==1)
                                    curr=head[number][i];
                                if(RCB==2)
                                    curr=head[i][number];
                                if(RCB==3)
                                    curr=head[boxRow+(i%3)][boxColumn+(i/3)];
                                    
                               
                                var=curr.link;
                                while(curr.link!=null)
                                {
                                    if(curr.link.data!=(j+1) && curr.link.data!=(l+1) && curr.link.data!=(m+1))
                                        var=curr.link;
                                    curr=curr.link;
                                    var=var.link;
                                }
                        }
                        
                    }
                }
        }
    }


    
    
    
    public static void find_Hidden_Triplet()
    {
        for(int row=0;row<9;row++)
            {
                findHiddentriplets(row,1);     
                findHiddentriplets(row,2);	
                findHiddentriplets(row,3);	
            }
    }
    
    
    
        

    public static void find_pairs_in_row(int row)
    {
        int j,i,l,k=-1;
        int[] pairs=new int [10];
        for(j=0;j<9;j++)	
            if(head[row][j].link!=null)
                if(head[row][j].link.link!=null)
                    if(head[row][j].link.link.link==null)
                        pairs[++k]=j;
                        
        for(i=k;i>0;i--)	
        {
            l=1;
            while(i-l>=0)
            {
                if(head[row][pairs[i]].link.data==head[row][pairs[i-l]].link.data)
                {
                    if(head[row][pairs[i]].link.link.data==head[row][pairs[i-l]].link.link.data)			
                    {
                        head[row][pairs[i]].data=head[row][pairs[i]].link.data;
                        head[row][pairs[i-l]].data=head[row][pairs[i-l]].link.link.data;
                        
                        deleteFromRow(row,head[row][pairs[i]].data);
                        deleteFromRow(row,head[row][pairs[i-l]].data);

                        head[row][pairs[i]].data=0;
                        head[row][pairs[i-l]].data=0;
                    }
                }
                l++;
            }
        }
    }





    public static void find_pairs_in_col(int col)         
    {
        int j,i,l,k=-1;
        int[] pairs=new int [10];
        for(j=0;j<9;j++)               
            if(head[j][col].link!=null)
                if(head[j][col].link.link!=null)
                {
                    if(head[j][col].link.link.link==null)
                    pairs[++k]=j;      
                }
        

        for(i=k;i>0;i--)     
        {
            l=1;
            while(i-l>=0)
            {
                if(head[pairs[i]][col].link.data==head[pairs[i-l]][col].link.data)
                {
                    if(head[pairs[i]][col].link.link.data==head[pairs[i-l]][col].link.link.data)
                    {
                        
                        head[pairs[i]][col].data=head[pairs[i]][col].link.data;
                        head[pairs[i-l]][col].data=head[pairs[i-l]][col].link.link.data;

                       
                        deleteFromColumn(col,head[pairs[i]][col].data);
                        deleteFromColumn(col,head[pairs[i-l]][col].data);

                        head[pairs[i]][col].data=0;
                        head[pairs[i-l]][col].data=0;
                    }
                }

                l++;
            }
        }

    }


      
    public static void find_pairs_in_box(int boxRow,int boxColumn)
    {
        int j,i,k,l,count=-1;
        int[][] pairs=new int [10][2];     
        for(i=(boxRow)*3,j=0; j<3; i++,j++)
            for(k=(boxColumn)*3,l=0; l<3; k++,l++)
                if(head[i][k].link!=null)
                    if(head[i][k].link.link!=null)
                        if(head[i][k].link.link.link==null)
                        {
                            pairs[++count][0]=i;
                            pairs[count][1]=k;
                        }			
                       
        for(i=count;i>0;i--)     
        {
            l=1;
            while((i-l)>=0)     
            {
                if(head[pairs[i][0]][pairs[i][1]].link.data==head[pairs[i-l][0]][pairs[i-l][1]].link.data)
                {
                    if(head[pairs[i][0]][pairs[i][1]].link.link.data==head[pairs[i-l][0]][pairs[i-l][1]].link.link.data)
                    {
                        
                        head[pairs[i][0]][pairs[i][1]].data=head[pairs[i][0]][pairs[i][1]].link.data;      
                        head[pairs[i-l][0]][pairs[i-l][1]].data=head[pairs[i-l][0]][pairs[i-l][1]].link.data;                                           
                       

                        deleteFromBox(pairs[i][0],pairs[i][1],head[pairs[i][0]][pairs[i][1]].data);     
                        deleteFromBox(pairs[i-l][0],pairs[i-l][1],head[pairs[i-l][0]][pairs[i-l][1]].data);
                        
                        head[pairs[i][0]][pairs[i][1]].data=0;
                        head[pairs[i-l][0]][pairs[i-l][1]].data=0;        
                    }
                }
                l++;
            }
        }
    }


        
    public static void findPairs()
    {
        int row,col,boxcol,boxrow;
        for(row=0;row<9;row++)
           find_pairs_in_row(row);			
        

        for(col=0;col<9;col++)
            find_pairs_in_col(col);		
               

        for(boxrow=0;boxrow<3;boxrow++)
            for(boxcol=0;boxcol<3;boxcol++)
                find_pairs_in_box(boxrow,boxcol);    
    }
    
    
    public static void find_tri_in_row(int row)
    {
        int j,i,l,k=-1;
        int[] pairs=new int [10];
        for(j=0;j<9;j++)	
            if(head[row][j].link!=null)
                if(head[row][j].link.link!=null)
                    if(head[row][j].link.link.link!=null)
                        if(head[row][j].link.link.link.link==null)
                            pairs[++k]=j;
                        
        for(i=k;i>0;i--)	
          for(j=k;j>0;j--)  
            for(l=k;l>0;l--)
                if(i!=l && l!=j && j!=i && head[row][pairs[i]].link.data==head[row][pairs[l]].link.data
                        && head[row][pairs[i]].link.data==head[row][pairs[j]].link.data)
                    if(head[row][pairs[i]].link.link.data==head[row][pairs[l]].link.link.data
                            && head[row][pairs[i]].link.link.data==head[row][pairs[j]].link.link.data)			
                        if(head[row][pairs[i]].link.link.link.data==head[row][pairs[l]].link.link.link.data
                            && head[row][pairs[i]].link.link.link.data==head[row][pairs[j]].link.link.link.data)
                        {
                            head[row][pairs[i]].data=head[row][pairs[i]].link.data;
                            head[row][pairs[l]].data=head[row][pairs[l]].link.link.data;
                            head[row][pairs[j]].data=head[row][pairs[j]].link.link.link.data;

                            deleteFromRow(row,head[row][pairs[i]].data);
                            deleteFromRow(row,head[row][pairs[l]].data);
                            deleteFromRow(row,head[row][pairs[j]].data);


                            head[row][pairs[i]].data=0;
                            head[row][pairs[l]].data=0;
                            head[row][pairs[j]].data=0;
                        }
                        
    }




     public static void find_tri_in_col(int col)         
    {
        int j,i,l,k=-1;
        int[] pairs=new int [10];
        for(j=0;j<9;j++)               
            if(head[j][col].link!=null)
                if(head[j][col].link.link!=null)
                    if(head[j][col].link.link.link!=null)
                        if(head[j][col].link.link.link.link==null)
                            pairs[++k]=j;      
                
        

        for(i=k;i>0;i--)	
          for(j=k;j>0;j--)  
            for(l=k;l>0;l--)
                if(i!=l && l!=j && j!=i && head[pairs[i]][col].link.data==head[pairs[l]][col].link.data
                        && head[pairs[i]][col].link.data==head[pairs[j]][col].link.data)
                
                    if(head[pairs[i]][col].link.link.data==head[pairs[l]][col].link.link.data
                            && head[pairs[i]][col].link.link.data==head[pairs[j]][col].link.link.data)
                        
                        if(head[pairs[i]][col].link.link.link.data==head[pairs[l]][col].link.link.link.data
                            && head[pairs[i]][col].link.link.link.data==head[pairs[j]][col].link.link.link.data)
                        {

                            head[pairs[i]][col].data=head[pairs[i]][col].link.data;
                            head[pairs[l]][col].data=head[pairs[l]][col].link.link.data;
                            head[pairs[j]][col].data=head[pairs[j]][col].link.link.link.data;


                            deleteFromColumn(col,head[pairs[i]][col].data);
                            deleteFromColumn(col,head[pairs[l]][col].data);
                            deleteFromColumn(col,head[pairs[j]][col].data);

                            head[pairs[i]][col].data=0;
                            head[pairs[l]][col].data=0;
                            head[pairs[j]][col].data=0;
                        }
    }


     
    
     public static void find_tri_in_box(int boxRow,int boxColumn)
     {
        int j,i,k,l,count=-1;
        int[][] pairs=new int [10][2];     
        for(i=(boxRow)*3,j=0; j<3; i++,j++)
            for(k=(boxColumn)*3,l=0; l<3; k++,l++)
                if(head[i][k].link!=null)
                    if(head[i][k].link.link!=null)
                        if(head[i][k].link.link.link!=null)
                            if(head[i][k].link.link.link.link==null)
                            {
                                pairs[++count][0]=i;
                                pairs[count][1]=k;
                            }			
                       
        for(i=count;i>0;i--)     
          for(j=count;j>0;j--)  
            for(l=count;l>0;l--)
                if(i!=l && l!=j && j!=i && head[pairs[i][0]][pairs[i][1]].link.data==head[pairs[j][0]][pairs[j][1]].link.data
                        && head[pairs[i][0]][pairs[i][1]].link.data==head[pairs[l][0]][pairs[l][1]].link.data)
                
                    if(head[pairs[i][0]][pairs[i][1]].link.link.data==head[pairs[l][0]][pairs[l][1]].link.link.data
                            && head[pairs[i][0]][pairs[i][1]].link.link.data==head[pairs[j][0]][pairs[j][1]].link.link.data)
                        if(head[pairs[i][0]][pairs[i][1]].link.link.link.data==head[pairs[l][0]][pairs[l][1]].link.link.link.data
                            && head[pairs[i][0]][pairs[i][1]].link.link.link.data==head[pairs[j][0]][pairs[j][1]].link.link.link.data)
                        {

                            head[pairs[i][0]][pairs[i][1]].data=head[pairs[i][0]][pairs[i][1]].link.data;      
                            head[pairs[l][0]][pairs[l][1]].data=head[pairs[l][0]][pairs[l][1]].link.data;                                           
                            head[pairs[j][0]][pairs[j][1]].data=head[pairs[j][0]][pairs[j][1]].link.data;


                            deleteFromBox(pairs[i][0],pairs[i][1],head[pairs[i][0]][pairs[i][1]].data);     
                            deleteFromBox(pairs[l][0],pairs[l][1],head[pairs[l][0]][pairs[l][1]].data);
                            deleteFromBox(pairs[j][0],pairs[j][1],head[pairs[j][0]][pairs[j][1]].data);

                            head[pairs[i][0]][pairs[i][1]].data=0;
                            head[pairs[l][0]][pairs[l][1]].data=0;        
                            head[pairs[j][0]][pairs[j][1]].data=0;
                        }
                
    }


    
    
    
    public static void findtriplets()
    {
        int row,col,boxcol,boxrow;
        for(row=0;row<9;row++)
           find_tri_in_row(row);			
        

        for(col=0;col<9;col++)
            find_tri_in_col(col);		
               

        for(boxrow=0;boxrow<3;boxrow++)
            for(boxcol=0;boxcol<3;boxcol++)
                find_tri_in_box(boxrow,boxcol);
    }
    

    
    
       
    public static void LcDeleteRow(int element,int row,int searchFrom)
    {
        int j,k;
        int rangeBegin=searchFrom;
        int rangeEnd=(searchFrom+5);

        sudoku curr,prev;
        for(j=rangeBegin;j<=rangeEnd;j++)
        {	
            k=j%9;	
            if(head[row][k].data==0)
            {
                curr=head[row][k].link;
                prev=head[row][k];
                while(curr!=null)
                {
                    if (curr.data==element)
                    {
                        prev.link=curr.link;
                        break;
                    }
                    else
                    {
                        prev=curr;
                        curr=curr.link;
                    }
              
                }
            }
        }
    }



      

    public static void LcDeleteCol(int element,int col,int searchFrom)
    {
        int i,k;
        int rangeBegin=searchFrom;
        int rangeEnd=(searchFrom+5);

        sudoku curr,prev;

        for(i=rangeBegin;i<=rangeEnd;i++)
        {
           
            k=i%9;
            if(head[k][col].data==0)
            {
                curr=head[k][col].link;
                prev=head[k][col];
                while(curr!=null)
                {
                    if (curr.data==element)
                    {
                        prev.link=curr.link;
                        break;
                    }
                    else
                    {
                        prev=curr;
                        curr=curr.link;
                    }
                }
            }
        }
    }


       

    public static void LcDeleteFromBox_lc2col(int boxBeginI,int boxBeginJ,int J,int element)
    {
        int i,j;
        sudoku curr,prev;
        for(i=boxBeginI;i<=(boxBeginI+2);i++)
        {
            for(j=boxBeginJ;j<=(boxBeginJ+2);j++)
            {
                if(j!=J)
                {
                    if(head[i][j].data==0)
                    {
                        curr=head[i][j].link;
                        prev=head[i][j];
                        while(curr!=null)
                        {
                            if (curr.data==element)
                            {
                                prev.link=curr.link;
                                break;
                            }
                            else
                            {
                                prev=curr;
                                curr=curr.link;
                            }
                        }
                    }
                }
              
            }
        }
       
    }

       

    public static void LcDeleteFromBox_lc2row(int boxBeginI,int boxBeginJ,int J,int element)
    {
        int i,j;
        sudoku curr,prev;
        for(i=boxBeginI;i<=(boxBeginI+2);i++)
        {
            for(j=boxBeginJ;j<=(boxBeginJ+2);j++)
            {
                if(i!=J)
                {
                    if(head[i][j].data==0)
                    {
                        curr=head[i][j].link;

                        prev=head[i][j];
                        while(curr!=null)
                        {
                            if (curr.data==element)
                            {
                                prev.link=curr.link;
                                break;
                            }
                            else
                            {
                                prev=curr;
                                curr=curr.link;
                            }
                        }
                    }
                }
            }
        }
    }


        

    public static void LockedElement_row()
    {
        int a,i,j,k,s,boxRow,boxColumn,boxBeginI=0,boxBeginJ=0;
        sudoku t;
        class lock
        {
            int ocurrences;
            int[] col=new int[2];
        }
        lock[] num=new lock[10];
                        

       

        for(j=0;j<=9;j++)
        {
            num[j]=new lock();
            num[j].ocurrences=0;
            num[j].col[0]=0;
            num[j].col[1]=0;
        }	

        for(i=0;i<9;i++)
        {
            for(j=0;j<9;j++)
            {
                if(head[i][j].data==0)
                {
                    t=head[i][j].link;
                    while(t!=null)
                    {
                        num[t.data].ocurrences++;
                        t=t.link;
                    }
                }
            }

                

            for(k=1;k<=9;k++)
            {
                if(num[k].ocurrences == 2)
                {	
                    s=0;
                    for(j=0;j<9;j++)
                    {
                        if(head[i][j].data==0)
                        {
                            t=head[i][j].link;
                            while(t!=null)
                            {
                                if(t.data == k)
                                {
                                    num[k].col[s]=j;
                                    s++;
                                }
                                t=t.link;
                            }
                        }
                    }
                       
                    if((num[k].col[0]>=0 && num[k].col[1]>=0) && (num[k].col[0]<=2 && num[k].col[1]<=2))
                    {
                        a=findBox(i,0);
                        boxRow=(a/3);
                        if(a%3==0)
                            boxRow--;
                        boxColumn=(a%3);
                        if(boxColumn==0)
                            boxColumn=3;
                        boxColumn--;
                        boxBeginI=boxRow*3;
                        boxBeginJ=boxColumn*3;
                        LcDeleteFromBox_lc2row(boxBeginI,boxBeginJ,i,k);
                    }		
                    if((num[k].col[0]>=3 && num[k].col[1]>=3) && (num[k].col[0]<=5 && num[k].col[1]<=5))	
                    {
                        a=findBox(i,4);
                        boxRow=(a/3); 
                        if(a%3==0)
                            boxRow--;
                        boxColumn=(a%3);
                        if(boxColumn==0)
                            boxColumn=3;
                        boxColumn--;
                        boxBeginI=boxRow*3;
                        boxBeginJ=boxColumn*3;
                        LcDeleteFromBox_lc2row(boxBeginI,boxBeginJ,i,k);

                    }		
                    if((num[k].col[0]>=6 && num[k].col[1]>=6) && (num[k].col[0]<=8 && num[k].col[1]<=8))
                    {
                        a=findBox(i,7);
                        boxRow=(a/3); 
                        if(a%3==0)
                            boxRow--;
                        boxColumn=(a%3);
                        if(boxColumn==0)
                            boxColumn=3;
                        boxColumn--;
                        boxBeginI=boxRow*3;
                        boxBeginJ=boxColumn*3;
                        LcDeleteFromBox_lc2row(boxBeginI,boxBeginJ,i,k);
                    }
                }
            }
            for(i=0;i<=9;i++)
            {
                num[i].ocurrences=0;
                num[i].col[0]=0;
                num[i].col[1]=0;
            }	

        }

    }
        

    public static void LockedElement_col()
    {
        int a,i,j,k,s,boxRow,boxColumn,boxBeginI=0,boxBeginJ=0;
        sudoku t;
        class lock
        {
            int ocurrences;
            int[] row=new int[2];
        }
        lock[] num=new lock[10];

       

        for(i=0;i<=9;i++)
        {
            num[i]=new lock();
            num[i].ocurrences=0;
            num[i].row[0]=0;
            num[i].row[1]=0;
        }	

        for(j=0;j<9;j++)
        {
            for(i=0;i<9;i++)
            {
                if(head[i][j].data==0)
                {
                    t=head[i][j].link;
                    while(t!=null)
                    {
                        num[t.data].ocurrences++;
                        t=t.link;
                    }
                }
            }

               

            for(k=1;k<=9;k++)
            {
                if(num[k].ocurrences == 2)
                {	
                    s=0;	
                    for(i=0;i<9;i++)
                    {
                        if(head[i][j].data==0)
                        {
                            t=head[i][j].link;
                            while(t!=null)
                            {
                                if(t.data == k)
                                {
                                    num[k].row[s]=i;
                                    s++;
                                }
                                t=t.link;
                            }
                        }

                    }
                       

                    if((num[k].row[0]>=0 && num[k].row[1]>=0) && (num[k].row[0]<=2 && num[k].row[1]<=2))
                    {
                        a=findBox(0,j);
                        boxRow=(a/3); 
                        if(a%3==0)
                            boxRow--;
                        boxColumn=(a%3);
                        if(boxColumn==0)
                            boxColumn=3;
                        boxColumn--;
                        boxBeginI=boxRow*3;
                        boxBeginJ=boxColumn*3;
                        LcDeleteFromBox_lc2col(boxBeginI,boxBeginJ,j,k);
                    }		
                    if((num[k].row[0]>=3 && num[k].row[1]>=3) && (num[k].row[0]<=5 && num[k].row[1]<=5))
                    {
                        a=findBox(4,j);
                        boxRow=(a/3); 
                        if(a%3==0)
                            boxRow--;
                        boxColumn=(a%3);
                        if(boxColumn==0)
                            boxColumn=3;
                        boxColumn--;
                        boxBeginI=boxRow*3;
                        boxBeginJ=boxColumn*3;
                        LcDeleteFromBox_lc2col(boxBeginI,boxBeginJ,j,k);
                    }		
                    if((num[k].row[0]>=6 && num[k].row[1]>=6) && (num[k].row[0]<9 && num[k].row[1]<9))
                    {
                        a=findBox(7,j);
                        boxRow=(a/3); 
                        if(a%3==0)
                            boxRow--;
                        boxColumn=(a%3);
                        if(boxColumn==0)
                            boxColumn=3;
                        boxColumn--;
                        boxBeginI=boxRow*3;
                        boxBeginJ=boxColumn*3;
                        LcDeleteFromBox_lc2col(boxBeginI,boxBeginJ,j,k);
                    }
                }	
            }
            for(i=0;i<=9;i++)
            {
                num[i].ocurrences=0;
                num[i].row[0]=0;
                num[i].row[1]=0;
            }	

        }
        
    }

         

    public static void LockedElement_box()
    {
        sudoku t;
        int i=0,j=0,cc,ii,p,q;

        class lock
        {
            int[] r=new int[3];
            int[] c=new int[3];
        }
        lock[] box=new lock[10];		


       

        for(i=0;i<=9;i++)
        {
            box[i]=new lock();
            box[i].r[0]=0;
            box[i].r[1]=0;
            box[i].r[2]=0;
            box[i].c[0]=0;
            box[i].c[1]=0;
            box[i].c[2]=0;
        }

        for(i=0;i<=6;i+=3)				
        {
            for(j=0;j<=6;j+=3)
            {
                for(p=0;p<=2;p++)
                    for(q=0;q<=2;q++)
                        if(head[p+i][q+j].data==0) 	
                        {
                            t=head[p+i][q+j].link;
                            while(t!=null)	
                            {
                                (box[t.data].r[p])++;
                                (box[t.data].c[q])++;
                                t=t.link;
                            }
                        }
                        
                            
                cc=1;
                        
                while(cc<=9)
                {
                    if(box[cc].r[0]==0 && box[cc].r[1]==0 && box[cc].r[2]==2)
                        LcDeleteRow(cc,(i+2),(j+3));

                    if(box[cc].r[0]==0 && box[cc].r[1]==2 && box[cc].r[2]==0)
                        LcDeleteRow(cc,(i+1),(j+3));

                    if(box[cc].r[0]==2 && box[cc].r[1]==0 && box[cc].r[2]==0)
                        LcDeleteRow(cc,(i+0),(j+3));


                    if(box[cc].c[0]==0 && box[cc].c[1]==0 && box[cc].c[2]==2)
                        LcDeleteCol(cc,(j+2),(i+3));

                    if(box[cc].c[0]==0 && box[cc].c[1]==2 && box[cc].c[2]==0)
                        LcDeleteCol(cc,(j+1),(i+3));

                    if(box[cc].c[0]==2 && box[cc].c[1]==0 && box[cc].c[2]==0)
                        LcDeleteCol(cc,(j+0),(i+3));
                    cc++;			

                }
                              
                for(ii=0;ii<=9;ii++)
                {
                    box[ii].r[0]=0;
                    box[ii].r[1]=0;
                    box[ii].r[2]=0;
                    box[ii].c[0]=0;
                    box[ii].c[1]=0;
                    box[ii].c[2]=0;
                }
            }
        }
        
    }

    
    public static void errorCheck()
    {
        int i,j,k,l;
        int[] count=new int [10];
        for(k=0;k<10;k++)
            count[k]=0;

        for(i=0;i<9;i++)                            //row check
        {
            for(j=0;j<9;j++)
                count[head[i][j].data]++;
            
            for(k=1;k<=9;k++)
                if (count[k]>1)
                {
                    System.out.println("\nError");
                    return;
                }
            
            for(k=0;k<10;k++)
                count[k]=0;
        }


        for(i=0;i<9;i++)                            //col check
        {
            for(j=0;j<9;j++)
            {
                count[head[j][i].data]++;
            }
            for(k=1;k<=9;k++)
                if (count[k]>1)
                {
                    System.out.println("\nError");
                    return;
                }
            
            for(k=0;k<10;k++)
                count[k]=0;
        }

        for(i=0;i<=6;i+=3)                          //box check
        {
            for(j=0;j<=6;j+=3)
            {
                for(k=0;k<=2;k++)
                {
                    for(l=0;l<=2;l++)
                    {
                        count[head[i+k][j+l].data]++;
                    }
                }
                for(k=1;k<=9;k++)
                {
                    if (count[k]>1) 
                    {
                        System.out.println("\nError");
                        return;
                    }
                }
                for(k=0;k<10;k++)
                    count[k]=0;
            }
        }
    }


    public static void disp()
    {
        int i,j;
        for(i=0;i<9;i++)
        {
            for(j=0;j<9;j++)
            {
               if(head[i][j].data==0)
                     System.out.print("_ ");
               else
                     System.out.print(head[i][j].data+" "); 
             
               if((j+1)%3==0)  
                     System.out.print("   ");
             }
             if((i+1)%3==0)  
                     System.out.println("");
             System.out.println("");
        }
    }
    

    public static void read() throws IOException
    {
        int row, col;
        File fp=new File("E:\\sudoku\\Ques\\"+str+".txt");
        FileReader fr=new FileReader(fp);
        BufferedReader br=new BufferedReader(fr);
        elementCount=0;

        for(row=0;row<9;row++)
        {
            for(col=0;col<9;col++)
            {	
                temp=new sudoku();
                
                temp.data=(br.read()-48);
                if(temp.data==-2)
                    temp.data=0;
                temp.link=null;
                head[row][col]=temp;
                if(head[row][col].data!=0)
                    elementCount++;

            }
            br.read();
            br.read();
        }
        System.out.println("\nThe input you hav entered is:\n");		
        disp();
        
        for(row=0;row<9;row++)
            for(col=0;col<9;col++)
                if(head[row][col].data == 0)
                    create3D(head[row][col]);
        
        elementCount=0;
        
        del_elem();
    }
    
    
    public static void solve()
    {
        int prevElementCount=0;
         System.out.println("\nAfter index count "+elementCount);

        while(elementCount!=prevElementCount)
        {
            errorCheck();
            prevElementCount=elementCount;

            find_Singles();  
            
            find_Hidden_pair();
            find_Hidden_Triplet();
            
            findPairs();
            findtriplets();
            
            LockedElement_row();
            LockedElement_col();
            LockedElement_box();
        }

        System.out.println("\nThe solved sudoku is "+elementCount);	
        disp();
    } 
    
    public static void main(String[] args) throws FileNotFoundException, IOException 
    {
        str="q1";
        in();
        read();
        solve();
    }
}