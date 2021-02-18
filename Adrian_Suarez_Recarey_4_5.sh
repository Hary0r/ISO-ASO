#1 Consulta a máscara de usuario
umask
#2 Modifica a máscara para o usuario para que os ficheiros
# creados teñan por defecto os permisos 262 e os directorios 373
umask 404
#3 Modifica a máscara para o usuario para que os ficheiros creados
#teñan por defecto os permisos 664 e os directorios 775
umask 002
#4 Crea un usuario chamado 'asir' que se desactivará o 21/6/21 e
#co shell por defecto á aplicación 'bash' de Linux
sudo useradd -e 20201-06-21 -s /bin/bash asir
#5 Engado o teu usuario e o creado anteriormente ('asir1') aos
#grupos 'sudo' e 'admin', facendo uso do comando 'usermod'
# Verás que ese usuario ten permisos de root e que non está
#engadido no ficheiro '/etc/sudoers'. Isto é debido á regra:
#sudo    ALL=(ALL:ALL) ALL
#esta regra define que todos os usuarios pertencentes a grupo
#'sudo' teén todos os permisos, é dicir, son superusuario
sudo useradd -a -G sudo,adm a17adriansr
sudo usermod -a -G sudo,adm asir
#6 Comproba a información do contrasinal pra o usuario 'asir'
passwd -S asir
#7 Crea un directorio en /tmp co nome 'practica' desde o usuario
#asir sen saír da túa sesión
sudo -u asir mkdir /tmp/practica
#8 Volve ao teu usuario e crea dentro do directorio '/tmp/practica'
#dez ficheiros co seguinte nome "ficheiro1", "ficheiro2..10
touch /tmp/practica/ficheiro{1..10}.txt
#9 Asigna os ficheiros que hai dentro do directorio anterior ao 
#usuario 'root' (sen entrar dentro do directorio) e dalle os 
#seguintes permisos 101 010 001
sudo chown root /tmp/practica/*
sudo chmod 521 /tmp/practica/*
#10 Asigna os ficheiros que hai dentro ao grupo 'asir'
sudo chgrp asir /tmp/practica/*