## Copias de Seguridad remotas (TAR) ##
### Configurar el sistema para ejecutar el Script de copias remotas automáticamente. ###
<div align="center">
<table>
 <tr>
  <td>
   <div align="center">
    REALIZAR TANTO EN EL SERVIDOR MAESTRO COMO EN LOS SERVIDORES ESCLAVOS
   </div>
   <br/>

  1. Crearemos un usuario mediante el comando <b> “sudo adduser [usuario]”</b>.
  2. Crearemos un grupo mediante el comando <b> “sudo groupadd [grupo]”</b>.
  3. Añadiremos el usuario al grupo mediante el comando <b> “sudo adduser [usuario] [grupo]”</b>.
  4. Ahora abriremos el archivo <b> “Sudoers”</b>, mediante el comando <b> “sudo visudo” </b> o <b> “sudo nano /etc/sudoers”</b>.
  5. Al final del archivo debemos añadir la siguiente línea <b> “%[grupo] ALL=(root) NOPASSWD: /usr/bin/tar”</b>.
  6. Ahora guardaremos el archivo y saldremos de este.
  <br/>
  
  7. Posteriormente, nos moveremos al directorio <b> “/usr/bin” </b> mediante el comando <b> “cd /usr/bin”</b>.
  8. En este directorio debemos crear un archivo mediante el comando <b> “sudo nano Tar.sh”</b>.
  9. Dentro de este archivo debemos de insertar las siguientes sentencias:
  
  <div align="center">
   <b> #!/bin/sh </b>
    <br/>
   <b> sudo /usr/bin/tar $* </b>
  </div>
 
  10. Ahora guardaremos el archivo y saldremos de este.
  11. Después, tenemos que asignarle los permisos y propiedad adecuados al fichero, mediante los comandos:
  
  - <b> "sudo chown root:[Grupo] /usr/bin/Tar.sh" </b>
  - <b> "sudo chmod 750 /usr/bin/Tar.sh" </b>
  
  </td>
 </tr>
</table>
</div>

### Creación de claves SSH para la automatización y securización del proceso de apagado. ###
<div align="center">
<table>
 <tr>
  <td>
   <div align="center">
    REALIZAR EN LOS NODOS DEL CLUSTER Y TRASPASARLA AL NAS
   </div>
   <br/>
   
 1. Creación de las claves mediante el comando <b> “ssh-keygen -b 4096 -t rsa” </b>.
 2. Traspaso de claves mediante el comando <b> “ssh-copy-id -i [Clave_publica] 
[Nombre_Usuario_NAS]@[IP_Nodos_NAS]” </b>.

  </td>
 </tr>
</table>
</div>
 
### Programación del Script para su ejecución a lo largo del tiempo (Cron/Crontab). ###
<table>
 <tr>
  <td>
  
 1. Debemos iniciar sesión con el usuario de copias remotas, mediante el comando <b> “su [usuario]”</b>.
 2. Posteriormente, desde este usuario ejecutaremos el comando <b> “crontab -e” </b> que nos permitirá acceder al archivo <b> “Crontab” </b> (Cada usuario tiene un archivo Crontab personal).
 3. Al final de este archivo debemos añadir la siguiente sentencia:
   <div align="center">
    <b> "@daily [usuario] /[ruta]/[script.sh]" </b>
   </div>
  </td>
  <td>
  
 1. Otra manera de acceder al fichero personal de automatización <b> “Crontab” </b> es ejecutando el siguiente comando:
   <div align="center">
    <b> “sudo crontab -u [usuario] -d” </b>
   </div>
   <br/>
 
 2. Al final de este archivo debemos añadir la siguiente sentencia:
   <div align="center">
    <b> "@daily [usuario] /[ruta]/[script.sh] </b>
   </div>
   <br/>
  </td>
 </tr>
</table>
