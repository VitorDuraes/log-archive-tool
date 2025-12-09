#!/bin/bash

# O suuario forneceu o diretorio?
# -z verifica se a string está vazia
if [ -z "$1" ]; then
   echo "Erro: Por favor, forneça o diretório de logs."
   echo "Uso: log-archive <diretorio-dos-logs>"
   exit 1

fi

# O diretorio que queremos compactar (vem do argumento $1)
DIR_ALVO=$1

#verifica se o diretorio alvo realmente existe

if [ ! -d "$DIR_ALVO" ]; then
   echo "Erro: O diretorio '$DIR_ALVO' não existe."
   exit 1
fi

# Onde vamos guardar os arqivos compactados?
DIR_DESTINO="$HOME/arquivos_logs"

#Criando o carimbo de data/hora (Timestamp)
#Exemplo de saida: 20240816_100648
DATA_HORA=$(date +"%Y%m%d_%H%M%S")

#Definindo o nome do arquivo final
NOME_ARQUIVO="logs_archive_${DATA_HORA}.tar.gz"

# Cria o diretorio de destino se ele não existir (-p evita erro se ja existir)

mkdir -p "$DIR_DESTINO"

echo "Iniciando arquivamento de $DIR_ALVO..."

#tar -czf [ONDE_VAI_FICAR] [O_QUE_VAI_DENTRO]
#2> /dev/null esconde mensagens de erro chatas (como permissão negada em arquivos de sistema)
tar -czf "$DIR_DESTINO/$NOME_ARQUIVO" "$DIR_ALVO" 2> /dev/null

#verifica se o comando tar funcionou (o codigo de suscesso é 0)
if [ $? -eq 0 ]; then
    echo "Sucesso! Arquivo criado em: $DIR_DESTINO/$NOME_ARQUIVO"

   #Adiciona uma linha no arquivo de controle

   echo "[$(date)] Arquivado $DIR_ALVO em $NOME_ARQUIVO" >> "$DIR_DESTINO/historico_arquivamento.txt"
else
   echo "Houve um erro ao tentar compactar os arquivos"
fi


