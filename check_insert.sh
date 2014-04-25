#!/bin/bash

ultimo=$( mysql -e 'select id from trama order by id desc limit 1;' table | grep -v '^id$' )
anterior=$(cat /tmp/ultimatrama)
res=$(($ultimo-$anterior))

echo $ultimo > /tmp/ultimatrama

if [ "$res" -lt 1 ]; then
    echo "Critical - [SISTEMA] No se ha detectado movimiento en la insercion tramas."
    exit 2
else
    echo "OK" $res
    exit 0
fi

