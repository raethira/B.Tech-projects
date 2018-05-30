	//**********************************************************
	//	PROJECT SALARY MANAGMENT
	//**********************************************************
 
//**********************************************************
//	INCLUDED HEADER FILES
//**********************************************************
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<cstdio>
#include<stdlib.h>
#include<stdio.h>
using namespace std;
 
 
//**********************************************************
// THIS CLASS CONTROL ALL THE FUNCTIONS IN THE MENU
//**********************************************************
 
class MENU
{
	public:
			void MAIN_MENU(void);
	private:
			void EDIT_MENU(void);
			void INTRODUCTION(void);
};
 
 
 
 
//**********************************************************
// THIS CLASS CONTROL ALL THE FUNCTIONS RELATED TO EMPLOYEE
//**********************************************************
              
class EMPLOYEE
{
	public:
			void NEW_EMPLOYEE(void);
			void MODIFICATION(void);
			void DELETION(void);
			void DISPLAY(void);
			void LIST(void);
			void SALARY_SLIP(void);

			EMPLOYEE()
			
	
			{code=0;
			}			
	private:
			void ADD_RECORD(int,char[],char[],char[],int,int,int,char[],char,char,char,float,float);
			void MODIFY_RECORD(int,char [],char [],char [],char [],char,char,char,float,float);
			void DELETE_RECORD(int);
			int LASTCODE(void);
			int CODEFOUND(int);
			int RECORDNO(int);
			int FOUND_CODE(int);
			void DISPLAY_RECORD(int);
			int VALID_DATE(int,int,int);
 
			int code,dd,mm,yy;
			char name[26],address[31],phone[10],desig[16];
			char grade,house,convense;
			float loan,basic;
} ;
 
 
//**********************************************************
// THIS FUNCTION CONTROL ALL THE FUNCTIONS IN THE MAIN MENU
//**********************************************************
 
void MENU::MAIN_MENU(void)
{
	char ch;
	while(1)
	{	cout<<" INDIAN PVT. LTD."<<endl;
		cout<<"1: NEW EMPLOYEE"<<endl;
  		cout<<"2: DISPLAY EMPLOYEE"<<endl;
		cout<<"3: LIST OF EMPLOYEES"<<endl;
		cout<<"4: SALARY SLIP"<<endl;
		cout<<"5: EDIT"<<endl;
		cout<<"0: QUIT"<<endl;
		cout<<"ENTER YOUR CHOICE :"<<endl;
		cin>>ch;
		if(ch==27||ch=='0')
			break;
		else
		if(ch=='1')
		{
			EMPLOYEE E;
			E.NEW_EMPLOYEE();
		}
		else
		if(ch=='2')
		{
			EMPLOYEE E;
			E.DISPLAY();
		}
		else
		if(ch=='3')
		{
			EMPLOYEE E;
			E.LIST();
		}
		else
		if(ch=='4')
		{
			EMPLOYEE E;
			E.SALARY_SLIP();
		}
		else
		if(ch=='5')
			EDIT_MENU();
	}
}
 
 
//**********************************************************
// THIS FUNCTION CONTROL ALL THE FUNCTIONS IN THE EDIT MENU
//**********************************************************
 
void MENU::EDIT_MENU(void)
{
	char ch;
	while (1)
	{
		cout<<"E D I T  M E N U"<<endl;
		cout<<"1: DELETE RECORD"<<endl;
		cout<<"2: MODIFY RECORD"<<endl;
		cout<<"0: EXIT"<<endl;
		cout<<"ENTER YOUR CHOICE :"<<endl;
		cin>>ch;
		if(ch==27||ch=='0')
			break;
		else
		if(ch=='1')
		{
			EMPLOYEE E;
			E.DELETION();
		}
		else
		if(ch=='2')
		{
			EMPLOYEE E;
			E.MODIFICATION();
		}
	}
}
 
//**********************************************************
// THIS FUNCTION ADDS THE GIVEN DATA IN THE EMPLOYEE'S FILE
//**********************************************************
 
