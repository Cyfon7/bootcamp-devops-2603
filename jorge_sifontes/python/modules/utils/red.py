def es_exitoso(codigo: int) -> bool:
    """Devuelve True si el código HTTP indica éxito."""
    return 200 <= codigo < 400