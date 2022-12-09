#!/bin/sh
#Variables de entorno
Date=$(date +%Y-%m-%d)
CarpetaOrigen=/

echo ""
echo "--------------------------------------------------------------"
echo "Comienza la copia de seguridad desde la carpeta $CarpetaOrigen"
echo "--------------------------------------------------------------"
sleep 5
sudo tar --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --
exclude=/media/* --exclude="swapfile" --exclude="lost+found" --exclude=".cache" --exclude="Downloads" --
exclude=".VirtualBoxVMs" --exclude=".ecryptfs" -zcvf - $CarpetaOrigen | ssh sshd@192.168.192.8 "cat > 
/shares/Backups/Master_$Date.img"
echo "----------------"
echo "Copia completada"
echo "----------------"
