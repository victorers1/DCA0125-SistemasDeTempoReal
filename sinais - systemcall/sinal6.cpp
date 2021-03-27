// UFRN-CT-DCA
// Disciplina: Sistemas de Tempo-Real
// Programa sinal6.cpp
// Sinais são eventos gerados pelo Unix em resposta a algumas condições, como:
//  erros, violação de memória, instrução ilegal, ...

#include <signal.h> // definição dos sinais de interrupções
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h> // system()


void detecao_alarme (int sig)
{
  printf("O sinal %d foi recebido: SIGALRM\n", sig);
  printf("Vontando para o programa principal\n");
}

void  detecao_interrupcao(int sig)
{
  printf("Recepção do sinal %d: SIGINT\n", sig);
  printf("Por isto vou morrer!\n");
  exit(1);
}

int main()
{
  unsigned segundos;
  signal(SIGINT, detecao_interrupcao); // interceptação do sinal de interrupção
  signal(SIGALRM, detecao_alarme); // interceptação do sinal ALARME
  printf("Gerando o alarme em 10s\n");
  segundos = alarm(10);
  printf("Valor retornado pela função alarm(): %d\n",segundos);
  printf("Vou dormir por 3s\n");
  sleep(3);
  printf("Se passaram 3s. Agora vou armar um alarme para 5s\n");
  segundos = alarm(5);
  //segundos = alarm(10);
  printf("Novo valor retornado pela função alarm(): %d\n",segundos);
  printf("Vai entrar num loop infinito (CTRL-C para acabar)\n");
  while(1)
  {
    sleep(1);
    printf("Estou num loop infinito\n");
    printf("CTRL-C para me matar\n");
   }
  exit(0);
}