void EMPLOYEE::ADD_RECORD(int ecode, char ename[], char eaddress[], char ephone[], int d, int m, int y, char edesig[], char egrade, char ehouse, char econv, float eloan, float ebasic)
{
	fstream file;
	file.open("EMPLOYEE.TXT",ios::app);
	code=ecode;
	strcpy(name,ename);
	strcpy(address,eaddress);
	strcpy(phone,ephone);
	dd=d;
	mm=m;
	yy=y;
	strcpy(desig,edesig);
	grade=egrade;
	house=ehouse;
	convense=econv;
	loan=eloan;
	basic=ebasic;
	file.write((char *)this,sizeof(EMPLOYEE));
	file.close();	
}
 
 
//**********************************************************
// THIS FUNCTION MODIFY THE GIVEN DATA IN THE
// EMPLOYEE'S FILE
//**********************************************************
 
void EMPLOYEE::MODIFY_RECORD(int ecode,char ename[26],char eaddress[31],char ephone[10],char edesig[16],char egrade,char ehouse,char econv,float eloan,float ebasic)
{
	int recno;
	recno=RECORDNO(ecode);
	fstream file;
	file.open("EMPLOYEE.TXT",ios::out|ios::ate);
	strcpy(name,ename);
	strcpy(address,eaddress);
	strcpy(phone,ephone);
	strcpy(desig,edesig);
	grade=egrade;
	house=ehouse;
	convense=econv;
	loan=eloan;
	basic=ebasic;
	int location;
	location=(recno-1)*sizeof(EMPLOYEE);
	file.seekp(location);
	file.write((char *)this,sizeof(EMPLOYEE));
	file.close();
}
 
 
//**********************************************************
// THIS FUNCTION DELETE THE RECORD IN THE EMPLOYEE FILE
// FOR THE GIVEN EMPLOYEE CODE
//**********************************************************
 
void EMPLOYEE::DELETE_RECORD(int ecode)
{
	fstream file;
	file.open("EMPLOYEE.TXT",ios::in);
	fstream temp;
	temp.open("temp.TXT",ios::out);
	file.seekg(0,ios::beg);
	while(!file.eof())
	{
		file.read((char *)this,sizeof(EMPLOYEE));
		if(file.eof())
			break;
		if(code != ecode)
			temp.write((char *)this,sizeof(EMPLOYEE));
	}
	file.close();
	temp.close();
	file.open("EMPLOYEE.TXT",ios::out);
	temp.open("temp.TXT",ios::in);
	temp.seekg(0,ios::beg);
	while(!temp.eof())
	{
		temp.read((char *)this,sizeof(EMPLOYEE));
		if(temp.eof())
			break ;
		file.write((char *)this,sizeof(EMPLOYEE));
	}
	file.close();
	temp.close();
}
 
 
//**********************************************************
// THIS FUNCTION RETURNS THE LAST EMPLOYEE'S CODE
//**********************************************************
 
int EMPLOYEE::LASTCODE(void)
{
	fstream file;
	file.open("EMPLOYEE.TXT",ios::in);
	file.seekg(0,ios::beg);
	int count=0;
	while(file.read((char *) this, sizeof(EMPLOYEE)))
		count = code ;
	file.close() ;
	return count ;
}
 
 
//**********************************************************
// THIS FUNCTION RETURNS 0 IF THE GIVEN CODE NOT FOUND
//**********************************************************
 
int EMPLOYEE :: FOUND_CODE(int ecode)
{
	fstream file ;
	file.open("EMPLOYEE.TXT", ios::in) ;
	file.seekg(0,ios::beg) ;
	int found=0 ;
	while (file.read((char *) this, sizeof(EMPLOYEE)))
	{
		if (code == ecode)
		{
			found = 1 ;
			break ;
		}
	}
	file.close() ;
	return found ;
}
 
 
//**********************************************************
// THIS FUNCTION RETURNS RECORD NO. OF THE GIVEN CODE
//**********************************************************
 
