
 /**************************************************************************
  **************************************************************************

  A C++ Program to show the implementation of Hashing with Insert, Delete and
  Search functionality using double-ended Linked List.

  **************************************************************************
  **************************************************************************/

 /*************************************************************************

	  By :
		Muhammad Tahir Shahzad  [ MTS ]
		B.C.S Honours  [ 2000-04 ]
		Government College University Lahore
		Pakistan

      E-mail :  mtshome@wol.net.pk

    Web-Site :  www.mts-home.cjb.net  [ www.wol.net.pk/mtshome ]
		www.mtshome.cjb.net   [ www.geocities.com/mtahirshahzad ]

  *************************************************************************/

 /**************************************************************************/
 /**************************************************************************/
 //-----------------------------  Header Files  ---------------------------//
 /**************************************************************************/
 /**************************************************************************/

 # include <iostream.h>
 # include  <fstream.h>
 # include   <string.h>
 # include    <stdio.h>
 # include    <conio.h>

 /**************************************************************************/
 /**************************************************************************/
 //-----------------  Class Declaration & Definition  ---------------------//
 /**************************************************************************/
 /**************************************************************************/

 /**************************************************************************/
 //---------------------------------  Node  -------------------------------//
 /**************************************************************************/

 class Node
 {
    public:
       int data;

       Node* Next;
       Node* Back;
 };

 /**************************************************************************/
 /**************************************************************************/
 //-------------------------  Global Declarations  ------------------------//
 /**************************************************************************/
 /**************************************************************************/

 # define MAX_ENTRIES  25

 Node* HashTable[MAX_ENTRIES]={NULL};
 Node* Top[MAX_ENTRIES]={NULL};

 /**************************************************************************/
 /**************************************************************************/
 //-------------------------  Function Definitions  -----------------------//
 /**************************************************************************/
 /**************************************************************************/

 /**************************************************************************/
 //------------------------  generate_hash_key( )  ------------------------//
 /**************************************************************************/

 const int generate_hash_key(const int data)
 {
    return (data%MAX_ENTRIES);
 }

 /**************************************************************************/
 //--------------------------  insert_element( )  -------------------------//
 /**************************************************************************/

 void insert_element( )
 {
    int data;

    cout<<"\n\n\n\t *********   New Element   ********* "<<endl<<endl;
    cout<<"\t Enter a value : ";
    cin>>data;

    int index=generate_hash_key(data);

    Node* Entry=new Node;

    if(!Entry)
    {
       cout<<"\n\n\n\t Fatal Error : Unable to allcate memory to stroe new element."<<endl;
       cout<<"\n\n\t\t Pres any key to return to Menu. ";

       getch( );
       return;
    }

    if(HashTable[index]==NULL)
    {
       Entry->data=data;
       Entry->Next=NULL;
       Entry->Back=NULL;
       HashTable[index]=Entry;
       Top[index]=Entry;
    }

    else
    {
       Entry->data=data;
       Entry->Next=NULL;
       Entry->Back=Top[index];
       Top[index]->Next=Entry;
       Top[index]=Entry;
    }

    cout<<"\n\n\t\t Pres any key to return to Menu. ";

    getch( );
 }

 /**************************************************************************/
 //--------------------------  delete_element( )  -------------------------//
 /**************************************************************************/

 void delete_element( )
 {
    int data;

    cout<<"\n\n\n\t *********   Delete Element   ********* "<<endl<<endl;
    cout<<"\t Enter a value : ";
    cin>>data;

    int flag=0;
    int index=generate_hash_key(data);

    Node* Print=HashTable[index];

    if(Print!=NULL)
    {
       while(Print!=NULL)
       {
	  if(Print->data==data)
	  {
	     if(Print->Back==NULL)
	     {
		Node* Temp=Print->Next;

		Temp->Back=NULL;
		HashTable[index]=Temp;

		delete Print;

		Print=Temp;
	     }

	     else if(Print->Next==NULL)
	     {
		Top[index]=Print->Back;
		Top[index]->Next=NULL;

		delete Print;

		Print=Top[index];
	     }

	     else
	     {
		Node* TempBack=Print->Back;
		Node* TempNext=Print->Next;

		TempBack->Next=TempNext;
		TempNext->Back=TempBack;

		delete Print;

		Print=TempNext;
	     }

	     flag++;
	  }

	  else
	     Print=Print->Next;
       }

       if(flag)
	  cout<<"\n\n\t ***  "<<flag<<" elements deleted.";
    }

    if(!flag)
       cout<<"\n\n\t ***  The Element is not found."<<endl;

    cout<<"\n\n\t\t Pres any key to return to Menu. ";

    getch( );
 }

 /**************************************************************************/
 //-------------------------  print_element( )  ---------------------------//
 /**************************************************************************/

 void print_element( )
 {
    clrscr( );

    cout<<"\n\n\t *****  HashTable & Data  *****\n"<<endl;

    Node* Print;

    for(int index=0;index<MAX_ENTRIES;index++)
    {
       if(index<10)
	  cout<<"\t HashTable[0"<<index<<"] : ";

       else
	  cout<<"\t HashTable["<<index<<"] : ";

       Print=HashTable[index];

       if(Print!=NULL)
       {
	  while(Print!=NULL)
	  {
	     cout<<Print->data;

	     Print=Print->Next;

	     if(Print!=NULL)
		cout<<" , ";
	  }

	  cout<<endl;
       }

       else
	  cout<<"-"<<endl;
    }

    cout<<"\n\n\t\t Pres any key to return to Menu. ";

    getch( );
 }

 /**************************************************************************/
 //-------------------------  search_element( )  --------------------------//
 /**************************************************************************/

 void search_element( )
 {
    int data;

    cout<<"\n\n\n\t *****  Search an Element  *****\n"<<endl;
    cout<<"\t Enter a value : ";
    cin>>data;

    int flag=0;
    int index=generate_hash_key(data);

    Node* Print=HashTable[index];

    if(Print!=NULL)
    {
       while(Print!=NULL)
       {
	  if(Print->data==data)
	     flag++;

	  Print=Print->Next;
       }

       if(flag)
	  cout<<"\n\n\t ***  The Search Element is found "<<flag<<" times.";
    }

    if(!flag)
       cout<<"\n\n\t ***  The Search Element is not found."<<endl;

    cout<<"\n\n\n\t\t Pres any key to return to Menu. ";

    getch( );
 }

 /**************************************************************************/
 //---------------------------  show_working( )  --------------------------//
 /**************************************************************************/

 void show_working( )
 {
    char Key=NULL;

    do
    {
       clrscr( );

       gotoxy(10,5);
       cout<<"**********   Implementation of Hashing   **********"<<endl;

       gotoxy(10,8);
       cout<<"Select one of the listed operation :"<<endl;

       gotoxy(15,10);
       cout<<"- Press \'I\' to Insert an Element"<<endl;

       gotoxy(15,12);
       cout<<"- Press \'D\' to Delete an Element"<<endl;

       gotoxy(15,14);
       cout<<"- Press \'P\' to Print the HashTable & Data"<<endl;

       gotoxy(15,16);
       cout<<"- Press \'S\' to Search an Element"<<endl;

       gotoxy(15,18);
       cout<<"- Press \'E\' to Exit"<<endl;

       Input:

       gotoxy(10,22);
       cout<<"                      ";

       gotoxy(10,22);
       cout<<"Enter your Choice : ";

       Key=getche( );

       if(int(Key)==27 || Key=='e' || Key=='E')
	  break;

       else if(Key=='i' || Key=='I')
	  insert_element( );

       else if(Key=='d' || Key=='D')
	  delete_element( );

       else if(Key=='p' || Key=='P')
	  print_element( );

       else if(Key=='s' || Key=='S')
	  search_element( );

       else
	  goto Input;
    }
    while(1);
 }

 /**************************************************************************/
 /**************************************************************************/
 //--------------------------------  main( )  -----------------------------//
 /**************************************************************************/
 /**************************************************************************/

 int main( )
 {
    textmode(C4350);

    show_working( );

    return 0;
 }

 /**************************************************************************/
 /**************************************************************************/
 //-------------------------------  THE END  ------------------------------//
 /**************************************************************************/
 /**************************************************************************/