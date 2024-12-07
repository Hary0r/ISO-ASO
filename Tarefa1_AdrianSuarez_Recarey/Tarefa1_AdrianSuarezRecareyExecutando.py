#!/usr/bin/python3
#Executando os comandos
from misfunciones import eliminaTildes, execComando
import passlib.hash

with open('Usuarios.csv', 'r') as f:
    fUsuarios = f.readlines()
    #execComando(Usuarios)
with open('asir.txt','r') as f2:
    fAsir = f2.readlines()

with open('daw.txt', 'r') as f3:
    fDaw = f3.readlines()

gruposJefe = execComando('groups jefe').split(" ")[3:]
execComando(gruposJefe)


for l in fUsuarios[1:]:
    ll = l.split(";")
    # execComando(ll)
    #Eliminamos tildes, escollemos 3ª posición (nome), poñemos en minúsculas e reemplazamos espacios por "nada" e facemos selección 0,0 (1º apelido, 1ª letra)
    nome = eliminaTildes(ll[2].lower()).replace(" ","")+eliminaTildes(ll[0][0].lower()) \
    +eliminaTildes(ll[1][0].lower())+ll[7][-4:]
    #execComando(nome)
    pSincifrar = ll[6]
    pCifrada = passlib.hash.sha512_crypt.hash(pSincifrar)
    #execComando(pSincifrar)
    
    grupoP = ll[8].lower().strip()
    grupoS = ",".join(gruposJefe).strip()
    execComando(f"useradd -d /home/{nome} -m -g {grupoP} -G alumnos,{grupoS} -p '{pCifrada}' -s /bin/bash {nome}") #Xeramos comando

    if grupoP == "asir":
        for materia in fAsir:
            execComando(f"mkdir /home/{nome}/{materia.strip()}") #Creamos directorio
            execComando(f"chown {nome}:{grupoP} /home/{nome}/{materia.strip()}")
            execComando(f"chmod 0750 /home/{nome}/{materia.strip()}")

    if grupoP == "daw":
        for materia in fDaw:
            execComando(f"mkdir /home/{nome}/{materia.strip()}") #Creamos directorio
            execComando(f"chown {nome}:{grupoP} /home/{nome}/{materia.strip()}")
            execComando(f"chmod 0750 /home/{nome}/{materia.strip()}")