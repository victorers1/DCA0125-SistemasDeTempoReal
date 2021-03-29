Escreva um programa (preferencialmente em linguagem C\C++) para gerenciar processos do SO (Linux), com as seguintes características e funcionalidades:

- Interface gráfica com listagem dos processos, indicando % de uso de CPU, PID, prioridade e Status.
- Gráfico de uso de CPUs (opcional) dos processos.
- Função de selecionar os processos a serem listados (filtro).

- Para o filtro pode-se utilizar por exemplo o comando ps -auf | grep <nome_do_processo>

- Ou o comando pstree
- Função de matar, suspender e continuar de determinado processo (escolher pelo PID do processo).
- Função para escolher em qual CPU um determinado processo (escolher pelo seu PID) irá executar.
- Função para mudar a prioridade de um processo (escolher pelo seu PID).

No vídeo de apresentação do trabalho:
- Apresentar o grupo (integrantes, disciplina, universidade, semestre e ano).
- Explicar brevemente como o programa foi desenvolvido.
- Mostrar o funcionamento correto das funcionalidades indicadas no trabalho. - Exibir o gráfico de uso de CPUs (opcional).
- Pode utilizar o programa htop para efeito de comparação e de validação da corretude da sua solução.