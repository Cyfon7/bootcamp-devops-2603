def porcentaje_errores(errores, total):
    """Devuelve el porcentaje de errores sobre el total."""
    try:
        return round(errores / total * 100, 2)
    except ZeroDivisionError:
        print("Advertencia: total es 0")
        return 0.0
    except TypeError as e:
        print(f"Dato inválido: {e}")
        return None

print(porcentaje_errores(25, 200))  # 12.5
print(porcentaje_errores(5, 0))     # 0.0
print(porcentaje_errores("5", 10))  # None