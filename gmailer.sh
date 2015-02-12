#!/bin/bash 
#Por Igor Brandao 
#Curitiba 13/03/09 (Sexta Feira 13) 
#e-mail: igorsca(at)gmail.com 
#End de Interacao com o tbhack.sh 
##STRBKP## 
#Variaveis Globais 
MAILP=/sgi/mail/tmailer 
BIN=/usr/local/bin 
MBIN="$MAILP"/tmailer 
MALA=/sgi/mail/mailing 
LISTA="$MALA"/list.txt 
NEWP=/sgi/mail/news 
NEWS="$NEWP"/news.htm 
HACK="$BIN"/tbhack.sh 
##Fim das Globais 
#MENU 
#Colors 
yblu="\033[33;44m" 
limpa="\033[0m" 
while true 
do 
clear 
tput bold 
echo -ne "					GMAILER MENU
					---------------- 
                        "$yblu"Opcao           Descricao                               
			=====           =========                               
			(1)             Mudar Subject do email.                 
			(2)             Nome do News.                           
			(3)             Qual arquivo de Mailing deseja enviar?  
			(4)             Listar configuracoes.                   
			(5)             Enviar agora.                           
			(x)             Sair.                                   "$limpa" 

" 
echo -ne "				Escolha uma Opcao: { }\033[2D" 
read -n 1 opcao 
echo -e "\n" 
case "$opcao" 
in 

####################################### 
#Mudar Subject do email. 
####################################### 
1) 
read -p "Qual o novo subject do email ? " a b c d e f g h i j 
 if [ ! "$a" ] 
        then 
                echo -e "\033[1;31;40mOps... O subject nao pode ser um valor vazio!\033[0m" 
                sleep 2 
        else 
                if [ -f "$HACK" ] 
                then 
				sed 's/SUB=.*/SUB="'$a' '$b' '$c' '$d' '$e' '$f' '$g' '$h' '$i' '$j'"/' "$HACK" > "$HACK"2 
				(mv "$HACK"2 "$HACK";chmod 755 "$HACK") 
				echo -e "\033[1;32;40mOK!\033[0m" 
				sleep 1 
		else 
                        echo -e "\033[31;40mERRO! "$HACK" nao existe ou nao esta configurado corretamente.\033[0m" 
                        sleep 5 
                fi 
        fi 
;; 
####################################### 
#Nome do News. 
####################################### 
2) 
read -p "Me diga qual o nome do arquivo News ? " news 
if [ ! "$news" ] 
then 
	echo -e "\033[1;31;40mOps... O Arquivo NEWS nao pode ser um valor vazio!\033[0m" 
	sleep 2 
else 
	if [ -f "$HACK" ] 
	then 
		if [ -f "$NEWP"/"$news" ] 
		then 
			sed 's?NEWS=.*?NEWS="$NEWP"/'$news'?' "$HACK" > "$HACK"2 
			(mv "$HACK"2 "$HACK";chmod 755 "$HACK") 
			echo -e "\033[1;32;40mOK!\033[0m" 
			sleep 1 
		else 
			echo -e "\033[1;31;40mERRO! $news nao foi encontrado, esteja certo que digitou o nome corretamente.\033[0m" 
			sleep 5 
		fi 
	else 
		echo -e "\033[31;40mERRO! "$HACK" nao existe ou nao esta configurado corretamente.\033[0m" 
		sleep 5 
	fi 
fi 
;; 
####################################### 
#Qual o arquivo de Mailling?. 
####################################### 
3) 
read -p "Qual o nome do arquivo de mailling ? " mailing 
if [ ! "$mailing" ] 
then 
	echo -e "\033[1;31;40mOps... O Arquivo MAILING nao pode ser um valor vazio!\033[0m" 
	sleep 2 
else 
	if [ -f "$HACK" ] 
	then 
		if [ -f "$MALA"/"$mailing" ] 
		then 
			sed 's?LISTA=.*?LISTA="$MALA"/'$mailing'?' "$HACK" > "$HACK"2 
			(mv "$HACK"2 "$HACK";chmod 755 "$HACK") 
			echo -e "\033[1;32;40mOK!\033[0m" 
			sleep 1 
		else 
			echo -e "\033[1;31;40mERRO! $mailing nao foi encontrado, esteja certo que digitou o nome corretamente.\033[0m" 
			sleep 5 
		fi 
	else 
		echo -e "\033[31;40mERRO! "$HACK" nao existe ou nao esta configurado corretamente.\033[0m" 
		sleep 5 
	fi 
fi 
;; 
####################################### 
#Listar as Configuracoes. 
####################################### 
4) 
if [ -f "$HACK" ] 
then 
	tput bold 
	(grep "SUB=" "$HACK";grep "NEWS=" "$HACK";grep "LISTA=" "$HACK") 
	sleep 5 
else 
	echo -e "\033[31;40mERRO! "$HACK" nao existe ou nao esta configurado corretamente.\033[0m" 
	sleep 5 
fi 
;; 
####################################### 
#Enviar Agora?. 
####################################### 
5) 
read -p "Voce deseja iniciar o processo de envio agora? (s/N)" ask 
if [ "$ask" = s -o "(" "$ask" = S ")" ] 
then 	 
	echo -e "\033[1;32;40mIniciando Envio de Emails, isso pode demorar muito tempo!\033[0m" 
	sleep 1 
	"$HACK" 
else 
	continue 
fi 
;; 
###################################### 
#Sair 
###################################### 
x|X) 
clear 
echo -ne "                              \033[1;32;40mObrigado por Usar o \"gMAILER\" 
                              \033[1;31;40mAutor:Igor Brandao 
                              \033[1;33;40mEmail: igorsca(at)gmail.com 
                              \033[1;35;40m(41) 9615-1702\033[0m 

" 
sleep 3 
exit 0 
esac 
done 
exit 0
