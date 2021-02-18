#1 Busca todos os ficheiros que hai no directorio '/usr/lib' que
#comezan por 't'
find /usr/lib/ -type f -name "t*"
#2 Busca todos os ficheiros que hai no directorio '/usr/lib' que
#comezan por 't' ou 'T'
find /usr/lib/ -type f -iname "t*"
#3 Busca todos os ficheiros que hai no directorio '/usr/share' con
#extensión '.txt'
find /usr/share -type f -name "*.txt"
#4 Busca todos os ficheiros que hai no directorio '/usr/share/' que
#comezan por un carácter (maiúscula ou minúscula) e que teñan extensión .txt
find /usr/share -type f -iname "[a-z]*.txt"
#5 Busca todos os directorios que hai no directorio 'usr/share' que
#comecen por un carácter(maiúscula ou minúscula) seguido dun díxito
find /usr/share/ -type f -iname ?[0..9]*
#6 Busca todos os ficheiros que non sexan directorios
#do directorio ‘usr/lib’ que sexan scripts con extensión ‘.sh’
find /usr/lib -type f -name "*.sh"
#7 Busca todos os ficheiros ocultos,
#que non sexan directorios, do directorio 'usr/share'
find /usr/share -type f -name ".*"
#8 Busca todos os ficheiros con permiso 644 
#(que non sexan directorios) en 'usr/lib'
find /usr/lib -perm 644 -type f
#9 Buscar todos o ficheiros con permisos de execución
#do directorio '/usr/share'
find /usr/share -type f -perm /+x
#10 O número de ficheiros con permisos de execución
#do directorio '/usr/share'
find /usr/share -type f -perm /+x | wc -l
#11 Buscar todos os ficheiros de '/tmp' que pertenzan
# ao usuario ‘root’
find /tmp -type f -user root
#12 Busca todos os ficheiros baleiros que se atopen
#dentro do directorio 'usr/share'
find /usr/share -type f -empty
#13 Buscar todos os ficheiros con máis de 50 días desde
#a súa modificación do directorio 'usr/share'
find /usr/share -type f -mtime +50
#14 Buscar todos os ficheiros con menos de 20 días desde
#a súa modificación do directorio 'usr/share'
find /usr/share -type f -mtime -20
#15 Buscar no directorio '/tmp' os ficheiros cun 
#tamaño superior aos 13 MB, que leven máis de 25 días
#sen seren modificados e eliminalos.
find /tmp -type f -size +13M -mtime +25 -delete
