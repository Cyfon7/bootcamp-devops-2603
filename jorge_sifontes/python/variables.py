servidor = "web-01"     # str
puerto = 8080           # int
cpu = 73.5              # float
activo = True           # bool

print(type(puerto))     # <class 'int'>
print(puerto + 1)       # 8081
print(cpu > 80)         # False
print(10 // 3, 10 % 3)  # 3 1
print(f"{servidor}:{puerto} activo={activo}") # web-01:8080 activo=True