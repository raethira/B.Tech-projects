/*									PROJECT ON C-MAIL
  DATE: 02/05/2012


											  DONE BY:

													PRIVIN-38
													RAHUL-39
													RAMKUMAR-42
													VARUN KUMAR-58
													VARUN REDDY-62
*/


#include<stdio.h>
#include<string.h>



struct address
{
	int dn,pin;
	char st[30],cl[30],ds[30],co[30];
};


struct date
{
	int mm,dd,yy;
};



struct bio
{
	int ph;
	char fn[30],ln[30],un[20];
	char ps[30];
	struct address ad;
	struct date b;
};





int check(char un[])//to check the username exists or not
{
	struct bio s1;
	int m=0;
	FILE *fp;
	fp=fopen("mail.txt","r");
	while(fread(&s1,sizeof(struct bio),1,fp))
		if(!strcmp(s1.un,un))
			m=1;
	fclose(fp);
	if(m==1)
		printf("\nUser name already exists\nRe-enter the username:\n");
	return(m);
}




void gead(struct bio a)			//for inputing address
{
	printf("\n\tDoor no. : ");
	scanf(" %d",&a.ad.dn);
	printf("\n\tStreet : ");
	scanf(" %s",a.ad.st);
	printf("\n\tDistrict : ");
	scanf(" %s",a.ad.ds);
	printf("\n\tCity : ");
	scanf(" %s",a.ad.cl);	
	printf("\n\tPin code : ");
	scanf(" %d",&a.ad.pin);
	printf("\n\tCountry : ");
	scanf(" %s",a.ad.co);
}





