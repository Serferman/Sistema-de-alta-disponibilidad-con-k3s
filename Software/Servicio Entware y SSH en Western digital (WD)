## Proceso para crear carpetas permanentes en el NAS y fortalecer su acceso SSH. ##
### Instalación de “Entware” en el NAS. ###

1.- Bajar el binario " https://dl.cloudsmith.io/public/wdcommunity/EX2Ultra/raw/names/entware/versions/21.04.07/entware_21.04.07_EX2Ultra.bin".
2.- Una vez descargado, lo instalaremos en la parte de "Aplicaciones" de la interfaz gráfica del NAS.
3.- Una vez ahí, debemos pulsar sobre “Instalar una aplicación manualmente”.
4º - Al pulsar sobre esta, se nos abrirá el explorador de archivos de nuestro sistema, para que busquemos 
el archivo que queremos instalar.
5º - Una vez se instale correctamente el software, seleccionaremos la nueva aplicación y pulsaremos 
sobre “configurar” para poder al apartado de instalación de aplicaciones de “Entware”. 
6º - Una vez ahí, podremos apreciar 3 recuadros:
- Search → Nos permite hacer una búsqueda de cualquier paquete.
- Install → Nos permite instalar un paquete que previamente ha sido encontrado.
- Remove → Nos permite eliminar un paquete que previamente ha sido instalado.

### Proceso para mantener la configuración del servidor SSH en el NAS. ###
1º - Primero, debemos iniciar sesión en el NAS mediante el comando “sshd@[IP]”.
2º - Una vez dentro del sistema, nos moveremos al directorio de “Entware” y ahí, abriremos el archivo 
“init.d” mediante el comando “sudo vi init.d”.
3º - Al final de este archivo tenemos que añadir 2 sentencias de comandos:
“cat /mnt/HD/HD_a2/Nas_Prog/entware/[File_conf_sshd_modificado] > /etc/ssh/[sshd_config]”
“kill -HUP `cat /var/run/sshd.pid`”
4º - Una vez escritos los comandos dentro del archivo “init.d”, debemos guardarlo y salir de él.
5º - Ahora en la misma carpeta, crearemos un archivo de texto, para insertar la configuración clonada 
del archivo “sshd_config”. Todo esto mediante el comando “touch sshd_config_mod”
6º - Una vez hayamos insertado los datos en el archivo modificado, debemos guardarlo.

Archivo de configuración modificado del servicio SSH en el NAS. 
Copias de Seguridad remotas (TAR)
Configurar el sistema para ejecutar el Script de copias remotas automáticamente.
Port [] 
Protocol 2
Hostkey /etc/ssh/ssh_host_rsa_key
SyslogFacility AUTHPRIV
AllowUsers sshd
PermitRootLogin no
PubkeyAuthentication yes
PermitEmptyPasswords no
PasswordAuthentication no
ChallengeResponseAuthentication no
TCPKeepAlive yes
MasAuthTries 5
Subsystem sftp /usr/bin/sftp-server
REALIZAR TANTO EN EL SERVIDOR MAESTRO COMO EN LOS SERVIDORES ESCLAVOS
1º - Crearemos un usuario mediante el comando “sudo adduser [usuario]”.
2º - Crearemos un grupo mediante el comando “sudo groupadd [grupo]”.
3º - Añadiremos el usuario al grupo mediante el comando “sudo adduser [usuario] [grupo]”.
4º - Ahora abriremos el archivo “Sudoers”, mediante el comando “sudo visudo” o “sudo nano 
/etc/sudoers”.
5º - Al final del archivo debemos añadir la siguiente línea “%[grupo] ALL=(root) NOPASSWD: 
/usr/bin/tar”.
6º - Ahora guardaremos el archivo y saldremos de este.
7º - Posteriormente, nos moveremos al directorio “/usr/bin” mediante el comando “cd /usr/bin”.
8º - En este directorio debemos crear un archivo mediante el comando “sudo nano Tar.sh”.
9º - Dentro de este archivo debemos de insertar las siguientes sentencias:
#!/bin/sh
sudo /usr/bin/tar $*
10º - Ahora guardaremos el archivo y saldremos de este.
11º - Después, tenemos que asignarle los permisos y propiedad adecuados al fichero, mediante los 
comandos:
- "sudo chown root:[Grupo] /usr/bin/Tar.sh"
- "sudo chmod 750 /usr/bin/Tar.sh"
Creación de claves SSH para la automatización y securización del proceso de apagado.

REALIZAR EN LOS NODOS DEL CLUSTER Y TRASPASARLA AL NAS
1º - Creación de las claves mediante el comando “ssh-keygen -b 4096 -t rsa”.
2º - Traspaso de claves mediante el comando “ssh-copy-id -i [Clave_publica] 
[Nombre_Usuario_NAS]@[IP_Nodos_NAS]”
