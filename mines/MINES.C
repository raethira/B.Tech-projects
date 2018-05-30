#include<stdio.h>
#include<graphics.h>
#include<conio.h>
void rect()
{  int i,j;
	  cleardevice();
	for(i=50;i<250;i+=20)
	{
		for(j=50;j<250;j+=20)
		{
			rectangle(i,j,i+20,j+20);
		}
	}
}
void main()
{
	int i,j;
	int gdriver = DETECT, gmode, errorcode;
	initgraph(&gdriver, &gmode, "");

	rect();
	getch();
}
