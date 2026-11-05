#!/usr/bin/env bash
set -euo pipefail

# Mostrar el sistema operativo.
if [[ -r /etc/os-release ]]; then
# Comentario despues de ejecutar: shellcheck scripts/info-entorno.sh
# In scripts/info-entorno.sh line 6:
#   . /etc/os-release
#     ^-------------^ SC1091 (info): Not following: /etc/os-release was not specified as input (see shellcheck -x).

# For more information:
#   https://www.shellcheck.net/wiki/SC1091 -- Not following: /etc/os-release wa...
  . /etc/os-release
  printf 'Sistema operativo: %s\n' "${PRETTY_NAME:-Desconocido}"
else
  printf 'Sistema operativo: %s\n' "$(uname -s)"
fi

# Mostrar el número de CPU disponibles.
if command -v nproc >/dev/null 2>&1; then
  cpu_count=$(nproc)
else
  cpu_count=$(getconf _NPROCESSORS_ONLN)
fi
printf 'Número de CPU: %s\n' "$cpu_count"

# Mostrar la memoria total y la memoria disponible en Linux.
# Se usa MemAvailable cuando está presente; si no, se usa MemFree.
if [[ -r /proc/meminfo ]]; then
  awk '
    /^MemTotal:/     { total = $2 }
    /^MemAvailable:/ { available = $2 }
    /^MemFree:/      { free = $2 }
    END {
      if (!available) available = free
      if (total)     printf "Memoria total: %.2f GiB\n", total / 1048576
      else           print "Memoria total: no disponible"
      if (available) printf "Memoria libre/disponible: %.2f GiB\n", available / 1048576
      else           print "Memoria libre/disponible: no disponible"
    }
  ' /proc/meminfo
else
  printf 'Memoria: no disponible (este script espera /proc/meminfo)\n'
fi

# Mostrar el uso del disco de la raíz.
df -h /

# Mostrar la versión de Git, si está instalado.
if command -v git >/dev/null 2>&1; then
  git --version
else
  printf 'Git: no instalado\n'
fi

# Mostrar la versión de Python 3, si está instalado.
if command -v python3 >/dev/null 2>&1; then
  python3 --version
else
  printf 'Python 3: no instalado\n'
fi