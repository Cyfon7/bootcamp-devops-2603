codigos = [200, 404, 500, 200, 503]

for codigo in codigos:
    if codigo >= 500:
        print(f"{codigo}: error del servidor")
    elif codigo >= 400:
        print(f"{codigo}: error del cliente")
    else:
        print(f"{codigo}: OK")

intentos = 0
while intentos < 3:
    intentos += 1
    print(f"Reintento {intentos}")