int EMPLOYEE :: RECORDNO(int ecode)
{
	fstream file ;
	file.open("EMPLOYEE.TXT", ios::in) ;
	file.seekg(0,ios::beg) ;
	int recno=0 ;
	while (file.read((char *) this, sizeof(EMPLOYEE)))
	{
		recno++ ;
		if (code == ecode)
			break ;
	}
	file.close() ;
	return recno ;
}
 
 
//**********************************************************
// THIS FUNCTION DISPLAYS THE LIST OF THE EMPLOYEES
//**********************************************************
 
void EMPLOYEE :: LIST(void)
{
	int row = 6 , found=0, flag=0 ;
	char ch ;
	cout <<"LIST OF EMPLOYEES"<<endl ;
	cout <<"~~~~~~~~~~~~~~~~~~~"<<endl ;
	cout <<"CODE NAME                     PHONE    DOJ         DESIGNATION    GRADE  SALARY"<<endl ;
	cout <<"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"<<endl ;
	fstream file ;
	file.open("EMPLOYEE.TXT", ios::in) ;
	file.seekg(0,ios::beg) ;
	while (file.read((char *) this, sizeof(EMPLOYEE)))
	{
		flag = 0 ;
		found = 1 ;
		cout <<code<<endl ;
		cout <<name<<endl ;
		cout	<<phone<<endl ;
		cout <<dd <<"/" <<mm <<"/" <<yy<<endl ;
		cout <<desig<<endl ;
		cout <<grade<<endl ;
		if (grade != 'E')
		{
			cout <<basic<<endl ;
		}
		else
		{
			cout <<"-"<<endl ;
		}
		if ( row == 23 )
		{
			flag = 1 ;
			row = 6 ;
			cout <<"Press any key to continue or Press <ESC> to exit"<<endl ;
	cin>>ch;
		if (ch == 27)
				break ;
			cout <<"LIST OF EMPLOYEES"<<endl ;
			cout <<"~~~~~~~~~~~~~~~~~~~"<<endl ;
			cout <<"CODE NAME                     PHONE    DOJ         DESIGNATION    GRADE  SALARY"<<endl ;
			cout <<"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"<<endl ;
		}
		else
			row++ ;
	}
	if (!found)
	{
		cout <<"\7Records not found"<<endl ;
	}
	if (!flag)
	{
		cout <<"Press any key to continue..."<<endl ;
	}
	file.close () ;
}
 
 
//**********************************************************
// THIS FUNCTION DISPLAYS THE RECORD OF THE EMPLOYEES
//**********************************************************
 
void EMPLOYEE :: DISPLAY_RECORD(int ecode)
{
	fstream file ;
	file.open("EMPLOYEE.TXT", ios::in) ;
	file.seekg(0,ios::beg) ;
	while (file.read((char *) this, sizeof(EMPLOYEE)))
	{
		if (code == ecode)
		{
			cout <<"Employee Code # " <<code<<endl ;
			cout <<"~~~~~~~~~~~~~"<<endl ;
			cout <<"Name         : " <<name<<endl ;
			cout <<"Address      : " <<address<<endl ;
			cout <<"Phone no.    : " <<phone<<endl ;
			cout <<"JOINING DATE"<<endl ;
			cout <<"~~~~~~~~~~~~"<<endl ;
			cout <<"Day   : " <<dd<<endl ;
			cout <<"Month : " <<mm<<endl ;
			cout <<"Year  : " <<yy<<endl ;
			cout <<"Designation  : " <<desig<<endl ;
			cout <<"Grade        : " <<grade<<endl ;
			if (grade != 'E')
			{
				cout <<"House (y/n)    : " <<house<<endl ;
				cout <<"Convense (y/n) : " <<convense<<endl ;
				cout <<"Basic Salary   : " <<basic<<endl ;
			}
			cout <<"Loan           : " <<loan<<endl ;
		}
	}
	file.close() ;
}
 
 
//**********************************************************
// THIS FUNCTION GIVE DATA TO ADD IN THE FILE
//**********************************************************
 
