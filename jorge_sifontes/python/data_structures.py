servidores = ["web-01", "web-02", "db-01"]  # lista
servidores.append("cache-01")

conexion = ("10.0.0.5", 5432)               # tupla
host, puerto = conexion

conteo = {}                                  # diccionario
for codigo in [200, 404, 200, 500]:
    conteo[codigo] = conteo.get(codigo, 0) + 1
print(conteo)    # {200: 2, 404: 1, 500: 1}

ips = {"10.0.0.1", "10.0.0.2", "10.0.0.1"}  # set
print(len(ips))  # 2