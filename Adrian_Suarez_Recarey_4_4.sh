#1 Lista todos os ficheiros dentro de 'usr/share/doc'
#que conteñan a palabra 'http' independentemente
#de que estean escritos en maiúscula ou minúscula
grep -ir http /usr/share/doc
#2 Lista todos os ficheiros dentro de 'usr/share/doc'
#que conteñan a palabra 'FTP', e saca o resultado a 
#un ficheiro chamado 'ftp.info' usando un único comando.
grep -r FTP /usr/share/doc > ftp.info
#3 Obteña unha lista dos ficheiros do directorio
#'/etc', facendo uso de tubos (pipes). Deberán saír
#ordenados polo tamaño do ficheiro.
ls -la /etc | sort -k5 -n
#4 Obter o listado de todos os ficheiros do teu $HOME,
#ordenados polo nome do ficheiro.
ls -a ~ | sort -d
#5 Crea un ficheiro chamado 'usuarios' coa seguinte
#información
#Admin, Pass: 1234
#Xiao, Pass: 1325
#Lía, Pass: stucom
#Brais, Pass: gzn
#Celtia, Pass: songal
#Listar o contido do teu $HOME de xeito non detallado
#(só o nome dos ficheiros) , e engadilo ao final dese 
#ficheiro 'usuarios'
echo -e "Admin, Pass: 1234 \nXiao, Pass: 1325 \nLía, Pass: stucom \nBrais, Pass: gzn \nCeltia, Pass: songal" > usuarios
ls -a ~ >> usuarios
#6 Co comando 'sort' ordena o ficheiro 'usuarios' e
#saca o resultado a un ficheiro chamado 'SortedUsers'
cat usuarios | sort -d > SortedUsers
#7 Co comando 'sort', ordena o ficheiro 'usuarios'
#segundo o campo de contrasinal e saca o resultado
#a un ficheiro chamado 'SortedPass'
cat usuarios | sort -t ":" -k2n usuarios > SortedPass
#8 Crear un usuario co nome 'userservice' que non 
#teña $HOME definido
sudo adduser --no-create-home userservice
#9 Crear un usuario co nome 'user1' coa súa carpeta
#de $HOME dentro da ubicación por defecto ('/home')
#e co nome 'huser1' e co shell por defecto configurado
#a '/bin/bash'.
sudo adduser --home /home/huser1 --shell /bin/bash user 1
#10 Listar os grupos dos sistemas
ls /etc/group
#11 Engadir o usuario 'user1' aos grupos: 'sudo',
#'adm' e 'syslog'
sudo usermod -a -G sudo,adm,syslog user1
#12 Cambiar o contrasinal do usuario 'user1' polo 
#de ‘Covid-19’
sudo passwd user1
#13 Modificar o usuario 'user1' para facer que a 
#súa conta expire o 02/02/2021
sudo chage -E 2021-02-02 user1
#14 Bloquear a conta do usuario 'user1'
sudo usermod --lock user1