void EMPLOYEE :: NEW_EMPLOYEE(void)
{
	char  ch, egrade, ehouse='N', econv='N' ;
	char  ename[26], eaddress[31], ephone[10], edesig[16], t1[10] ;
	float t2=0.0, eloan=0.0, ebasic=0.0 ;
	int   d=0, m=0, y=0, ecode=0, valid=0 ;
	cout <<"&lt;0>=EXIT"<<endl ;
	cout <<"ADDITION OF NEW EMPLOYEE"<<endl ;
	cout <<"Employee Code # "<<endl ;
	cout <<"~~~~~~~~~~~~~"<<endl ;
	cout <<"Name         : "<<endl ;
	cout <<"Address      : "<<endl ;
	cout <<"Phone no.    : "<<endl ;
	cout <<"JOINING DATE"<<endl ;
	cout <<"~~~~~~~~~~~~"<<endl ;
	cout <<"Day   : "<<endl ;
	cout <<"Month : " <<endl;
	cout <<"Year  : "<<endl ;
	cout <<"Designation  : "<<endl ;
	cout <<"Grade        : "<<endl ;
	cout <<"Loan           : "<<endl ;
	strcpy(ename,"null");

	strcpy(eaddress,"null");
strcpy(ephone,"null");
strcpy(edesig,"null"); 
	ecode = LASTCODE() + 1 ;

	if (ecode == 1)
	{
		ADD_RECORD(ecode, ename, eaddress, ephone, d, m, y, edesig, egrade, ehouse, econv, eloan, ebasic) ;
		DELETE_RECORD(ecode) ;
	}	
	cout <<ecode<<endl ;
	do
	{
		valid = 1 ;
		cout <<"Enter the name of the Employee" ;
		cin>>ename;
	if (ename[0] == '0')
			return ;
		if (strlen(ename) < 1 || strlen(ename) > 25)
		{
			valid = 0 ;
			cout <<"\7Enter correctly (Range: 1..25)"<<endl;
		}
	} while (!valid) ;
	do
	{
		valid = 1 ;
		cout <<"Enter Address of the Employee"<<endl ;
		cin>>eaddress;
		if (eaddress[0] == '0')
			return ;
		if (strlen(eaddress) < 1 || strlen(eaddress) > 30)
		{
			valid = 0 ;
			cout <<"\7Enter correctly (Range: 1..30)"<<endl ;
			}
	} while (!valid) ;
	do
	{
		valid = 1 ;
		cout <<"Enter Phone no. of the Employee or Press 0 for none"<<endl ;
		cin>>ephone;
		if ((strlen(ephone) < 7 && strlen(ephone) > 0) || (strlen(ephone) > 9))
		{
			valid = 0 ;
			cout<<"\7Enter correctly"<<endl;
			
		}
	} while (!valid) ;
	if (strlen(ephone) == 0)
		strcpy(ephone,"-") ;
	char tday[3], tmonth[3], tyear[5] ;
	int td ;
			cout <<"ENTER DAY OF JOINING"<<endl ;
			cin>>tday ;
			cout <<"ENTER MONTH OF JOINING"<<endl ;
			cin>>tmonth;
			cout <<"ENTER YEAR OF JOINING"<<endl ;
			cin>>tyear ;
		cout <<"Enter Designation of the Employee"<<endl ;
		cin>>edesig ;
		cout <<"Enter Grade of the Employee (A,B,C,D,E)"<<endl ;
	cin>>egrade;
	if (egrade != 'E')
	{
		cout <<"House (y/n)    : "<<endl ;
		cout <<"Convense (y/n) : "<<endl ;
		cout <<"Basic Salary   : "<<endl ;
		do
		{
			cout <<"ENTER IF HOUSE ALLOWANCE IS ALLOTED TO EMPLOYEE OR NOT"<<endl ;
			cin>>ehouse;
		if (ehouse == '0')
				return ;
		} while (ehouse != 'Y' && ehouse != 'N') ;
		do
		{
			cout <<"ENTER IF CONVENCE ALLOWANCE IS ALLOTED TO EMPLOYEE OR NOT"<<endl ;
			cin>>econv;
			if (econv == '0')
				return ;
		} while (econv != 'Y' && econv != 'N') ;
	}
	do
	{
		valid = 1 ;
		cout <<"ENTER LOAN AMOUNT IF ISSUED"<<endl ;
		cin>>eloan;
		if (eloan > 50000)
		{
			valid = 0 ;
			cout <<"\7SHOULD NOT GREATER THAN 50000"<<endl ;
		}
	} while (!valid) ;
	if (egrade != 'E')
	{
		do
		{
			valid = 1 ;
			cout <<"ENTER BASIC SALARY OF THE EMPLOYEE"<<endl ;
			cin>>ebasic;
			if (ebasic > 50000)
			{
				valid = 0 ;
				cout <<"\7SHOULD NOT GREATER THAN 50000"<<endl ;
				
			}
		} while (!valid) ;
	}
	do
	{
		cout <<"Do you want to save (y/n) "<<endl ;
		cin>>ch;
		
	} while (ch != 'Y' && ch != 'N') ;
	if (ch == 'N')
		return ;
	ADD_RECORD(ecode, ename, eaddress, ephone, d, m, y, edesig, egrade, ehouse, econv, eloan, ebasic) ;
}
 
 
//**********************************************************
// THIS FUNCTION GIVE CODE FOR THE DISPLAY OF THE RECORD
//**********************************************************
 
