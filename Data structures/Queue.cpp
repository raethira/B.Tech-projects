#include <iostream>
using namespace std;
#define MAX 5           // MAXIMUM CONTENTS IN QUEUE


class queue
{
 private:
 	int t[MAX];
 	int al;      // Addition End
 	int dl;      // Deletion End

 public:
  queue()
  {
  	dl=-1;
  	al=-1;
  }

  void del()
  {
     int tmp;
     if(dl==-1)
     {
	    cout<<"Queue is Empty";
     }
     else
     {
		for(int j=0;j<=al;j++)
		{
	  		if((j+1)<=al)
	  		{
	  			tmp=t[j+1];
	  			t[j]=tmp;
	  		}
	  		else
	  		{
	  			al--;
                if(al==-1)
                    {
                        dl=-1;
                    }
                else
                {
                    dl=0;
                }
	  		}
		}
     }
  }

void add(int item)
{
 	if(dl==-1 && al==-1)
 	{
  		dl++;
  		al++;
 	}
   else
   {
  		al++;
  		if(al==MAX)
   	{
			cout<<"Queue is Full\n";
			al--;
			return;
  		}
 	}
 	t[al]=item;

}

  void display()
  {
  	if(dl!=-1)
   {
   	for(int iter=0 ; iter<=al ; iter++)
      	cout<<t[iter]<<" ";
   }
   else
   	cout<<"EMPTY";
  }

};

int main()
{
 queue a;
 int data[5]={32,23,45,99,24};

 cout<<"Queue before adding Elements: ";
 a.display();
 cout<<endl<<endl;

 for(int iter = 0 ; iter < 5 ; iter++)
 {
   a.add(data[iter]);
   cout<<"Addition Number : "<<(iter+1)<<" : ";
   a.display();
   cout<<endl;
 }
 cout<<endl;
 cout<<"Queue after adding Elements: ";
 a.display();
 cout<<endl<<endl;
int iter;
 for(iter=0 ; iter < 5 ; iter++)
 {
   a.del();
   cout<<"Deletion Number : "<<(iter+1)<<" : ";
   a.display();
   cout<<endl;
 }
 return 0;
}

