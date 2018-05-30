
// Justin C. Miller
// created on 10-2-2001
// HASHING
// created for http://www.geocities.com/neonprimetime.geo/index.html

#ifndef data_H
#define data_H

#include <iostream>

using namespace std ;

class data{
	friend ostream &operator<<( ostream & output, const data & d){
		output << d.number ;
		return output ;
	}
private:
	int number ;
public:
	data(){}
	data(const data & x){
		number = x.number ;
	}
	const data &operator=(const data & x){
		number = x.number ;
		return *this ;
	}
	int getData(){return number;}
	void setData(int x){number= x;}
};

#endif