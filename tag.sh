#!/bin/bash
###########################################################
# Editar tags ID3 en archivos mp3 en modo batch en Linux #
#########################################################

for FILE in *.mp3;
do
  # String year, song and artist
  NAME=$(echo "$FILE" | cut -d'.' -f1)
  YEAR=$(echo "$NAME" | cut -d'-' -f1)
  SONG=$(echo "$NAME" | cut -d'-' -f2)
  ARTIST=$(echo "$NAME" | cut -d'-' -f3)

  # Trim leading and trailing whitespaces
  YEAR=$(echo "${YEAR}" | awk '{gsub(/^ +| +$/,"")} {print $0}')
  SONG=$(echo "${SONG}" | awk '{gsub(/^ +| +$/,"")} {print $0}')
  ARTIST=$(echo "${ARTIST}" | awk '{gsub(/^ +| +$/,"")} {print $0}')

  # Set new ID3 tags
  eyeD3 -2 -Y "${YEAR}" -t "${SONG}" -a "${ARTIST}" "${FILE}"
done

# El funcionamiento del script es muy simple, para cada tema extrae los campos desde 
# el nombre del archivo y luego carga los tags ejecutando el comando:
#
# 	eyeD3 -2 -Y "${YEAR}" -t "${SONG}" -a "${ARTIST}" "${FILE}"
#
# La opción -2 se utiliza para que genere tags IDv2.x, con -Y se especifica el año,
# -t indica el título (nombre del tema) y -a el nombre del artista o banda.
# Finalmente se indica el archivo a modificar.