void EMPLOYEE :: DISPLAY(void)
{
	char t1[10] ;
	int t2, ecode ;
	cout <<"&lt;0>=EXIT"<<endl ;
	cout <<"Enter code of the Employee  "<<endl ;
	cin>>ecode;
	if (ecode == 0)
		return ;
	if (!FOUND_CODE(ecode))
	{
		cout <<"\7Record not found"<<endl ;
		return ;
	}
	DISPLAY_RECORD(ecode) ;
	cout <<"Press any key to continue..."<<endl ;
}
 
 
 
 
//**********************************************************
// THIS FUNCTION GIVE DATA FOR THE MODIFICATION OF THE
// EMPLOYEE RECORD
//**********************************************************
 
void EMPLOYEE :: MODIFICATION(void)
{
	char  ch, egrade, ehouse='N', econv='N' ;
	char  ename[26], eaddress[31], ephone[10], edesig[16], t1[10] ;
	float t2=0.0, eloan=0.0, ebasic=0.0 ;
	int   ecode, valid ;
	cout <<"&lt;0>=EXIT"<<endl ;
	cout <<"Enter code of the Employee  "<<endl ;
	cin>>ecode;
	if (ecode == 0)
		return ;
	if (!FOUND_CODE(ecode))
	{
		cout <<"\7Record not found"<<endl ;
		return ;
	}
	cout <<"&lt;0>=EXIT"<<endl ;
	cout <<"MODIFICATION OF THE EMPLOYEE RECORD"<<endl ;
	DISPLAY_RECORD(ecode) ;
	do
	{
		cout <<"Do you want to modify this record (y/n) "<<endl ;
	cin>>ch;	
	if (ch == '0')
		return ;
	} while (ch != 'Y' && ch != 'N') ;
	if (ch == 'N')
		return ;
	fstream file ;
	file.open("EMPLOYEE.TXT", ios::in) ;
	file.seekg(0,ios::beg) ;
	while (file.read((char *) this, sizeof(EMPLOYEE)))
	{
		if (code == ecode)
			break ;
	}
	file.close() ;
	cout <<"Employee Code # " <<ecode<<endl ;
	cout <<"~~~~~~~~~~~~~"<<endl ;
	cout <<"JOINING DATE : "<<endl ;
	cout <<"~~~~~~~~~~~~~~"<<endl ;
	cout <<dd <<"/" <<mm <<"/" <<yy ;
	cout <<"Name         : "<<endl ;
	cout <<"Address      : "<<endl ;
	cout <<"Phone no.    : "<<endl ;
	cout <<"Designation  : "<<endl ;
	cout <<"Grade        : "<<endl ;
	cout <<"Loan           : "<<endl ;
	do
	{
		valid = 1 ;
		cout <<"Enter the name of the Employee or <ENTER> FOR NO CHANGE" ;
		gets(ename);
	if (ename[0] == '0')
			return ;
		if (strlen(ename) > 25)
		{
			valid = 0 ;
			cout <<"\7Enter correctly (Range: 1..25)"<<endl ;
			}
	} while (!valid) ;
	if (strlen(ename) == 0)
	{
		strcpy(ename,name) ;
		cout <<ename<<endl ;
	}
	do
	{
		valid = 1 ;
		cout <<"Enter Address of the Employee or <ENTER> FOR NO CHANGE"<<endl ;
		gets(eaddress);	
		if (eaddress[0] == '0')
			return ;
		if (strlen(eaddress) > 30)
		{
			valid = 0 ;
			cout <<"\7Enter correctly (Range: 1..30)"<<endl ;
			
		}
	} while (!valid) ;
	if (strlen(eaddress) == 0)
	{
		strcpy(eaddress,address) ;
		cout <<eaddress<<endl ;
	}
	do
	{
		valid = 1 ;
		cout <<"Enter Phone no. of the Employee or or <ENTER> FOR NO CHANGE"<<endl ;
		gets(ephone);
		if (ephone[0] == '0')
			return ;
		if ((strlen(ephone) < 7 && strlen(ephone) > 0) || (strlen(ephone) > 9))
		{
			valid = 0 ;
			cout <<"\7Enter correctly"<<endl ;
			}
	} while (!valid) ;
	if (strlen(ephone) == 0)
	{
		strcpy(ephone,phone) ;
		cout <<ephone<<endl ;
	}
	do
	{
		valid = 1 ;
		cout <<"Enter Designation of the Employee or <ENTER> FOR NO CHANGE"<<endl ;
		gets(edesig);
	if (edesig[0] == '0')
			return ;
		if (strlen(edesig) > 15)
		{
			valid = 0 ;
			cout <<"\7Enter correctly (Range: 1..15)"<<endl ;
			}
	} while (!valid) ;
	if (strlen(edesig) == 0)
	{
		strcpy(edesig,desig) ;
		cout <<edesig<<endl ;
	}
	do
	{
		cout <<"Enter Grade of the Employee (A,B,C,D,E) or <ENTER> FOR NO CHANGE"<<endl ;
		cin>>egrade;
		if (egrade == '0')
			return ;
		if (egrade == 13)
		{
			egrade = grade ;
			cout <<grade<<endl ;
		}
	} while (egrade < 'A' || egrade > 'E') ;
	if (egrade != 'E')
	{
		cout <<"House (y/n)    : "<<endl ;
		cout <<"Convense (y/n) : "<<endl ;
		cout <<"Basic Salary   : "<<endl ;
		do
		{
			cout <<"ALLOTED HOUSE ALLOWANCE ? or <ENTER> FOR NO CHANGE"<<endl ;
			cin>>ehouse;			
			if (ehouse == '0')
				return ;
			if (ehouse == 13)
			{
				ehouse = house ;
				cout <<ehouse<<endl ;
			}
		} while (ehouse != 'Y' && ehouse != 'N') ;
		do
		{
			cout <<"ALLOTED CONVENCE ALLOWANCE or <ENTER> FOR NO CHANGE"<<endl ;
			cin>>econv;
			if (econv == '0')
				return ;
			if (econv == 13)
			{
				econv = convense ;
				cout <<econv<<endl ;
			}
		} while (econv != 'Y' && econv != 'N') ;
	}
	do
	{
		valid = 1 ;
		cout <<"ENTER LOAN AMOUNT or <ENTER> FOR NO CHANGE"<<endl ;
		cin>>eloan;
		if (eloan > 50000)
		{
			valid = 0 ;
			cout <<"\7SHOULD NOT GREATER THAN 50000"<<endl ;
			}
	} while (!valid) ;
	if (egrade != 'E')
	{
		do
		{
			valid = 1 ;
			cout <<"ENTER BASIC SALARY or <ENTER> FOR NO CHANGE"<<endl ;
			cin>>ebasic;
			if (ebasic > 50000)
			{
				valid = 0 ;
				cout <<"\7SHOULD NOT GREATER THAN 50000"<<endl ;
				}
		} while (!valid) ;
	}
	do
	{
		cout <<"Do you want to save (y/n) "<<endl ;
		cin>>ch;
		if (ch == '0')
			return ;
	} while (ch != 'Y' && ch != 'N') ;
	if (ch == 'N')
		return ;
	MODIFY_RECORD(ecode,ename,eaddress,ephone,edesig,egrade,ehouse,econv,eloan,ebasic) ;
	cout <<"\7Record Modified"<<endl ;
	cout <<"Press any key to continue..."<<endl ;
}
 
 
//**********************************************************
// THIS FUNCTION GIVE CODE NO. FOR THE DELETION OF THE
// EMPLOYEE RECORD
//**********************************************************
 
