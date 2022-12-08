## Administración del UPS Riello 800VA ##
### Instalación de PowerShield (Servidor maestro). ###
<table>
 <tr>
  <td>
    
  1. Primero crearemos una carpeta dentro de <b> “/etc” </b>, la cual tendrá el nombre de esta aplicación. Para ello, ejecutaremos el siguiente comando <b> “sudo mkdir PowerShield”</b>.
  2. Debemos descargar el archivo <b> “.deb” </b> para poder instalarlo en el sistema. Para ello ejecutaremos el siguiente comando <b> “wget https://www.riello-ups.es/uploads/file/64/1064/upsmon-5.3.0-linux2.6-x86_64.deb”</b>.
  3. Ahora debemos descomprimir e instalar el archivo. Para ello ejecutaremos el siguiente comando <b> “sudo dpkg -i [Nombre_del_Paquete.deb]”</b>.
  4. Una vez hayamos instalado el paquete, los archivos de la aplicación estarán en la ruta <b> “/opt/upsmon” </b>, por lo que nos debemos mover ahí con el comando <b> “cd /opt/upsmon”</b>.
  5. Una vez ahí, debemos ejecutar el Script de la aplicación para ponerla en marcha. Para ello ejecutamos el comando <b> “sudo ./upsetup”</b>.
    
  </td>
 </tr>
</table>
    
### Configuración de PowerShield (Servidor maestro). ###
<table>
 <tr>
  <td>
    
  1. Cuando ya hemos ejecutado el script de configuración del software <b> “upsetup” </b>, debemos de irnos a la quinta opción del menú emergente <b> “Configuración de trabajo”</b>.
  2. En el siguiente menú emergente, pulsaremos sobre <b> “Gestor hechos – hechos base”</b>.
  3. Posteriormente, nos iremos a <b> “Falta de red. SAI desde batería”</b>.
  4. En el menú que nos aparece, pulsaremos sobre <b> “Ejec. archivo” </b> y así, entraremos dentro del último menú, en el que configuraremos lo siguiente:
  - <b> Ejec. archivo </b> → Aquí definiremos si queremos activar esta directiva mediante SI o NO.
  - <b> Retardo </b> → Es el tiempo que tardará en ejecutar el archivo por primera vez.
  - <b> Interv. (s) </b> → Es el tiempo que tardará en volver a ejecutar el archivo por segunda vez.
  - <b> Archivo </b> → Es la ruta donde estará el script que se ejecutará y el nombre de este.
  5. Ahora pulsaremos todo el rato <b> “Salir” </b> y cuando estemos otra vez en terminal, ejecutaremos <b> “sudo ./upsrestart” </b> para reiniciar el servicio con permisos de administrador.

  </td>
 </tr>
</table>
   

### Configuración del sistema para la ejecución del Script de apagado automáticamente. ###
<div align="center"> 
 <table>
  <tr>
   <td>
   <div align="center">
    REALIZAR TANTO EN EL SERVIDOR MAESTRO COMO EN LOS SERVIDORES ESCLAVOS
   </div>
    
  1. Crearemos un usuario mediante el comando <b> “sudo adduser [usuario]”</b>.
  2. Crearemos un grupo mediante el comando <b> “sudo groupadd [grupo]”</b>.
  3. Añadiremos el usuario al grupo mediante el comando <b>“sudo adduser [usuario] [grupo]”</b>. 
  4. Ahora abriremos el archivo <b> “Sudoers”</b>, mediante el comando <b> “sudo visudo”</b> o <b> “sudo nano /etc/sudoers”</b>.
  5. Al final del archivo debemos añadir la siguiente línea <b> “%[grupo] ALL=(root) NOPASSWD: /sbin/poweroff”</b>.
  6. Ahora guardaremos el archivo y saldremos de este.
  7. Posteriormente, nos moveremos al directorio <b> “/usr/bin” </b> mediante el comando <b> “cd /usr/bin”</b>.
  8. En este directorio debemos crear un archivo mediante el comando <b> “sudo nano Poweroff.sh”</b>.
  9. Dentro de este archivo debemos de insertar las siguientes sentencias:

   <div align="center"><b>
    #!/bin/sh <br/>
    sudo /sbin/poweroff $*
   </b></div>
   <br/>
      
  10. Ahora guardaremos el archivo y saldremos de este.   
  11. Después, tenemos que asignarle los permisos y propiedad adecuados al fichero, mediante los comandos:
  - <b> "sudo chown root.[Grupo] /usr/bin/Poweroff.sh" </b>
  - <b> "sudo chmod 750 /usr/bin/Poweroff.sh" </b>
  
   </td>
  </tr>
 </table>
</div>

### Creación de claves SSH para la automatización y securización del proceso de apagado. ###
 <table>
  <tr>
   <td>
   <div align="center">
    REALIZAR EN EL SERVIDOR MAESTRO Y TRASPASARLA A LOS ESCLAVOS Y A SI MISMO
   </div>
     
  1. Creación de las claves mediante el comando <b> “ssh-keygen -b 4096 -t rsa”</b>.
  2. Ahora debemos cambiarle los permisos y la propiedad a la clave privada mediante los siguientes comandos:
  - <b> "sudo chown [Usuario_maestro]:[Grupo_Apagado] [Clave_privada]" </b>
  - <b> "sudo chmod 750 [Clave_privada]" </b>
  3. Traspaso de claves mediante el comando <b> “ssh-copy-id -i [Clave_publica] [Nombre_Usuario_Apagado_worker]@[IP_Nodos_Workers]”</b>

   </td>
  </tr>
 </table>
