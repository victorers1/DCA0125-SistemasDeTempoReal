// UFRN-CT-DCA
// Disciplina: Sistemas Operacionais
// Programa: sistema.c

#include <stdlib.h>
#include <stdio.h>

int main()
{
    printf("Rodando o comando ps com system(): Início \n");

    system("g++ sleep.cpp -o sleep");
    system("./sleep ");
    printf("Terminou o primeiro sleep\n");

    system("./sleep &");
    printf("Executou o segundo sleep\n\n\n");

    system("ps -axf | grep sleep ");
    printf("Rodando o comando ps com system(): Fim \n");
    exit(0);
}