void signup()		//to sign up
{	struct bio a;
	printf		("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	\n\t\t\t\t\t\t\t\t\tSIGN UP\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
		
		
	printf("\nFirst Name :  ");
	scanf(" %s",a.fn);
	printf("\nLast Name : ");
	scanf(" %s",a.ln);
	printf("\nDate of Birth(dd/mm/yy):");
	scanf(" %d/%d/%d",&a.b.dd,&a.b.mm,&a.b.yy);
	printf("\nAddress");
	printf("\n-------\n");
	gead(a);
	printf("\nPhone number : ");
	scanf(" %d",&a.ph);	


	do
	{
		printf("\nUser name : ");
		scanf("%s",a.un);
	}while(check(a.un));



	int i=0,xyz;
	char abc[30],def[30];
	char *q,*ab;


	do
	{	
		xyz=0;
		q=getpass("\nPassword  :");
		for(i=0;*(q+i)!='\0';i++)
			abc[i]=*(q+i);
		abc[i]='\0';

		ab=getpass("\nConfirm Password  :");
		for(i=0;*(ab+i)!='\0';i++)
			def[i]=*(ab+i);
		def[i]='\0';
		if(strcmp(abc,def))
		{
			printf("\nThe Password does not match\n");
			xyz=1;
		}
	
	}while(xyz);
	
	for(i=0;*(q+i)!='\0';i++)
		a.ps[i]=*(q+i);
	a.ps[i]='\0';

	FILE *fp;
	fp=fopen("mail.txt","a");
	fwrite(&a,sizeof(struct bio),1,fp);
	fclose(fp);

	
	fp=fopen(a.un,"w");
	fclose(fp);	
	printf("\n\t\t\t\t You have successfully signed up  \n");
}




void signin()//to sign in
{       
			printf("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\t\t\t\t\t\t\t\t\tSIGN IN\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");	
	
	struct bio a;
	int c,i,s=1;
	char un[30],ch[30],p[30],y;
	char *q;
	printf("\nUsername\t:");
	scanf(" %s",un);
	q=getpass("\nPassword  :");
	for(i=0;*(q+i)!='\0';i++)
		p[i]=*(q+i);
	p[i]='\0';	
	int m=0;
	FILE *fp;
	fp=fopen("mail.txt","r");
	while(fread(&a,sizeof(struct bio),1,fp))
		if(!strcmp(a.un,un))
		{
			m=1;
			break;
		}
	fclose(fp);
	if(m==1 && !strcmp(a.ps,p))
	{
		char to[20],msg[200];
		printf("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");	
		printf("Hi, %s %s",a.fn,a.ln);	
		printf("\t\nUsername\t: %s",a.un);
		printf("\t\nPhone number : %d",a.ph);
		printf("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\t\t\t\t\t\t\t\t\tMAIL\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
		while(s==1)
		{	
			char b[300]=" inmsg ",qw[300]=" sentmsg ";
			printf("\n\n1.Inbox\n");
			printf("2.Sent items\n");
			printf("3.Compose mail\n");
			printf("4.Sign out\n");

			printf("\nEnter your choice\t:");
			scanf(" %d",&c);	
			switch(c)
			{
				case 1:	
					{
						fp=fopen(a.un,"r");
						i=0;
						while(c=getc(fp)!=EOF)
						{
		                        		fscanf(fp,"%s",ch);
							if(!strcmp(ch,"inmsg"))
							{
								i++;
								printf("\n\nMessage %d\nFrom :",i);
								fscanf(fp,"%s",ch);
								printf("%s\n\n",ch);
							}

							else if(!strcmp(ch,"sentmsg"))
							{
								do
								{
									fscanf(fp,"%s",ch);
								}while(strcmp(ch,"***"));
							}
							else if(!strcmp(ch,"***"))
								printf("");
							else
								printf("%s ",ch);
				
						}
						fclose(fp);
						if(i==0)
							printf("\nNo message\n");
					}
					break;


				case 2:
					{
						fp=fopen(a.un,"r");
						i=0;
						while(c=getc(fp)!=EOF)
						{	
							fscanf(fp,"%s",ch);
							if(!strcmp(ch,"sentmsg"))
							{
								i++;
								printf("\n\nMessage %d\nSent To :",i);
								fscanf(fp,"%s",ch);
								printf("%s\n\n",ch);
							}

							else if(!strcmp(ch,"inmsg"))
							{
								do
								{
									fscanf(fp,"%s",ch);
								}
								while(strcmp(ch,"***"));
							}

							else if(!strcmp(ch,"***"))
								printf("");

							else
								printf("%s ",ch);
				
						}
						fclose(fp);
						if(i==0)
							printf("\nNo message\n");
					}			
					break;


				case 3:
					{
				
						printf("To : \t");
						scanf(" %s",to);

						printf("Message : \n");
						scanf(" %[^\n]",msg);

	
						strcat(qw,to);
						strcat(qw," ");
						strcat(qw,msg);
						strcat(qw," ***");


						FILE *fp;
						fp=fopen(a.un,"a");
						fprintf(fp,"%s",qw);
						fclose(fp);

				
						strcat(b,a.un);
						strcat(b," ");
						strcat(b,msg);
						strcat(b," ***");


						fp=fopen(to,"a");
						fprintf(fp,"%s",b);
						fclose(fp);
						printf("\n\nMessage successfully sent\n\n\n");
					}
					break;
				
				case 4:
					{
						s=0;
						printf("\n\t\t\t\tYou have successfully signed out\n\n");
																	
					}
					break;
				default:
					printf("\nWrong choice entered");
			}
		}

	}
	else
		printf("User Name or Password you have entered is incorrect\n");


	
	
}






void main()
{
	printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\t\t\t\t\t\t\t\t\tC-MAIL\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
	int m=1,ch;
	while(m)
	{
		printf("\n\n1.Sign in\n2.Sign up\n3.Exit\nEnter your choice : ");
		scanf(" %d",&ch);
		switch(ch)
		{
			case 1:signin();
				break;
			case 2:signup();
				break;
			case 3:m=0;
				break;
			default:
				printf("Wrong choice entered\n");
		}
	}

}

