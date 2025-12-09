# Log Archive Tool

Uma ferramenta de CLI (Linha de Comando) para automatizar o arquivamento e compactação de logs em sistemas Linux.

## Como usar

1. Dê permissão de execução:
   `chmod +x log-archive.sh`

2. Execute passando o diretório de logs:
   `./log-archive.sh /var/log`

## Funcionalidades
- Compacta logs em formato tar.gz
- Adiciona timestamp ao nome do arquivo
- Registra histórico de operações
