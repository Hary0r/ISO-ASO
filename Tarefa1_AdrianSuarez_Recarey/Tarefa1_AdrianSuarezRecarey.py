#!/usr/bin/python3
#PRINTS 
from misfunciones import eliminaTildes, execComando
import passlib.hash

with open('Usuarios.csv', 'r') as f:
    fUsuarios = f.readlines()
    #print(Usuarios)
with open('asir.txt','r') as f2:
    fAsir = f2.readlines()

with open('daw.txt', 'r') as f3:
    fDaw = f3.readlines()

gruposJefe = execComando('groups jefe').split(" ")[3:]
print(gruposJefe)


for l in fUsuarios[1:]:
    ll = l.split(";")
    # print(ll)
    #Eliminamos tildes, escollemos 3ª posición (nome), poñemos en minúsculas e reemplazamos espacios por "nada" e facemos selección 0,0 (1º apelido, 1ª letra)
    nome = eliminaTildes(ll[2].lower()).replace(" ","")+eliminaTildes(ll[0][0].lower()) \
    +eliminaTildes(ll[1][0].lower())+ll[7][-4:]
    #print(nome)
    pSincifrar = ll[6]
    pCifrada = passlib.hash.sha512_crypt.hash(pSincifrar)
    #print(pSincifrar)
    
    grupoP = ll[8].lower().strip()
    grupoS = ",".join(gruposJefe).strip()
    print(f"useradd -d /home/{nome} -m -g {grupoP} -G alumnos,{grupoS} -p '{pCifrada}' -s /bin/bash {nome}") #Xeramos comando

    if grupoP == "asir":
        for materia in fAsir:
            print(f"mkdir /home/{nome}/{materia.strip()}") #Creamos directorio
            print(f"chown {nome}:{grupoP} /home/{nome}/{materia.strip()}")
            print(f"chmod 0750 /home/{nome}/{materia.strip()}")

    if grupoP == "daw":
        for materia in fDaw:
            print(f"mkdir /home/{nome}/{materia.strip()}") #Creamos directorio
            print(f"chown {nome}:{grupoP} /home/{nome}/{materia.strip()}")
            print(f"chmod 0750 /home/{nome}/{materia.strip()}")