void EMPLOYEE :: DELETION(void)
{
	char t1[10], ch ;
	int t2, ecode ;
	cout <<"&lt;0>=EXIT"<<endl ;
	cout <<"Enter code of the Employee  "<<endl ;
	cin>>ecode;
	if (ecode == 0)
		return ;
	if (!FOUND_CODE(ecode))
	{
		cout <<"\7Record not found"<<endl ;
		return ;
	}
	cout <<"&lt;0>=EXIT"<<endl ;
	cout <<"DELETION OF THE EMPLOYEE RECORD"<<endl ;
	DISPLAY_RECORD(ecode) ;
	do
	{
		cout <<"Do you want to delete this record (y/n) "<<endl ;
		cin>>ch;
		if (ch == '0')
			return ;
	} while (ch != 'Y' && ch != 'N') ;
	if (ch == 'N')
		return ;
	DELETE_RECORD(ecode) ;
	cout <<"\7Record Deleted" <<endl;
	cout <<"Press any key to continue..."<<endl ;
	
}
 
 
//**********************************************************
// THIS FUNCTION RETURN 0 IF THE GIVEN DATE IS INVALID
//**********************************************************
 
int EMPLOYEE :: VALID_DATE(int d1, int m1, int y1)
{
	int valid=1 ;
	if (d1>31)
		valid = 0 ;
	else
	if (((y1%4)!=0 && m1==2 && d1>28) || ((y1%4)==0 && m1==2 && d1>29))
		valid = 0 ;
	else
	if ((m1==4 || m1==6 || m1==9 || m1==11) && d1>30)
		valid = 0 ;
	return valid ;
}
 
 
 
