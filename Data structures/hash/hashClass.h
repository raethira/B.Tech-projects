// Justin C. Miller
// created on 10-2-2001
// HASHING
// created for http://www.geocities.com/neonprimetime.geo/index.html

#ifndef hash_h
#define hash_h

const int EMPTY = 0 ;
const int TOMBSTONE = -1 ;
const int OCCUPIED = 1 ;

template <class record>
class hashTable{
private:
	record * table ;
	int * tableContents ;
	int numberRecords ;
	int recordSpace ;

	int hash(record r){
		return r.getData() % recordSpace ;
	}
public:
	hashTable(int recSpace){
		numberRecords = 0 ;
		recordSpace = recSpace ;
		table = new record[recordSpace] ;
		tableContents = new int[recordSpace] ;
		for(int i = 0 ; i < recordSpace ; i++)
			tableContents[i] = EMPTY ;
	}
	bool quadraticCollision(record r, int hashSpot){
		int pos = hashSpot ;
		int counter = 1 ;
		while(counter <= (recordSpace / 2)){
			pos = hashSpot + counter * counter ;
			if(pos >= recordSpace)
				pos = pos % recordSpace ;
			cout << r.getData() << " wanted " << pos << endl ;
			if(tableContents[pos] == OCCUPIED)
				counter++ ;
			else{
				table[pos] = r ;
				counter = recordSpace ;
				tableContents[pos] = OCCUPIED ;
				cout << r.getData() << " got " << pos << endl ;
				return true ;
			}
		}
		if(counter > (recordSpace / 2)){
			counter = 1 ;
			while(counter <= (recordSpace / 2)){
				pos = hashSpot - counter * counter ;
				if(pos <= 0)
					pos = abs(pos % recordSpace) ;
				cout << r.getData() << " wanted " << pos << endl ;
				if(tableContents[pos] == OCCUPIED)
					counter++ ;
				else{
					table[pos] = r ;
					counter = recordSpace ;
					tableContents[pos] = OCCUPIED ;
					cout << r.getData() << " got " << pos << endl ;
					return true ;
				}
			}
		}
		cout << "Hash Table is Full!" << endl ;
		return false ;
	}	
	bool linearCollision(record r, int hashSpot){
		int pos = hashSpot + 1;
		if(pos >= recordSpace)
			pos = 0 ;
		while(tableContents[pos] == OCCUPIED && pos != hashSpot){
			cout << pos << endl ;
			pos++ ;
			if(pos >= recordSpace)
				pos = 0 ;
		}
		if(tableContents[pos] == OCCUPIED){
			cout << "Hash Table is Full!" << endl ;
			return false ;
		}	
		else{
			cout << "using linear collision:" << r.getData() << " was placed in " << pos << endl ;
			table[pos] = r ;
			tableContents[pos] = OCCUPIED ;
		}

		return true ;
	}
	bool insert(record r){
		int hashSpot = hash(r) ;
		if(tableContents[hashSpot] != OCCUPIED){
			cout << r.getData() << " was hashed to " << (hashSpot) << "\n\n" ;
			table[hashSpot] = r ;
			tableContents[hashSpot] = OCCUPIED ;
		}
		else{
			cout << "Collision, " << r.getData() << " wanted " << hashSpot << "\n\n" ;
			//if(linearCollision(r, hashSpot) == false)
			//	return false ;
			if(quadraticCollision(r,hashSpot) == false)
				return false ;
		}
		return true ;
	}
	void printTable(){
		cout << "Hash Table" << endl ;
		for(int i = 0 ; i < recordSpace ; i++)
			if(tableContents[i] == OCCUPIED)
				cout << "Pos:" << (i) << " ->" << table[i] << endl ;
			else
				cout << "Pos:" << (i) << " ->EMPTY" << endl ;
	}
};

#endif