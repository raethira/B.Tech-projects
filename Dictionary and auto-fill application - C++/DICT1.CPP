#include<iostream.h>
#include<graphics.h>
#include<dos.h>
#include<string.h>
#include<stdlib.h>
#include<stdio.h>
#include<conio.h>

struct data
{
	char word[20];
	char meaning[50];
};


struct trie
{
	struct trie *child[26];
	struct data *ptr;
};

struct trie *insert(struct trie* node, char *val, int len, int count)
{
	if( node == NULL)
	{
		node = (struct trie*)malloc(sizeof(struct trie));

		for(int i=0; i<26 ; i++)
		{
			node -> child[i] = NULL;
		}
	}

	if(count < len)
	{
		int temp = (int)(*(val+count))-65; 
	
		node->child[temp] = insert(node->child[temp], val, len, (count+1) );
		node->ptr = NULL;
	}

	else
	{
		node->ptr = (struct data*)malloc( sizeof(struct data) );
		strcpy(node->ptr->word,val);
		printf(" Enter Meaning : " );
		gets(node->ptr->meaning);
	}

	return node;
}


struct trie *search(struct trie* node, char *val, int len, int count)
{
	if( node == NULL)
	{
		printf("\n !!Word does not exist!!");
	}

	else if(count < len)
	{
		int temp = (int)(*(val+count))-65;
	
		node->child[temp] = search( node->child[temp], val, len, (count+1) );
	}

	else if(node->ptr == NULL)
	{
		printf("\n !!Word does not exist!!");
	}
	else
	{
		printf("\n\n !!Word Exists!!");
		printf("\n Word : %s", node->ptr->word );
		printf("\n Meaning : %s\n", node->ptr->meaning );
	}
	
	getch();

	return node;

}

struct trie *del(struct trie* node, char *val, int len, int count)
{
	if( node == NULL)
	{
		printf("\n !!Word does not exist!!");
	}

	else if(count < len)
	{	
		int temp = (int)(*(val+count))-65;
		node->child[temp] = del( node->child[temp], val, len, (count+1) );
	}

	else if(node->ptr == NULL)
	{
		printf("\n !!Word does not exist!!");
	}
	
	else
	{
		free(node->ptr);
		node->ptr=NULL;
		printf("\n !!Word Deleted!! ");
	}

	getch();
	return node;
}


void prog()
{
	char val[26],ch;
	int i;
	struct trie *root = NULL;

	do
	{
		clrscr();
		textmode(C80);
		gotoxy(30,5);
		textcolor(12);
		cprintf("THE COMPUTER DICTIONARY");
		gotoxy(23,8);
		textcolor(15);
		cprintf("1. Insert an element");
		gotoxy(23,10);
		cprintf("2. Search a Node");
		gotoxy(23,12);
		cprintf("3. Delete a Node");
		gotoxy(23,14);
		cprintf("4. Exit");
		gotoxy(23,16);
		cprintf("Enter Your Choice");

		ch=getch();
		switch(ch)
		{
		case '1':
					clrscr();
					printf("\n\n Enter Word : ");
					gets(val);
					i=strlen(val);
					root = insert(root, val, i,0);
					break;

		case '2':
					clrscr();
					printf("\n\n Enter the Word to Search : ");
					gets(val);
					i=strlen(val);
					root = search(root, val, i, 0);
					break;

		case '3':
					clrscr();
					printf("\n\n Enter the Word to Delete : ");
					gets(val);
					i=strlen(val);
					root = del(root, val, i, 0);
					break;

		case '4':
					clrscr();
					textcolor(2);
					gotoxy(26,10);
					cprintf("QUITING THE DICTIONARY");
					for(int i=0;i<=3;i++)
					{
					cprintf(".");
					delay(250);
					}
					return;

		default:
					clrscr();
					printf("\n\n !!WRONG CHOICE!!\n");
		}
	
	
	}while(1);
}


void main()
{
	clrscr();
	prog();
}