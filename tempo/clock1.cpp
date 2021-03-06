


// UFRN-CT-DCA
// Disciplina: Sistemas de Tempo Real
// Programa: prioridade.cpp


#include  <time.h>
#include <iostream> // para: cout
#include <stdio.h>
#include <unistd.h>  // para: sleep()
#include <stdlib.h>
#include <math.h>

#include <sys/time.h>     // getpriority(int which, int who)  setpriority(int which, int who, int prio);
#include <sys/resource.h>

//using std::cout;
using namespace std;


// função para simular carregamento da CPU
void carga(int k)
{
  float f = 0.999999;
  for(int i=0; i<k; i++)
    {
      f = f*f*f*f*f;
      f = 1.56;
        for(int j=0; j<k; j++)
           {
	     f = sin(f)*sin(f)*f*f*f;

            }
    }

}


int main( ){

     clock_t time_1, time_2;
     time_t  real_time_1, real_time_2, delta_real_time;
    
     int saida;
     double saida2;
    
    
     time_1 = clock();
     real_time_1 = time(0);
     carga(10000);
     sleep(1);
     real_time_2 = time(0);
     time_2 = clock();

    
    saida = (int) (time_2) - (time_1);  // tempo de CPU
    saida2 = (double) ((saida) / (double) CLOCKS_PER_SEC) ;
    delta_real_time = (real_time_2) - (real_time_1);
    
    printf("\n Tempo de uso da CPU em microsegundos: %d \n", saida);
    printf(" Tempo de uso da CPU em segundos: %f \n", saida2);
    printf(" Tempo Real decorrido em microsegundos: %d \n", (int) delta_real_time);
    
    
    exit(1);

}

