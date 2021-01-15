#Indique cun comando en que directorio se atopa
pwd
#Vaia ao directorio "usr/share/doc" e logo comprobe a rua do seu directorio
# actual.
#Ir ao directorio indicado:
cd /usr/share/doc
#Comprobación con pwd
pwd
#Volva ao directorio pai
cd ..
#Verificación
pwd
#Acceder ao directorio persoal sen escribir a ruta absoluta
cd ~
#Volver ao directorio anterior sen escribir a ruta absoluta
cd ../../usr/share
#Volver ao directorio persoal
cd ~
#Listar ficheiros presentes co comando ls
ls
#Listar ficheiros incluíndo os ocultos
ls -a
#Ver detalladamnte o contido do directorio "/usr" sen cambiar
#o directorio de traballo
ls -l ../../usr
#Ver a árbore deos ficheiros contidos en "/var", sen cambiar
#o directorio de traballo
tree ../../var
#Ver detalladamente o contido do directorio "/var/log", ordenando 
#os ficheiros do máis antigo ao máis recente
ls -ltr ../../var/log
#Vexa información detallada do directorio "/home" sen incluír o seu contido
#-l para listaxe detallada e -d para listar o directorio 
#pero non o seu contido
ls -l -d 
#Obtén o formato dos ficheiros "/etc/passwd", "/usr/bin/passwd" ,
#"/bin/ls" e "/usr"
file /etc/passwd
file /usr/bin/passwd
file /bin/ls
file /usr
#Amosar a información dos inodos dos ficheiros anteriores
stat /etc/passwd
stat /usr/bin/passwd
stat /bin/ls
stat /usr
