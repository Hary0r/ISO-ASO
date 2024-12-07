from subprocess import PIPE,Popen
from re import compile,findall


## función para executar comandos
def execComando(comando):
    ejecComando = Popen(comando, shell=True, stdout=PIPE, stderr=PIPE)
    erro = ejecComando.stderr.read().decode('utf-8')
    sComando = ejecComando.stdout.read().decode("utf-8")
    ejecComando.stdout.close()

    if not erro:
        return sComando
    else:
        return erro 
    
#####################################################################

## Funcion para eliminar tildes
import unicodedata
def eliminaTildes(s):
    return ''.join(c for c in unicodedata.normalize('NFD', s) if unicodedata.category(c) != 'Mn')

#####################################################################

## Función que dado un archivo del tipo clave:valor 
## me devuelve un diccionario con todo su contenido

def fileToDict(pathArchivo):
    dArchivo = {}

    with open(pathArchivo, 'r') as fr:
        lLineas = fr.readlines()
    for l in lLineas:
        ll = l.strip().split(':')
        try:
            k = ll[0].strip()
            v = ll[1].strip()
            # print(f'{k}:{v}')
            dArchivo.setdefault(k,v)
        except:
            pass
    return dArchivo



####################################################
def dameDNI():
    from random import randint

    POSSIBLE_LETTERS = ("T","R","W","A","G","M","Y","F",
        "P","D","X","B","N","J","Z","S","Q","V","H",
        "L","C","K","E","T",)
    NUMBER_DNI = randint(10000000, 99999999)
    LETTER_DNI = POSSIBLE_LETTERS[NUMBER_DNI % 23]
    return f"{NUMBER_DNI}{LETTER_DNI}"
####################################################

###################################################################################
def dameUsuarios(n):
    from faker import Faker
  
    fake = Faker('es_ES')
    lUsuarios = []

    for _ in range(n):
        dTemp = {}
        dTemp.setdefault('nombre', fake.name())
        dTemp.setdefault('cumple', fake.\
date_of_birth(tzinfo=None, minimum_age=18, maximum_age=55).strftime("%d-%m-%Y"))
        dTemp.setdefault('direccion', fake.address().replace('\n',' '))
        dTemp.setdefault('telefono', fake.phone_number())
        dTemp.setdefault('trabajo', fake.job())
        dTemp.setdefault('dni', dameDNI())
        lUsuarios.append(dTemp)

    return lUsuarios
###################################################################################
