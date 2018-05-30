#include<iostream>
using namespace std;
class stack
{
    int s[100];
    int capacity,top;
public:
void init(int t,int c)
{
    capacity = c;
    top = t;
}
int isFull()
{
    if (top == capacity-1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
int isEmpty()
{
    if (top == -1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
void push(int data)
{
    if (isFull() == 1)
    {
         cout<<"\nStack Full!";
    }
    else
    {
        s[++top] = data;
    }
}
int pop()
{
    int temp=0;
    if (isfull() == 0)
    {
        temp = s[top];
        top--;
        return temp;
    }
    else
    {
        cout<<"\nStack is Empty";
        return 0;
    }
}
};
int main()
{
stack obj;
int data,limit;
cout<<"\nEnter the no of elements to be pushed:";
cin>>limit;
obj.init(-1,limit);
obj.isFull();
cout<<"\nEnter the Elements to be pushed onto stack:";
for(int i=0;i<limit;i++)
{
    cin>>data;
    obj.push(data);
}
obj.isEmpty();
cout<<"\nPOP!:";
for(int i=0;i<limit;i++)
{
    cout<<obj.pop()<<"\n";
}
return 0;
}
