/////\// UFRN-CT-DCA
// Disciplina: SSistemas de Tempo-Real
// Programa: sleep.c


#include <iostream> // para: cout
#include <stdio.h>
#include <unistd.h> // para: sleep()


using std::cout;

//using namespace std;


int main ( )
{

  double x = 1;
  //while(1);
    //sleep(100000);
  for(int i=0; i<5; i++) {
   sleep(i);
   cout << "i = " << i <<'\n';
  }
    
//for(int j = 0; j<9000000000000; ++)
  cout << "teste" <<'\n';
  return(0);
}

