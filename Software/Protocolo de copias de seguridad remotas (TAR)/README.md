## Copias de Seguridad remotas (TAR) ##
### Configurar el sistema para ejecutar el Script de copias remotas automáticamente. ###
<table>
 <tr>
  <td>
   <div align="center">
    REALIZAR TANTO EN EL SERVIDOR MAESTRO COMO EN LOS SERVIDORES ESCLAVOS
   </div>

  1. Crearemos un usuario mediante el comando “sudo adduser [usuario]”.
  2. Crearemos un grupo mediante el comando “sudo groupadd [grupo]”.
  3. Añadiremos el usuario al grupo mediante el comando “sudo adduser [usuario] [grupo]”.
  4. Ahora abriremos el archivo “Sudoers”, mediante el comando “sudo visudo” o “sudo nano /etc/sudoers”.
  5. Al final del archivo debemos añadir la siguiente línea “%[grupo] ALL=(root) NOPASSWD: /usr/bin/tar”.
  6. Ahora guardaremos el archivo y saldremos de este.
  7. Posteriormente, nos moveremos al directorio “/usr/bin” mediante el comando “cd /usr/bin”.
  8. En este directorio debemos crear un archivo mediante el comando “sudo nano Tar.sh”.
  9. Dentro de este archivo debemos de insertar las siguientes sentencias:
#!/bin/sh
sudo /usr/bin/tar $*
  10. Ahora guardaremos el archivo y saldremos de este.
  11. Después, tenemos que asignarle los permisos y propiedad adecuados al fichero, mediante los comandos:
  
  - "sudo chown root:[Grupo] /usr/bin/Tar.sh"
  - "sudo chmod 750 /usr/bin/Tar.sh"
  
  </td>
 </tr>
</table>

### Creación de claves SSH para la automatización y securización del proceso de apagado. ###
REALIZAR EN LOS NODOS DEL CLUSTER Y TRASPASARLA AL NAS
1º - Creación de las claves mediante el comando “ssh-keygen -b 4096 -t rsa”.
2º - Traspaso de claves mediante el comando “ssh-copy-id -i [Clave_publica] 
[Nombre_Usuario_NAS]@[IP_Nodos_NAS]”.

1º - Debemos iniciar sesión con el usuario de 
copias remotas, mediante el comando “su 
[usuario]”.
2º - Posteriormente, desde este usuario 
ejecutaremos el comando “crontab -e” que nos 
permitirá acceder al archivo “Crontab” (Cada 
usuario tiene un archivo Crontab personal).
3º - Al final de este archivo debemos añadir la 
siguiente sentencia:
"@daily [usuario] /[ruta]/[script.sh]"

1º - Otra manera de acceder al fichero personal 
de automatización “Crontab” es ejecutando el 
siguiente comando:
“sudo crontab -u [usuario] -d”
2º - Al final de este archivo debemos añadir la 
siguiente sentencia:
"@daily [usuario] /[ruta]/[script.sh]
