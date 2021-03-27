#include <iostream> // para: cout
#include <time.h>   // para: time()
#include <unistd.h>



using std::cout;
using std::cin;


int main ( )
{

  time_t tempo_real;
  
  int numero;

  tempo_real = time( (time_t *) 0);  // apontando o ponteiro para null.
  cout << "\n\n"<<"Já se passaram  " << tempo_real << " segundos desde 0:00:00 de 01/01/1970 " ;

  exit(0);
}

