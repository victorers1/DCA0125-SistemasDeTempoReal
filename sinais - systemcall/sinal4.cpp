// UFRN-CT-DCA
// Disciplina: Sistemas de Tempo_real
// Programa sinal4.cpp
// Sinais são eventos gerados pelo Unix em resposta a algumas condições, como:
//  erros, violação de memória, instrução ilegal, ...

#include <signal.h> // definição dos sinais de interrupções
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h> // system()


void alarme (int sig)
{
  printf("Alarme foi desligado. \n");
 
}

int main()
{
  // o processo filho espera por 5 segundos antes de enviar um sinal SIGALRM para seu pai

  int pid;
 

  printf("O alarme foi disparado. \n");

  if ( (pid = fork()) == 0)
  {
    // código do processo filho
    printf("\n\n            Execução do Filho- vai dormir por 5 segundos\n");
    sleep(5);
    kill(getppid(), SIGALRM);
    printf("            Execução do Filho- filho vai morrer\n\n");
    exit(0);
  }
  printf("Pai esperando pelo Sinal de alarme desligar (5s). \n");
    
  // (void) signal(SIGALRM, alarme);
  // kill(getpid(), SIGALRM);
  printf(" Após a função signal()\n");
  pause();
  printf("O sinal de alarme chegou ao Pai .\n");
  exit(0);
  
  // exit(0);
}




