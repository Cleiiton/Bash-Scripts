#!/bin/bash

################################################################################
# Titulo    : Parsing HTML                                                     #
# Data      : 31/03/202                                                        #
# Autor     : Cleiton Souza                                                    #
# Status    : Em desenvolvimento
################################################################################

# Variaveis das cores

VERMELHO='\033[31;1m'
VERDE='\033[32;1m'
AZUL='\033[34;1m'
AMARELO='\033[33;1m'
FIM='\033[m'

#BANER DO SCRIPT

 echo
    echo -e "${VERDE}################################################################################${FIM}"
    echo -e "${VERDE}#                                                                              #${FIM}"
    echo -e "${VERDE}#                             PARSING HTML                                     #${FIM}"
    echo -e "${VERDE}#                                                                              #${FIM}"
    echo -e "${VERDE}################################################################################${FIM}"
    echo

#=========================================================
# Consulta se o site foi informado e mostra o modo de uso
#=========================================================

if [ "$1" == "" ]
then
	echo "MODO DE USO $0 www.alvo.com.br"
else

#========================================================
# Wget para baixar o index com parametros
# para baixar de forma silenciosa
#=======================================================
	wget -q -c --show-progress $1

echo -e "${VERDE}===================================RESULTADO===================================:${FIM}"
echo

#=======================================================
# Refinamento da pesquisa
#=======================================================

cat index.html | grep href | cut -d "/" -f3 | grep "\." | cut -d '"' -f1  | grep -v "<l" > lista

for url in $(cat lista);do host $url | grep "has address";done

#======================================================
# Limpando os arquivos baixados e criados
#======================================================

rm -rf index.html && rm -rf lista

fi



