// Justin C. Miller
// created on 10-2-2001
// HASHING
// created for http://www.geocities.com/neonprimetime.geo/index.html

#include <iostream>
#include <cstdlib>
#include <ctime>
#include <fstream>

#include "data.h"
#include "hash.h"

using namespace std ;

int main(){
	srand(time(0)) ;
	int sizeOfHashTable = 11 ;
	int numberOfData = 12 ;

	data a ;

	hashTable<data> x(sizeOfHashTable) ;

	x.printTable() ;

	for(int i = 0 ; i < numberOfData ; i++){
		system("pause") ;
		system("cls") ;
		a.setData(rand() % 99 + 1) ;
		x.insert(a) ;
		x.printTable() ;
	}
	cout << "Finished Hashing" << endl ;
	system("pause") ;
	return 0 ;
}