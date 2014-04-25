#!/bin/bash
tiempo=$(               echo "select TIMEDIFF(CONVERT_TZ(now(),'+00:00','+03:00'),fecha_entrada) Deltasegs from rsLite.trama order by id desc limit 1;" \
                        | mysql db \
                        | grep -v '^Deltasegs$')

recorta=$(              echo $tiempo | gawk '{print $1 $2}' FS=":")

#imprime=$(             echo $tiempo | cut -d " " -f 1)

if [ "$recorta" -gt 09 ]; then
    echo "CRITICAL - Se ha detectado retraso en las tramas"  "#####" $tiempo "#####"
    exit 2
else
    echo "No hay retraso OK" $tiempo
    exit 0
fi

