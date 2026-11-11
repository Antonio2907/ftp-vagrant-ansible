#!/usr/bin/env bash
#
# Prueba del servidor web: comprueba código HTTP 200 y el texto de index.html
#
URL=http://192.168.57.7/

codigo=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
if [ "$codigo" != "200" ]; then
  echo "FALLO: código HTTP $codigo (esperado 200)"
  exit 1
fi

if curl -s "$URL" | grep -q "Servidor web de antonio.test"; then
  echo "OK: Apache responde 200 y sirve la página esperada"
else
  echo "FALLO: la respuesta no contiene el texto esperado"
  exit 1
fi