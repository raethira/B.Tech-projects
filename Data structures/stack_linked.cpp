#include <iostream>

using namespace std;

struct node
{
   int data;
   node *link;
};

class lstack
{
      private:
              node* top;

      public:
             lstack()
             {
             	top=NULL;
             }

             void push(int n)
             {
             	node *tmp;
             	tmp=new node;
             	if(tmp==NULL)
             	   cout<<"\nSTACK FULL";

             	tmp->data=n;
             	tmp->link=top;
             	top=tmp;
             }

             int pop()
             {
             	if(top==NULL)
             	{
             		cout<<"\nSTACK EMPTY";
             		return NULL;
             	}
                node *tmp;
                int n;
                tmp=top;
                n=tmp->data;
                top=top->link;
                delete tmp;
                return n;
             }

             ~lstack()
             {
             	if(top==NULL)
             	   return;

             	node *tmp;
             	while(top!=NULL)
             	{
             	   tmp=top;
             	   top=top->link;
             	   delete tmp;
             	}
             }
};

int main()
{
	lstack s;
	s.push(11);
	s.push(101);
	s.push(99);
	s.push(78);
	cout<<"Item Popped = "<<s.pop()<<endl;
	cout<<"Item Popped = "<<s.pop()<<endl;
	cout<<"Item Popped = "<<s.pop()<<endl;
	return 0;
}
