/*
 *  ordenacao.cpp
 *  
 *
 *  Created by Luiz Affonso Guedes on 06/03/17.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

// UFRN-CT-DCA
// Programa: programa para ordenação de um vetor

// Manipulação de tempo em c,c++
// Programa: programa que usa manipuladores de tempo para
// medir o desempenho de algoritmos de ordenação

#include <iostream>
#include <cstdlib>	  //qsort
#include <time.h>	  // clock(),time()
#include <sys/time.h> // para gettimeofday()
#include <unistd.h>	  // para: sleep()
#include <stdio.h>	  // printf()
#include <stdlib.h>	  // exit()

using namespace std;

//Vetores usados pelos métodos de ordenação
int *vetorQuickSort;
int *vetorBubbleSort;
int tamanho;

//Função usada pelo qsort para comparar dois numeros
int compare_ints(const void *a, const void *b)
{
	int *arg1 = (int *)a;
	int *arg2 = (int *)b;
	if (*arg1 < *arg2)
		return -1;
	else if (*arg1 == *arg2)
		return 0;
	else
		return 1;
}

//Algoritmos de ordenação bubble sort
void bubbleSort(int *vetor, int tamanho)
{
	int aux;
	for (int i = 0; i < tamanho - 1; i++)
	{
		for (int j = 0; j < tamanho - 1; j++)
		{
			if (vetor[j] > vetor[j + 1])
			{
				aux = vetor[j];
				vetor[j] = vetor[j + 1];
				vetor[j + 1] = aux;
			}
		}
	}
}

//Observe que os números são gerados aleatoriamente baseados
//em uma semente. Se for passado a mesma semente, os
//números aleatórios serão os mesmos
void criarVetor(int tamanhoVetor, int semente)
{
	srand(semente);
	vetorQuickSort = new int[tamanhoVetor];
	vetorBubbleSort = new int[tamanhoVetor];
	for (int i = 0; i < tamanhoVetor; i++)
	{
		vetorQuickSort[i] = rand() % 100000;
		vetorBubbleSort[i] = vetorQuickSort[i]; // utilizar os mesmos valores
												//vetorBubbleSort[i] = rand()%100000;
	}
}

float calcTempoMili(struct timeval inicio, struct timeval fim)
{
	return (float)(1000 * (fim.tv_sec - inicio.tv_sec) + (fim.tv_usec - inicio.tv_usec) / 1000) / 1000;
}

int main()
{
	//Tamanho do vetor
	int n = 40000;
	time_t inicio_t, fim_t, intervalo_t;
	struct timeval inicio, fim, intervalo;

	//Criar vetor com elementos aleatorios[0,100000]
	criarVetor(n, 23);

	//Ordenar utilizando quickSort
	inicio_t = time(0);
	gettimeofday(&inicio, NULL);
	qsort(vetorQuickSort, n, sizeof(int), compare_ints);
	gettimeofday(&fim, NULL);
	fim_t = time(0);
	intervalo_t = (fim_t) - (inicio_t);
	cout << "Tempo do quicksort: " << calcTempoMili(inicio, fim) << "s\n";
	// cout << "Tempo do quicksort: " << intervalo_t << " s\n";

	//Ordenar utilizando bubleSort
	inicio_t = time(0);
	gettimeofday(&inicio, NULL);
	bubbleSort(vetorBubbleSort, n);
	gettimeofday(&fim, NULL);
	fim_t = time(0);
	intervalo_t = (fim_t) - (inicio_t);
	cout << "Tempo do bubblesort: " << calcTempoMili(inicio, fim) << "s\n";
	// cout << "Tempo do bubblesort: " << intervalo_t << " s\n";

	exit(0);
}
