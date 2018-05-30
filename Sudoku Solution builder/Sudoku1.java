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
        sudoku link_;
    }
    
    
    public static class pair   
    {
        int count;
        int[] position=new int[9];
    }

    
    public static int elementCount;
    public static sudoku[][] head=new sudoku[9][9];
    public static sudoku temp;
    
    
    
     
    public static void create3D(sudoku base)
    {
        int i;
        for(i=1;i<=9;i++)
        {
            temp=new sudoku();
            temp.link_=null;
            temp.data=i;
            base.link_=temp;
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
                        prev.link_=curr.link_;
                        break;
                    }
                    else
                    {
                        prev=curr;
                        curr=curr.link_;
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
                        prev.link_=curr.link_;
                        break;
                    }
                    else
                    {
                        prev=curr;
                        curr=curr.link_;
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
                             prev.link_=curr.link_;
                             break;
                         }
                         else
                         {
                             prev=curr;
                             curr=curr.link_;
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
                    prev=head[k][j].link_;
                    if((prev.link_==null))		
                    {		
                        head[k][j].data=prev.data; 
                        head[k][j].link_=null;
                        elementCount++;
                        deleteElement(k,j);
                    }
                }
            }


            for(j=0;j<9;j++)					
            {
                if(head[k][j].data==0)			
                {
                    current=head[k][j].link_;
                    while(current!=null)		 	
                    {
                        count[0][current.data]++;
                        count[1][current.data]=j;
                        current=current.link_;
                    }
                }
            }


            for(j=1;j<=9;j++)                   
            {
                if(count[0][j]==1)	
                {
                    col=count[1][j];		
                    head[k][col].data=j;	
                    current=head[k][col].link_;	
                    while(current!=null)
                    {
                        temp=current;
                        current=current.link_;
                    }
                    head[k][col].link_=null;	
                    elementCount++;
                    deleteElement(k,col);
                }
            }
         }
    }

         



    public static void findHiddenDoubles(int number, int RCB)
    {
        sudoku curr=null;
        pair[] element=new pair[9];
        int flag=0,i,j,k=0,l,num1=0, num2=0,boxRow=0,boxColumn=0,box=0;
        
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
                curr=curr.link_;
                while(curr!=null)
                {
                    element[curr.data-1].count++;
                    element[curr.data-1].position[i]=1;
                    curr=curr.link_;
                }
                
            }
        }
        
        
        for(i=0;i<9;i++)
            if(element[i].count==2)
                k=k+1;
        	

        if(k>=2)
        {
            for(j=0;j<9;j++)
                for(l=0;l<9;l++)
                    for(i=0;i<9;i++)
                    {
                        if(element[j].position[i]==element[l].position[i] && element[l].position[i]==1
                                && element[l].count==2 && element[j].count==2)
                        {
                            flag=1;		
                            num1=j;
                            num2=l;
                        }
                         
                
            
                        if (flag==1)
                        {
                            for(i=0;i<9;i++)
                            {
                                if(element[num1].position[i]==1)
                                {	
                                    if(RCB==1)
                                        curr=head[number][i];
                                    if(RCB==2)
                                        curr=head[i][number];
                                    if(RCB==3)	
                                        curr=head[boxRow+(i%3)][boxColumn+(i/3)];



                                    if(curr.link_!=null)
                                        while(curr!=null)
                                        {
                                            if(curr.data!=num1 && curr.data!=num2 && curr.data!=0)
                                                curr.link_=curr.link_;
                                            curr=curr.link_;
                                        }
                                }
                            }
                        }
                    }
        }
    }


        

    public static void find_pairs_in_row(int row)
    {
        int j,i,l,k=-1;
        int[] pairs=new int [10];
        for(j=0;j<9;j++)	
            if(head[row][j].link_!=null)
                if(head[row][j].link_.link_!=null)
                    if(head[row][j].link_.link_.link_==null)
                        pairs[++k]=j;
                        
        for(i=k;i>0;i--)	
        {
            l=1;
            while(i-l>=0)
            {
                if(head[row][pairs[i]].link_.data==head[row][pairs[i-l]].link_.data)
                {	
                    
                    if(head[row][pairs[i]].link_.link_.data==head[row][pairs[i-l]].link_.link_.data)			
                    {
                        
                        head[row][pairs[i]].data=head[row][pairs[i]].link_.data;
                        head[row][pairs[i-l]].data=head[row][pairs[i-l]].link_.link_.data;
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
            if(head[j][col].link_!=null)
                if(head[j][col].link_.link_!=null)
                {
                    if(head[j][col].link_.link_.link_==null)
                    pairs[++k]=j;      
                }
        

        for(i=k;i>0;i--)     
        {
            l=1;
            while(i-l>=0)
            {
                if(head[pairs[i]][col].link_.data==head[pairs[i-l]][col].link_.data)
                {
                    if(head[pairs[i]][col].link_.link_.data==head[pairs[i-l]][col].link_.link_.data)
                    {
                        
                        head[pairs[i]][col].data=head[pairs[i]][col].link_.data;
                        head[pairs[i-l]][col].data=head[pairs[i-l]][col].link_.link_.data;

                       
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
                if(head[i][k].link_!=null)
                    if(head[i][k].link_.link_!=null)
                        if(head[i][k].link_.link_.link_==null)
                        {
                            pairs[++count][0]=i;
                            pairs[count][1]=k;
                        }			
                       
        for(i=count;i>0;i--)     
        {
            l=1;
            while((i-l)>=0)     
            {
                if(head[pairs[i][0]][pairs[i][1]].link_.data==head[pairs[i-l][0]][pairs[i-l][1]].link_.data)
                {
                    if(head[pairs[i][0]][pairs[i][1]].link_.link_.data==head[pairs[i-l][0]][pairs[i-l][1]].link_.link_.data)
                    {
                        
                        head[pairs[i][0]][pairs[i][1]].data=head[pairs[i][0]][pairs[i][1]].link_.data;      
                        head[pairs[i-l][0]][pairs[i-l][1]].data=head[pairs[i-l][0]][pairs[i-l][1]].link_.data;                                           
                       

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
                curr=head[row][k].link_;
                prev=head[row][k];
                while(curr!=null)
                {
                    if (curr.data==element)
                    {
                        prev.link_=curr.link_;
                        break;
                    }
                    else
                    {
                        prev=curr;
                        curr=curr.link_;
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
                curr=head[k][col].link_;
                prev=head[k][col];
                while(curr!=null)
                {
                    if (curr.data==element)
                    {
                        prev.link_=curr.link_;
                        break;
                    }
                    else
                    {
                        prev=curr;
                        curr=curr.link_;
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
                        curr=head[i][j].link_;
                        prev=head[i][j];
                        while(curr!=null)
                        {
                            if (curr.data==element)
                            {
                                prev.link_=curr.link_;
                                break;
                            }
                            else
                            {
                                prev=curr;
                                curr=curr.link_;
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
                        curr=head[i][j].link_;

                        prev=head[i][j];
                        while(curr!=null)
                        {
                            if (curr.data==element)
                            {
                                prev.link_=curr.link_;
                                break;
                            }
                            else
                            {
                                prev=curr;
                                curr=curr.link_;
                            }
                        }
                    }
                }
            }
        }
    }


        

    public static void LcFindLockedCandidate2_row()
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
                    t=head[i][j].link_;
                    while(t!=null)
                    {
                        (num[t.data].ocurrences)++;
                        t=t.link_;
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
                            t=head[i][j].link_;
                            while(t!=null)
                            {
                                if(t.data == k)
                                {
                                    num[k].col[s]=j;
                                    s++;
                                }
                                t=t.link_;
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
        

    public static void LcFindLockedCandidate2_col()
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
                    t=head[i][j].link_;
                    while(t!=null)
                    {
                        num[t.data].ocurrences++;
                        t=t.link_;
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
                            t=head[i][j].link_;
                            while(t!=null)
                            {
                                if(t.data == k)
                                {
                                    num[k].row[s]=i;
                                    s++;
                                }
                                t=t.link_;
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
        LcFindLockedCandidate2_row();
    }

         

    public static void LcFindLockedCandidate1()
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
                            t=head[p+i][q+j].link_;
                            while(t!=null)	
                            {
                                (box[t.data].r[p])++;
                                (box[t.data].c[q])++;
                                t=t.link_;
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
        LcFindLockedCandidate2_col();
    }

    
    public static void errorCheck()
    {
        int i,j,k,l;
        int[] count=new int [10];
        for(k=0;k<10;k++)
            count[k]=0;

        for(i=0;i<9;i++)                
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


        for(i=0;i<9;i++)        
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

        for(i=0;i<=6;i+=3)      
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
                     System.out.print("* ");
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
        File fp=new File("E:\\sudoku\\q1.txt");
        FileReader fr=new FileReader(fp);
        BufferedReader br=new BufferedReader(fr);
        elementCount=0;

        for(row=0;row<9;row++)
        {
            for(col=0;col<9;col++)
            {	
                temp=new sudoku();
                
                temp.data=(br.read()-48);
                br.read();
                temp.link_=null;
                head[row][col]=temp;
                if(head[row][col].data!=0)
                    elementCount++;

            }
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
    
    
    public static void main(String[] args) throws FileNotFoundException, IOException 
    {
        in();
        int row,prevElementCount=0;
        
        read();

        System.out.println("\nAfter index count "+elementCount);

        while(elementCount!=prevElementCount)
        {
            errorCheck();
            prevElementCount=elementCount;

            find_Singles();
            

            for(row=0;row<9;row++)
            {
                findHiddenDoubles(row,1);	
                findHiddenDoubles(row,2);	
                findHiddenDoubles(row,3);	
                
            }
            findPairs();
            
            LcFindLockedCandidate1();
            
        }

        System.out.println("\nThe solved sudoku is "+elementCount);	
        disp();
    }
}
