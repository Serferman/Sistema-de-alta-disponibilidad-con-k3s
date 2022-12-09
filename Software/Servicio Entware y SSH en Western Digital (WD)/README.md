## Proceso para crear carpetas permanentes en el NAS y fortalecer su acceso SSH. ##
### Instalación de “Entware” en el NAS. ###
<table>
 <tr>
  <td>
  
  1. Bajar el binario " https://dl.cloudsmith.io/public/wdcommunity/EX2Ultra/raw/names/entware/versions/21.04.07/entware_21.04.07_EX2Ultra.bin".
  2. Una vez descargado, lo instalaremos en la parte de <b> "Aplicaciones" </b> de la interfaz gráfica del NAS.
  3. Una vez ahí, debemos pulsar sobre <b> “Instalar una aplicación manualmente”</b>.
  4. Al pulsar sobre esta, se nos abrirá el explorador de archivos de nuestro sistema, para que busquemos el archivo que queremos instalar.
  5. Una vez se instale correctamente el software, seleccionaremos la nueva aplicación y pulsaremos sobre <b> “configurar” </b> para poder al apartado de instalación de aplicaciones de “Entware”. 
  6. Una vez ahí, podremos apreciar 3 recuadros:
  
  - <b> Search </b> → Nos permite hacer una búsqueda de cualquier paquete.
  - <b> Install </b> → Nos permite instalar un paquete que previamente ha sido encontrado.
  - <b> Remove → </b> Nos permite eliminar un paquete que previamente ha sido instalado.
  
  </td>
 </tr>
</table>

### Proceso para mantener la configuración del servidor SSH en el NAS. ###
<table>
 <tr>
  <td>
 
 1. Primero, debemos iniciar sesión en el NAS mediante el comando <b> “sshd@[IP]”</b>.
 2. Una vez dentro del sistema, nos moveremos al directorio de <b> “Entware” </b> y ahí, abriremos el archivo <b> “init.d” </b> mediante el comando <b> “sudo vi init.d”</b>.

 - <b> “cat /mnt/HD/HD_a2/Nas_Prog/entware/[File_conf_sshd_modificado] > /etc/ssh/[sshd_config]” </b>
 - <b> “kill -HUP 'cat /var/run/sshd.pid'” </b> 

 4. Una vez escritos los comandos dentro del archivo <b> “init.d”</b>, debemos guardarlo y salir de él.
 5. Ahora en la misma carpeta, crearemos un archivo de texto, para insertar la configuración clonada del archivo <b> “sshd_config”</b>. Todo esto mediante el comando <b> “touch sshd_config_mod”</b>
 6. Una vez hayamos insertado los datos en el archivo modificado, debemos guardarlo.
 
  </td>
 </tr>
</table>

### Archivo de configuración modificado del servicio SSH en el NAS. ###
<div align="center">
 <table>
  <tr>
   <td>
    
 - <b>Port []</b> 
 - <b>Protocol 2 </b>
 - <b>Hostkey /etc/ssh/ssh_host_rsa_key </b>
 - <b>SyslogFacility AUTHPRIV </b>
 - <b>AllowUsers sshd </b>
 - <b>PermitRootLogin no </b>
 - <b>PubkeyAuthentication yes </b>
 - <b>PermitEmptyPasswords no </b>
 - <b>PasswordAuthentication no </b>
 - <b>ChallengeResponseAuthentication no </b>
 - <b>TCPKeepAlive yes </b>
 - <b>MasAuthTries 5 </b>
 - <b>Subsystem sftp /usr/bin/sftp-server </b>
   </td>
  </tr>
 </table>
</div>
