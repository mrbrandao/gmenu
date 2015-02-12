#!/bin/bash 
#Por Igor Brandao
#Curitiba 13/03/09 (Sexta Feira 13) 
#e-mail: igorsca(at)gmail.com 
#O tbhack Mailing, é umhack para a Limitacao do turbomailer enviar só 10 eils 
#Aproveite o hack. 
##STRBKP## 

##Variaveis Globais 
MAILP=/sgi/mail/tmailer 
MBIN="$MAILP"/tmailer 
MALA=/sgi/mail/mailing 
LISTA="$MALA"/list2.txt 
NEWP=/sgi/mail/news 
NEWS="$NEWP"/news.htm 
##Fim das Globais 

##Variaveis de Envio 
SMTP=mail.server.com.br 
MAIL=meuemail@server.com.br 
PASS=minha_senha
REMET=meuemail@server.com.br 
##Fim de Var. Envio 

#Variaveis de Funcao 
LTMP="$MALA"/tmplist 
LTMP2="$MALA"/tmplist2 
ENVIO="$MALA"/envio 
#Subject 
SUB="TESTE COMO MAILER       " 
# 
cp "$LISTA" "$LTMP" 
while [ `cat "$LTMP"|wc -l` -gt 10 ] 
do 
	echo TEM MAIS DE 10 Truncando... 
	head -n 10 "$LTMP" > "$ENVIO" 
	sed '1,10d' "$LTMP" > "$LTMP2" 
	mv "$LTMP2" "$LTMP" 
	"$MBIN" -c -a "$ENVIO" -v "$SMTP" -u "$MAIL" -p "$PASS" -s "$SUB" -y -t "$NEWS" -f "$MAIL" 
done 

	"$MBIN" -c -a "$LTMP" -v "$SMTP" -u "$MAIL" -p "$PASS" -s "$SUB" -y -t "$NEWS" -f "$MAIL" 

#Limpando Temporarios. 
rm -rf "$MALA"/*.log 
rm -rf "$LTMP" 
rm -rf "$LTMP2" 
rm -rf "$ENVIO" 
exit 0 
