// UFRN-CT-DCA
// Disciplina: Sistemas de Tempo-Real
// Programa vitima.cpp
// Sinais são eventos gerados pelo Unix em resposta a algumas condições, como:
//  erros, violação de memória, instrução ilegal, ...
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h> // system()

int main()
{
  int meu_pid;
  meu_pid = getpid();

  while (1)
  {
    printf("Meu PID é: %d \n", meu_pid);
    printf("Vou dormir por 2 segundos e esperar alguém me matar \n");
    sleep(2);
  }
  exit(0);
}
