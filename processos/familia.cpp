/**
 * Programa Família: 1 ano corresponde a 1 segundo
 * 
 * O processo pai nasce e morre aos 60 anos
 * O pai tem um filho aos 14 anos
 * O pai tem outro filho aos 16 anos
 * O filho 1 tem seu primeiro filho aos 12 anos (neto 1)
 * O filho 2 tem seu primeiro filho aos 14 anos (neto 2)
 * O primeiro e segundo filhos morrem com 30 anos
 * O neto 1 morre aos 12 anos e o neto 2 morre aos 18 anos
 */

#include <sys/types.h>
#include <unistd.h>
#include <cstdio>
#include <cstdlib>
#include <iostream>

using namespace std;

void grandson1()
{
    const auto YEARS_TO_LIVE = 6;

    sleep(YEARS_TO_LIVE);
    cout << "Neto 1 (" << getpid() << ") morre aos " << YEARS_TO_LIVE << " anos\n";
    exit(1);
}

void grandson2()
{
    const auto YEARS_TO_LIVE = 9;

    sleep(YEARS_TO_LIVE);
    cout << "Neto 2 (" << getpid() << ") morre aos " << YEARS_TO_LIVE << " anos\n";
    exit(1);
}

void son1()
{
    const auto YEARS_BEFORE_SON = 6;
    const auto YEARS_AFTER_SON = 9;
    sleep(YEARS_BEFORE_SON);
    pid_t pid = fork();
    switch (pid)
    {
    case -1:
        cout << "Criacao do neto 1 falhou\n";
        exit(1);
        break;
    case 0:
        cout << "Filho 1 tem neto 1 (" << getpid() << ") aos " << YEARS_BEFORE_SON << " anos\n"; // TODO imprimir PID do neto1
        grandson1();
        break;
    default:
        sleep(YEARS_AFTER_SON);
        cout << "Filho 1 morre aos " << YEARS_AFTER_SON + YEARS_BEFORE_SON << " anos\n";
        exit(1);
        break;
    }
}

void son2()
{
    const auto YEARS_BEFORE_SON = 7;
    const auto YEARS_AFTER_SON = 8;

    sleep(YEARS_BEFORE_SON);
    pid_t pid = fork();
    switch (pid)
    {
    case -1:
        cout << "Criacao do neto 2 falhou\n";
        exit(1);
        break;
    case 0:
        cout << "Filho 2 tem neto 2 (" << getpid() << ") aos " << YEARS_BEFORE_SON << " anos\n";
        grandson2();
        break;
    default:
        sleep(YEARS_AFTER_SON);
        cout << "Filho 2 morre aos " << YEARS_AFTER_SON + YEARS_BEFORE_SON << " anos\n";
        exit(1);
        break;
    }
}

void father()
{
    const auto YEARS_BEFORE_SON1 = 7;
    const auto YEARS_BEFORE_SON2 = 1;
    const int YEARS_AFTER_SON2 = 22;

    cout << "Pai nasce com PID " << getpid() << "\n";

    sleep(YEARS_BEFORE_SON1);
    pid_t pid1 = fork();
    switch (pid1)
    {
    case -1:
        cout << "Criacao do filho1 falhou\n";
        exit(1);
        break;
    case 0:
        cout << "Pai tem filho 1 (" << getpid() << ") aos " << YEARS_BEFORE_SON1 << " anos\n";
        son1();
        break;
    default:
        sleep(YEARS_BEFORE_SON2);
        pid_t pid2 = fork();

        switch (pid2)
        {
        case -1:
            cout << "Criacao do filho 2 falhou\n";
            exit(1);
            break;
        case 0:
            cout << "Pai tem filho 2 (" << getpid() << ") aos " << YEARS_BEFORE_SON1 + YEARS_BEFORE_SON2 << " anos\n";
            son2();
            break;

        default:
            sleep(YEARS_AFTER_SON2);
            cout << "Pai morre aos " << YEARS_BEFORE_SON1 + YEARS_BEFORE_SON2 + YEARS_AFTER_SON2 << " anos \n";
            exit(1);
            break;
        }
        break;
    }
}

int main()
{
    father();
    return 0;
}
