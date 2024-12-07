#!/usr/bin/python3
from misfunciones import execComando
from datetime import datetime
from re import compile,IGNORECASE
import requests


# contidoCSV = 

textoFinal = "IP;MAC;FABRICANTE;LATENCIA_MS\n"

ipPedida = input("Introduce unha subrede: ")

fping = execComando(f"fping -g {ipPedida} -a -q -e").strip().splitlines()

#print(fping)

for l in fping:
    ip = l.split(" ")[0]
    #print(ip)
    latencia = l.split(" ")[1].strip("(") + " ms"
    #print(latencia)
    try:
        mac = execComando(f"ip neigh show {ip}").split()[4]
    except:
    #BUscamos todas as lineas de IP coa expresión regular inet IP e quedamos coa primeira
        interfaz = compile(f'inet {ip}.*').findall(execComando("ip a"))[0]
        interfaz = interfaz.split(" ")[-1]
        mac = compile('(?:[0-9A-Z]{2}[:-]){5}[0-9A-Z]{2}',IGNORECASE).findall(execComando(f"ip a show {interfaz}"))[0]
    #print(mac)
    resp = requests.get(f'https://api.macvendors.com/{mac}')
    fabricante = resp.text
    # print(fabricante)

    textoFinal += f"{ip};{mac};{fabricante};{latencia}\n"
print(textoFinal)

arquivo = datetime.now().strftime(f"hostsRed_{ipPedida.split('/')[0]}_%Y_%m_%d_%H_%M.csv")
with open(arquivo,'w') as arquivofinal:
    arquivofinal.write(textoFinal)