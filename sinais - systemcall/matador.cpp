// UFRN-CT-DCA
// Disciplina: Sistemas de Tempo-Real
// Programa vitima.cpp
// Sinais são eventos gerados pelo Unix em resposta a algumas condições, como:
//  erros, violação de memória, instrução ilegal, ...

#include <signal.h> // definição dos sinais de interrupções
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h> // system()



int  main()
{
  // o processo que vai motar

  int meu_pid=99;
  int pid_vitima=4213;

  meu_pid = getpid();
    

  
 printf( "Eu sou um programa matador de programa \n" );
 printf( "Meu PID é:  %d\n", meu_pid);
 printf( "Digite o pid do processo que deve morrer: ");
 scanf( "%d", &pid_vitima);
 printf("\n Vou matar o processo %d \n", pid_vitima);
  
 kill(pid_vitima, SIGKILL);
 printf( "\nAgora posso morrer\n");
 exit(0);
}