//**********************************************************
// THIS FUNCTION PRINTS THE SALARY SLIP FOR THE EMPLOYEE
//**********************************************************
 
void EMPLOYEE :: SALARY_SLIP(void)
{
	char t1[10] ;
	int t2, ecode, valid ;
	cout <<"&lt;0>=EXIT"<<endl ;
	cout <<"Enter code of the Employee  "<<endl ;
	cin>>ecode;
	if (ecode == 0)
		return ;
	if (!FOUND_CODE(ecode))
	{
		cout <<"\7Record not found"<<endl ;
		return ;
	}
	fstream file ;
	file.open("EMPLOYEE.TXT", ios::in) ;
	file.seekg(0,ios::beg) ;
	while (file.read((char *) this, sizeof(EMPLOYEE)))
	{
		if (code == ecode)
			break ;
	}
	file.close() ;
	int d1, m1, y1 ;
	cout<<"\nEnter date in numbers.......";
	cout<<"\nEnter day : ";
	cin>>d1;
	cout<<"\nEnter month : ";
	cin>>m1;
	cout<<"\nEnter year : ";
	cin>>y1;
	
	char mon[12][20]={"January","February","March","April","May","June","July","August","September","November","December"} ;
	cout <<"SAM'S PV T. LTD."<<endl ;
	cout <<"SALARY SLIP"<<endl ;
	cout <<"Date: \t" <<d1 <<"/" <<m1 <<"/" <<y1<<endl ;
	cout <<mon[m1-1] <<", " <<y1<<endl ;
	cout <<"Employee Name : " <<name<<endl ;
	cout <<"Designation   : " <<desig<<endl ;
	cout <<"Grade : " <<grade<<endl ;
	int days, hours ;
	if (grade == 'E')
	{
		do
		{
			valid = 1 ;
			cout <<"ENTER NO. OF DAYS WORKED IN THE MONTH "<<endl ;
			cout <<"No. of Days   : "<<endl ;
			cin>>days;
			if (!VALID_DATE(days,m1,y1))
			{
				valid = 0 ;
				cout <<"\7ENTER CORRECTLY                       "<<endl ;
				cout <<"                    " ;
			}
		} while (!valid) ;
		do
		{
			valid = 1 ;
			cout <<"ENTER NO. OF HOURS WORKED OVER TIME   "<<endl ;
			cout <<"No. of hours  : "<<endl ;
			cin>>hours;			
			if (hours > 8 || hours < 0)
			{
				valid = 0 ;
				cout <<"\7ENTER CORRECTLY                     "<<endl ;
				cout <<"                    " ;
			}
		} while (!valid) ;
		cout <<"                                               "<<endl ;
		cout <<"                        "<<endl ;
		cout <<"                        "<<endl ;
	}
	cout <<"Basic Salary         : Rs."<<endl ;
	cout <<"ALLOWANCE"<<endl ;
	if (grade != 'E')
	{
		cout <<"HRA  : Rs."<<endl ;
		cout <<"CA   : Rs."<<endl ;
		cout <<"DA   : Rs."<<endl ;
	}
	else
	{
		cout <<"OT   : Rs." <<endl;
	}
	cout <<"DEDUCTIONS"<<endl ;
	cout <<"LD   : Rs."<<endl ;
	if (grade != 'E')
	{
		cout <<"PF   : Rs."<<endl ;
	}
	cout <<"NET SALARY           : Rs."<<endl ;
	cout <<"CASHIER"<<endl ;
	cout <<"EMPLOYEE"<<endl ;
	float HRA=0.0, CA=0.0, DA=0.0, PF=0.0, LD=0.0, OT=0.0, allowance, deduction, netsalary ;
	if (grade != 'E')
	{
		if (house == 'Y')
			HRA = (5*basic)/100 ;
		if (convense == 'Y')
			CA  = (2*basic)/100 ;
		DA  = (5*basic)/100 ;
		PF  = (2*basic)/100 ;
		LD  = (15*loan)/100 ;
		allowance = HRA+CA+DA ;
		deduction = PF+LD ;
	}
	else
	{
		basic = days * 30 ;
		LD  = (15*loan)/100 ;
		OT  = hours * 10 ;
		allowance = OT ;
		deduction = LD ;
	}
	netsalary = (basic+allowance)-deduction ;
	cout <<basic ;
	if (grade != 'E')
	{
		cout <<HRA<<endl ;
		cout <<CA<<endl ;
		cout <<DA<<endl ;
		cout <<PF<<endl ;
	}
	else
	{
		cout <<OT<<endl ;
	}
	cout <<LD<<endl ;
	cout <<"Rs." <<allowance<<endl ;
	cout <<"Rs." <<deduction<<endl ;
	cout <<netsalary<<endl ;
		
}
 
 
//**********************************************************
// MAIN FUNCTION CALLING MAIN MENU
//**********************************************************
 
int main()
{
	  cout<<"JASMEET SINGH"<<endl;
	  cout<<"Class COMPUTER ."<<endl;
          cout<<"Presents"<<endl;
       	 char ch[100];
	 cout<<" PROJECT'2008...";
	 cout<<"in C++";
	 cout<<"press enter to continue";
	 cout<<"loading ";
	 for(int i=0;i<8;i++)
 	{
		 cout<<".";
 	}
 	 struct intro
 	{
	 char pro[20];
 	 char pronam[20];
 	 char dir[20];
 	 char dirnam[20];
 	 char gra[20];
 	 char graname[20];
 	 };
 
	MENU menu;
	menu.MAIN_MENU();
 	return 0;
}
