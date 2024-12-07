from misfunciones import execComando
from datetime import datetime
from re import compile,sub


comandoSpliteado = execComando("top -bn1 -o %MEM").split("\n")

cabeceira = sub('\s+', ';',comandoSpliteado[6].strip()).split(";")
#Co módulo sub sustituímos
#[\s (Espacios) e o '+' indica que ten que haber como mínimo un espazo] polo valor que sigue á coma ';' máis a cadena que nos interesa (comandoSpliteado)
#Ao facer o split pasamos a ter unha lista. Sempre que ten corchetes e separado por comas é unha lista.
#print(cabeceira)

texto = f"{cabeceira[1]};{cabeceira[-1]};{cabeceira[-4]};{cabeceira[-3]};{cabeceira[0]};PPID\n"


#Para ver ben as listas é ben facer bucles
'''
for linea in comandoSpliteado:
    print(linea)
'''
#Recorremos a saída do comando
for linea in comandoSpliteado:
    if (compile('^[0-9].*').search(linea.strip())):
        ll = sub('\s+', ';',linea.strip()).split(";") #Pasamos todo a unha lista

        if ll[9] != '0,0':
            
            try:
                ppid = sub('\s+', ';',execComando(f"ps -f {ll[0]}").strip().split("\n")[1])#Collemos saída do comando, sustituimos e quedámonos coa segunda línea
                ppid = ppid.split(";")[2]
            except:
                ppid = "NULL"
            # print(execComando(f"ps -f {ll[0]}"))
            valores = f"{ll[1]};{ll[-1]};{ll[-4]};{ll[-3]};{ll[0]};{ppid}\n"
            texto += valores

print(texto)

arquivo = datetime.now().strftime("top_%Y_%m_%d_%H_%M.csv")

with open(arquivo,"w") as ficheiroAberto:
    ficheiroAberto.write(texto)