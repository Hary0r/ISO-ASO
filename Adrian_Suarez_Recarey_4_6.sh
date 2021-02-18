#1 Crea un directorio en /tmp chamado per,-esp' e dentro del 5 novos ficheiros co seguinte
# nome: fil1, file2, ...file5. Os ficheiros deben crearse usando un único comando (e outro
# para o directorio)
mkdir /tmp/perm-esp
touch /tmp/perm-esp/file{1..5}
#2 Asigna permiso de execucuón para usuario propietario, así como tamén o permiso SetUID
#aos ficheiros file1 e file2 usando o formato por caracteres.
chmod u+xs /tmp/perm-esp/file{1..2}
#3 Asigna o permiso SetUID aos ficheiros file3, file4 e file5 usando o formato octal e se
#os ficheiros teñen permiso de execucuón para os ususarios, retirarllo.
chmod 4644 /tmp/perm-esp/file{3..5}
#4 Asigna permiso de execución para o grupo propietario, así como o permisto SetGID aos
#ficheiros file1 e file2 usando o formato por caracteres
chmod g+xs /tmp/perm-esp/file{1..2} 
#5 Asigna o permiso SetGID aos ficheiros file3, file4 e file5 usando o formato octal e se
#os ficheiros teñen permiso de execución para o grupo propietario, retirarllo
chmod 2644 /tmp/perm-esp/file{3..5}
#6 Asigna o permiso de execución para o grupo propietario, así como o permiso SETGID ao
#directorio '/tmp/perm-esp'
chmod g+xs /tmp/perm-esp
#7 Asigna permiso de escritura sobre a directorio '/tmp/perm-esp' para o grupo propietario,
#e engade o permiso StickyBit ao directorio. Faino usando un mesmo comando e co formato por
#caracteres
chmod g+w,+t /tmp/perm-esp
#8 Retira o permiso de escritura ao directorio '/tmp/perm-esp' para o grupo propietario,
#e engade o permiso StickyBit ao directorio. Faino usando un mesmo comando e een formato
#octal
chmod 1754 /tmp/perm-esp

