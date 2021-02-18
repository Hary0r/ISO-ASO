#1 Crea os grupos de usuarios: 'rrhh', 'cau'.
addgroup rrhh
addgroup cau
#2 Crea os seguintes usuarios e asígnalles como grupo principal
#o indicado.
#- Grupo 'rrhh': 'user1', 'user2'
#- Grupo 'cau': 'user3', 'user4'
useradd -g rrhh user1
useradd -g rrhh user2
useradd -g cau user3
useradd -g cau user4
#3 Crea a seguinte estrutura de directorios:
#·/tmp/dir-acl/dir-rrhh/
# file-rrhh-1
# file-rrhh-2
#...
# file-rrhh-9
#·/tmp/dir-acl/dircau/
# file-cau-1
# file-cau-2
#...
# file-cau-5
#·/tmp/dir-acl/dir-com/
#file-com-1
#file-com-2
#...
#file-com-7
mkdir -p /tmp/dir-acl/dir-rrhh/file-rrhh-{1..9}
mkdir -p /tmp/dir-acl/dir-cau/file-cau-{1..5}
mkdir -p /tmp/dir-acl/dir-com/file-com-{1..7}
#4 Asignar ao directorio '/tmp/dir-acl'/ e ao seu contido 
#de xeito recursivo, os seguintes permisos UGO:
#Usuario: lectura, escritura e execución
#Grupo: ningún
#Outros: ningún
chmod -R 700 /tmp/dir-acl
#5 Configura as ACL por defecto do directorio '/tmp/dir-acl'
#do seguinte xeito:
#Grupo 'rrhh': lectura e Execución
#Grupo 'cau': lectura, escritura e execucion
setfacl -d -m u::7,g::6 /tmp/dir-acl/
#6 Asigna as regras ACL indicadas á carpeta "dir-rrhh", así
#como taén ao seu contido:
#Grupo 'rrhh': lectura, escritura e execución
setfacl -R -m g:rrhh:7 /tmp/dir-acl/dir-rrhh
#7 Asigna as reglas ACL inidcadas á carpeta "dir-cau", así
#como tamén ao seu contido:
#Grupo 'cau': lectura, escritura e execución
setfacl -R -m g:cau:7 /tmp/dir-acl/dir-cau
#8 Asigna as regras ACL indicadas á carpeta "dir-com":
#Grupo 'rrhh': lectura e execución
#Grupo 'cau': lectura e execución
setfacl -m g:rrhh:5 /tmp/dir-acl/dir-com
setfacl -g g:cau:5 /tmp/dir-acl/dir-com
#9 Asigna as regras ACL indicadas ao contida da carpeta 
#"dir-com":
#Grupo 'rrhh': lectura e escritura
#Grupo 'cau': lectura, escritura e execución
setfacl -R -m g:rrhh:6 /tmp/dir-acl/dir-com
setfacl -R -m g:cau:7 /tmp/dir-acl/dir-com
#10 Elimina as regras ACL aplicadas aos seguintes ficheiros:
#/tmp/dir-acl/dir-rrhh/file-rrhh-1
#/tmp/dir-acl/dir-cau/file-cau-1
setfacl -x g:rrhh /tmp/dir-acl/dir-rrhh/file-rrhh-1
setfacl -x g:cau /tmp/dir-acl/dir-cau/file-cau-1




