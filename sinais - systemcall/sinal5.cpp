// UFRN-CT-DCA
// Disciplina: Sistemas de Tempo-Real
// Programa sinal5.cpp
// Sinais são eventos gerados pelo Unix em resposta a algumas condições, como:
//  erros, violação de memória, instrução ilegal, ...

#include <signal.h> // definição dos sinais de interrupções
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h> // system()


void detecao_alarme (int sig)
{
  printf("O sinal %d foi recebido: SIGALRM\n", sig);
}

int main()
{
  unsigned segundos;
  signal(SIGALRM, detecao_alarme); // interceptação do sinal
  printf("Gerando o alarme em 5s\n");
  segundos = alarm(5);
  //pause();
  printf("Valor retornado pela função alarm(): %d\n",segundos);
  printf("Vai entrar num loop infinito (CTRL-C para acabar)\n");
  while(1)
  {
    sleep(1);
    printf("Estou num loop infinito\n");
    printf("CTRL-C para me matar\n");
   }
  exit(0);
}
