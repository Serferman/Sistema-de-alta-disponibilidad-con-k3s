## Proceso para crear carpetas permanentes en el NAS y fortalecer su acceso SSH. ##
### Instalación de “Entware” en el NAS. ###
<table>
 <tr>
  <td>
  
  1. Bajar el binario " https://dl.cloudsmith.io/public/wdcommunity/EX2Ultra/raw/names/entware/versions/21.04.07/entware_21.04.07_EX2Ultra.bin".
  2. Una vez descargado, lo instalaremos en la parte de "Aplicaciones" de la interfaz gráfica del NAS.
  3. Una vez ahí, debemos pulsar sobre “Instalar una aplicación manualmente”.
  4. Al pulsar sobre esta, se nos abrirá el explorador de archivos de nuestro sistema, para que busquemos el archivo que queremos instalar.
  5. Una vez se instale correctamente el software, seleccionaremos la nueva aplicación y pulsaremos sobre “configurar” para poder al apartado de instalación de aplicaciones de “Entware”. 
  6. Una vez ahí, podremos apreciar 3 recuadros:
  
  - Search → Nos permite hacer una búsqueda de cualquier paquete.
  - Install → Nos permite instalar un paquete que previamente ha sido encontrado.
  - Remove → Nos permite eliminar un paquete que previamente ha sido instalado.
  
  </td>
 </tr>
</table>

### Proceso para mantener la configuración del servidor SSH en el NAS. ###
<table>
 <tr>
  <td>
 
 1. Primero, debemos iniciar sesión en el NAS mediante el comando “sshd@[IP]”.
 2. Una vez dentro del sistema, nos moveremos al directorio de “Entware” y ahí, abriremos el archivo “init.d” mediante el comando “sudo vi init.d”.
 3. Al final de este archivo tenemos que añadir 2 sentencias de comandos:
 
 <b> “cat /mnt/HD/HD_a2/Nas_Prog/entware/[File_conf_sshd_modificado] > /etc/ssh/[sshd_config]” </b>
<br/>
 <b> “kill -HUP `cat /var/run/sshd.pid`” </b> 
 
 4. Una vez escritos los comandos dentro del archivo “init.d”, debemos guardarlo y salir de él.
 5. Ahora en la misma carpeta, crearemos un archivo de texto, para insertar la configuración clonada del archivo “sshd_config”. Todo esto mediante el comando “touch sshd_config_mod”
 6. Una vez hayamos insertado los datos en el archivo modificado, debemos guardarlo.
 
  </td>
 </tr>
</table>

### Archivo de configuración modificado del servicio SSH en el NAS. ###
<table>
 <tr>
  <td>
   <b>
 - Port [] 
 - Protocol 2
 - Hostkey /etc/ssh/ssh_host_rsa_key
 - SyslogFacility AUTHPRIV
 - AllowUsers sshd
 - PermitRootLogin no
 - PubkeyAuthentication yes
 - PermitEmptyPasswords no
 - PasswordAuthentication no
 - ChallengeResponseAuthentication no
 - TCPKeepAlive yes
 - MasAuthTries 5
 - Subsystem sftp /usr/bin/sftp-server
   </b>
  </td>
 </tr>
</table>
