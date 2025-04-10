#!/bin/bash

# Kullanıcıdan dosya ismi al
if [ -z "$1" ]; then
    echo "Kullanim: ./debugc.sh dosya"
    exit 1
fi

FILE="$1"
OUT="${FILE%.c}"

# Derleme işlemi
gcc -g "$FILE" -o "$OUT"
if [ $? -ne 0 ]; then
    echo "Derleme hatasi!"
    exit 2
fi

# GDB'yi başlat
echo "# GDB aciliyor. 'next' yazarak satir satir ilerleyebilirsiniz."
gdb -q -x gdb_cmds.txt ./$OUT

