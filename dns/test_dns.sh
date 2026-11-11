#!/usr/bin/env bash
#
# Pruebas de los registros DNS de antonio.test
#
DNS=192.168.57.5
errores=0

comprobar() {
  local descripcion="$1" esperado="$2" obtenido="$3"
  if [ "$obtenido" = "$esperado" ]; then
    echo "OK    $descripcion -> $obtenido"
  else
    echo "FALLO $descripcion: esperado '$esperado', obtenido '$obtenido'"
    errores=$((errores + 1))
  fi
}

# Zona directa
comprobar "dns.antonio.test"     "192.168.57.5" "$(dig +short @$DNS dns.antonio.test A)"
comprobar "negocio.antonio.test" "192.168.57.7" "$(dig +short @$DNS negocio.antonio.test A)"

# CNAME (+short devuelve el destino y luego la IP; nos quedamos con la primera línea)
comprobar "www.antonio.test" "negocio.antonio.test." "$(dig +short @$DNS www.antonio.test CNAME)"
comprobar "ftp.antonio.test" "negocio.antonio.test." "$(dig +short @$DNS ftp.antonio.test CNAME)"

# Zona inversa
comprobar "PTR 192.168.57.5" "dns.antonio.test."     "$(dig +short @$DNS -x 192.168.57.5)"
comprobar "PTR 192.168.57.7" "negocio.antonio.test." "$(dig +short @$DNS -x 192.168.57.7)"

if [ "$errores" -eq 0 ]; then
  echo "Todas las pruebas DNS han pasado."
else
  echo "$errores prueba(s) han fallado."
  exit 1
fi