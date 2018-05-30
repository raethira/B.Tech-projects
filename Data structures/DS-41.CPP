
 /**************************************************************************
  **************************************************************************

  A C++ Program to show an example of Hashing using Mid-Square Method.

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

 /*************************************************************************/
 /*************************************************************************/
 //---------------------------  Header Files  ----------------------------//
 /*************************************************************************/
 /*************************************************************************/

 # include <iostream.h>
 # include <string.h>
 # include <stdlib.h>
 # include <conio.h>
 # include <math.h>

 /*************************************************************************/
 /*************************************************************************/
 //------------------------------  main( )  ------------------------------//
 /*************************************************************************/
 /*************************************************************************/

 int main( )
 {
    clrscr( );

    cout << endl << "Mid-Square Hashing Method" << endl;
    cout << "*************************" << endl << endl;

    unsigned int iNumber = 0;
    unsigned int iLimit = 0;

    cout << "Enter the Number = N = ";
    cin >> iNumber;

    cout << endl << "Enter the Limit = K = ";
    cin >> iLimit;

    unsigned long lNumber = powl(iNumber, 2);

    char sNumber[50] = {NULL};

    ultoa(lNumber, sNumber, 10);

    int iCount = (strlen(sNumber) - iLimit);
    int iLength = 0;

    char sTemp[30] = {NULL};

    cout << endl << "K * K = "<< lNumber << endl;

    for (int i = 0; i < iCount; i ++)
    {
       iLength = (strlen(sNumber) - 1);

       if ( (i % 2) == 0)
       {
	  strset(sTemp, NULL);
	  strncpy(sTemp, sNumber, iLength);

	  strset(sNumber, NULL);
	  strcpy(sNumber, sTemp);
       }

       else
       {
	  strrev(sNumber);
	  strset(sTemp, NULL);
	  strncpy(sTemp, sNumber, iLength);
	  strrev(sTemp);

	  strset(sNumber, NULL);
	  strcpy(sNumber, sTemp);
       }
    }

    int iHashKey = atoi(sNumber);

    cout << endl << "Hashing Key = " << iHashKey;

    getch( );
    return 0;
 }

 /*************************************************************************/
 /*************************************************************************/
 //-----------------------------  THE END  -------------------------------//
 /*************************************************************************/
 /*************************************************************************/

