




// UFRN-CT-DCA
// Disciplina: Sistemas de Tempo Real
// Programa: alocar_cpu.cpp


#include  <time.h>
#include <iostream> // para: cout
#include <stdio.h>
#include <unistd.h>  // para: sleep()
#include <stdlib.h>
#include <math.h>

#include <sys/time.h>     // getpriority(int which, int who)  setpriority(int which, int who, int prio);
#include <sys/resource.h>

#define _GNU_SOURCE
#include <sched.h>   // para alocar CPU

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

    
    
    
    // ---- Alocação de CPU  ---------
    cpu_set_t  mask;
    CPU_ZERO(&mask);
    
    
    CPU_SET(0, &mask);    // alocar na CPU 0
    
    //CPU_SET(1, &mask);
    //CPU_SET(2, &mask);
    //CPU_SET(3, &mask);
    
    int result = sched_setaffinity(0, sizeof(mask), &mask);  // 0 --> Aqui é no próprio processo. No Geral deve ser o PID
    
    // ---------------------------------------------------------------------------------
    //
    //  Parte do código associada com uso intenso de CPU : início
    //
    //  --------------------------------------------------------------------------------
    
     time_1 = clock();
     real_time_1 = time(0);
     carga(50000);       // funcão de uso intenso de CPU
     sleep(6);
     real_time_2 = time(0);
     time_2 = clock();

    //  --------- Fim da parte de uso de CPU ------------------------
    
    
    saida = (int) (time_2) - (time_1);  // tempo de CPU
    saida2 = (double) ((saida) / (double) CLOCKS_PER_SEC) ;
    delta_real_time = (real_time_2) - (real_time_1);
    
    printf("\n Tempo de uso da CPU em microsegundos: %d \n", saida);
    printf(" Tempo de uso da CPU em segundos: %f \n", saida2);
    printf(" Tempo Real decorrido em microsegundos: %d \n", (int) delta_real_time);
    cout << "\n\n  valor da prioridade do processo - final: " << getpriority(PRIO_PROCESS, 0 ) <<endl;
    
    // ---------------------------------------------------------------------------------
    //
    //  Parte do código associada com uso intenso de CPU : fim
    //
    //  --------------------------------------------------------------------------------
    
    
    
    exit(1);

}

