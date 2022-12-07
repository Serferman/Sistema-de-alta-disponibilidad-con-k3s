#!/bin/bash
#Declaración de variables
Cont=0

#Declaración de constantes
IP=("IP_ADDRESS_1" "IP_ADDRESS_2" "IP_ADDRESS_3" "IP_ADDRESS_4" "IP_ADDRESS_5")
Usuarios=("USERNAME_SHUTDOWN_1" "USERNAME_SHUTDOWN_2" "USERNAME_SHUTDOWN_3" "USERNAME_SHUTDOWN_4" "USERNAME_SHUTDOWN_5")
Puertos=("SSH_PORT_NODE_1" "SSH_PORT_NODE_2" "SSH_PORT_NODE_3" "SSH_PORT_NODE_4" "SSH_PORT_NODE_5")
NumeroNodos=5
TiempoDeEspera=5

#Declaración de las estructuras de control
 
 echo ""
 echo " Empezamos con el apagado secuencial"
 echo " -----------------------------------"
 
while [ $Cont -le $NumeroNodos ]
 do
 
  echo " Haciendo ping a" "${IP[Cont]}"
  echo " -----------------------------"
  echo ""
  
 if $( ping -c 4 "${IP[Cont]}" >/dev/null )
  then
   ssh -i [Ruta]/[Clave_privada] "${Usuarios[Cont]}"@"${IP[Cont]}" -p "${IP[Puertos]}" sudo -S poweroff
  
   echo " El servidor" "${IP[Cont]}" "esta siendo APAGADO o COMPROBADO,"
   echo " daremos un tiempo de gracia de $TiempoDeEspera segundos"
   echo " ------------------------------------------"
   echo ""
   sleep $TiempoDeEspera
 
  else
   echo "No hay PING a esta IP" "${IP[Cont]}"", por lo que pasaremos a la siguiente"
   echo ""
   Cont=$((Cont+1))
  fi
 done
