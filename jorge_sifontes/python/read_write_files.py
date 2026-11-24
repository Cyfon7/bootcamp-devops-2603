import csv

with open("servidores.txt", "w", encoding="utf-8") as f:
    f.write("web-01,ok\nweb-02,error\n")

try:
    with open("servidores.txt", encoding="utf-8") as f:
        filas = [linea.strip().split(",") for linea in f]
except FileNotFoundError:
    print("No se encontró el archivo")
    filas = []

with open("reporte.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(["servidor", "estado"])
    writer.writerows(filas)