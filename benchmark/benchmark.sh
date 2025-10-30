#!/bin/bash

# run chmod +x benchmark.sh 

# Comando a ser executado
COMANDO_ALVO="julia euler.jl" 

# Número de vezes que o comando será executado
REPETICOES=100

# Variável para acumular o tempo total
TEMPO_TOTAL=0

# Configura o comando 'time' interno do shell para mostrar apenas o tempo REAL (%e)
# A opção TIMEFORMAT=%R faria isso, mas usaremos 'time -p' e 'awk' para melhor precisão 
# e portabilidade com o 'time' externo (que é mais comum em scripts)
# mas vamos simplificar o 'time' interno do bash que é mais prático
# Usaremos o 'time' do bash com 'TIMEFORMAT=%R'

# Configura o formato de saída do comando 'time' do BASH (não o utilitário /usr/bin/time)
# %R = tempo real em segundos (ex: 0.123)
TIMEFORMAT=%R

echo "Executando '$COMANDO_ALVO' $REPETICOES vezes..."
echo "------------------------------------------------"

for i in $(seq 1 $REPETICOES); do
    # Executa o comando e captura o tempo na variável TEMPO_DA_EXECUCAO
    # O 'time' interno do bash (sem caminho, apenas 'time') com TIMEFORMAT joga a saída no stderr
    # A variável TEMPO_DA_EXECUCAO armazena a saída da execução, e o tempo é impresso
    # Separaremos o tempo da saída do comando
    
    # 1. Redireciona a saída normal (stdout) do comando alvo para /dev/null
    # 2. Redireciona a saída de erro (stderr) do comando alvo para /dev/null
    # 3. Executa o 'time' e redireciona a saída de tempo (que vai para stderr por padrão) para o stdout
    # 4. Captura o tempo no formato %R na variável TEMPO_DA_EXECUCAO
    
    TEMPO_DA_EXECUCAO=$( (time $COMANDO_ALVO 1>/dev/null 2>/dev/null) 2>&1 )
    
    # Substitui a vírgula (se houver) por ponto para cálculo
    TEMPO_DA_EXECUCAO_PONTO=$(echo "$TEMPO_DA_EXECUCAO" | sed 's/,/./')

    # Exibe o tempo da execução atual
    printf "Execução %6d: %s segundos\n" "$i" "$TEMPO_DA_EXECUCAO_PONTO"
    
    # Soma o tempo (usa 'bc' para cálculo de ponto flutuante)
    TEMPO_TOTAL=$(echo "$TEMPO_TOTAL + $TEMPO_DA_EXECUCAO_PONTO" | bc)
done

echo "------------------------------------------------"
# Calcula a média (usa 'bc' para cálculo de ponto flutuante)
TEMPO_MEDIO=$(echo "scale=6; $TEMPO_TOTAL / $REPETICOES" | bc)

echo "Tempo Total: $TEMPO_TOTAL segundos"
echo "Número de Repetições: $REPETICOES"
echo "Tempo Médio de Execução: **$TEMPO_MEDIO segundos**"
