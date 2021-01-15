#1 Listar todos os ficheiros do directorio 'bin'
ls -a /bin
#2 Listar todos os ficheiros do directorio 'tmp'
ls -a /tmp
#3 Listar todos os ficheiros do directorio 'etc' que comecen por 't'
#en orden inverso
ls -a -r /etc/t*
#4 Listar todos os ficheiros do directorio 'dev' que comecen por 'tty'
# e teñan 5 caracteres
ls -a /dev/tty??
#5 Listar todos os ficheiros do directorio 'dev' que comecen por 'tty'
# e rematen en '1,2,3 ou 4'
ls -a /dev/tty*[1-4]
#6 Listar todos os ficheiros do directorio 'dev' que comecen por 't' 
# e rematen en 'C1'
ls -a /dev/t*C1
#7 Listar todos os ficheiros, incluídos os ocultos, do directorio raíz
ls -a /
#8 Listar todos os ficheiros do directorio 'etc' que non comecen por 't'
ls -a /etc/[^t]*
#9 Listar todos os ficheiros do directorio 'usr' e os seus subdirectorios
ls -R /usr
#10 Cambiarse ao directorio 'tmp', e crear un directorio chamado PROBA
cd /tmp
mkdir PROBA
#11 Crear 5 ficheiros dentro do directorio PROBA co nome ficheiro1.txt,
# ... ficheiro5.txt
touch PROBA/ficheiro1.txt
touch PROBA/ficheiro2.txt
touch PROBA/ficheiro3.txt
touch PROBA/ficheiro4.txt
touch PROBA/ficheiro5.txt
#12 Verificar que o directorio actual cambiou
ls -d /tmp
#13 Amosar o día e a hora actual
date
#14 Cun só comando situarse no directorio $HOME
cd ~
#15 Listar todos os ficheiros do directorio HOME amosando o seu número de inodo
ls -a -i ~
#16 Borrar todos os ficheiros e directorios visibles do directorio 'PROBA'
rm -r -f /tmp/PROBA/*
#17 Crear os directorios 'dir1', 'dir2' e 'dir3' dentro do directorio
#'PROBA'. Ademáis dentro de 'dir1' crear o directorio 'dir11'. Dentro do 
#directorio 'dir3' crear o directorio 'dir31'. Dentro do directorio 'dir31',
#crear os directorios 'dir311' e 'dir312'. Debe usar a ruta absoluta 
#para crear todos os directorios indicados.
mkdir /tmp/PROBA/dir1 /tmp/PROBA/dir2 /tmp/PROBA/dir3
mkdir /tmp/PROBA/dir1/dir11
mkdir -p /tmp/PROBA/dir3/dir31/dir311
mkdir /tmp/PROBA/dir3/dir31/dir312
#18 Copiar o ficheiro 'etc/fstab' a un ficheiro chamado 'discos.conf'
#do  directorio PROBA
cp /etc/fstab /tmp/PROBA/discos.conf
#19 Copiar o ficheiro 'discos.conf' en dir1, dir2 e dir3
cp /tmp/PROBA/discos.conf /tmp/PROBA/dir1/
cp /tmp/PROBA/discos.conf /tmp/PROBA/dir2/
cp /tmp/PROBA/discos.conf /tmp/PROBA/dir3/
#20 Comprobar que creamos correctamente o indicado no exercicio anterior e
#facelo mediante un so comando
tree /tmp/PROBA/
#21 Copiar os ficheiros do directorio 'rc0.d' que se atopa en '/etc' ao
#directorio 'dir31'
cp /etc/rc0.d/* /tmp/PROBA/dir3/dir31/
#22Copiar no directorio 'dir311' os ficheiros de '/bin' que teñan unha 'a' 
#como segunda letra e o seu nome teña catro letras
cp /bin/?a?? /tmp/PROBA/dir31/dir311/
#23 Copiar o directorio de '/usr/lib/xorg/' e os seus subdirectorios debaixo
#de 'dir11' (incluíndo o propio directorio)
cp -r /usr/lib/xorg/ /tmp/PROBA/dir1/dir11
#24 Mover o directorio 'dir31' e os seus subdirectorios debaixo de 'dir2'
mv /tmp/PROBA/dir31 /tmp/PROBA/dir2
#25 Amosar por pantalla os ficheiros ordinarios do directorio 'HOME' e os
#seus subdirectorios
ls -R ~
#26 Ocultar o ficheiro 'discos.conf' do directorio 'dir3'
mv /tmp/PROBA/dir3/discos.conf /tmp/PROBA/dir3/.discos.conf
#27 Borrar os ficheiros e directorios de 'dir1', incluído o propio directorio
rm -r /tmp/PROBA/dir1
#28 Copiar ao directorio 'dir312' os ficheiros do directorio '/dev' 
#que comecen por 't', rematen nunhadas seguintes letras
#[ifxy] e teña 8 letras no seu nome.
cp -r /bin/t??????[ifxy] /tmp/PROBA/dir2/dir31/dir312
#29 Borrar os ficheiros de 'dir312' que non rematen en 'x' e teñan unha 'e'
#como segunda letra.
rm -r /tmp/PROBA/dir2/dir31/dir312/?e*[^x]
#30 Mover o directorio 'dir312' debaixo de 'dir3'
mv /tmp/PROBA/dir2/dir31/dir312 /tmp/PROBA/dir3
