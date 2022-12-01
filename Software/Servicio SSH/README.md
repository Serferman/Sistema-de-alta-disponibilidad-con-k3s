## Creación del servicio SSH
Para instalar el servicio SSH no debería haber muchas dificultades, ya que el proceso que se debe de realizar no es muy complicado. El principal problema es que estamos tratando con diferentes tipos de ordenadores, por lo que la instalación/activación del servicio puede variar. La manera más simple y general de instalarlo es con el siguiente comando:

<div align="center"> <b>
  “sudo apt-get install openssh-server” 
</b></div>

<br/>

<div align="center" size="11">
  Raspberry Pi
</div>
    
<br/>

  | 1. Posteriormente a instalar el S.O en la Micro-SD, debemos insertarla en la Raspberry y esperar 2 – 3 minutos, de esta forma dejaremos tiempo para que se creen|     |los archivos del sistema.|
   2. Extraemos la tarjeta de la Raspberry y la ponemos dentro de un adaptador SD.
   3. Insertamos el adaptador en un ordenador y buscamos la carpeta “boot” dentro de la unidad de la tarjeta.
   4. Dentro de esta carpeta buscaremos los archivos <b>“cmdline.txt”</b> y <b>“config.txt”</b>.
   5. Abriremos el archivo <b>“cmdline.txt”</b> y añadiremos al final de este <b>“cgroup_memory=1 cgroup_enable=memory”</b>.
   6. Seguidamente añadiremos al final del mismo archivo la siguiente sentencia <b>“ip=Dirección_IP::Gateway:Mascara_Subred:Hostname:Interfaz_red:off”</b>.
   7. Posteriormente, Abriremos el archivo <b>“config.txt”</b> y añadiremos al final de este <b>“arm_64bit=1”</b>.
   8. Ahora, abriremos la Powershell y ejecutaremos el comando <b>“Letra_Unidad_SD”</b> para movernos a la unidad.
   9. Una vez ahí, ejecutaremos el comando <b>“new-item ssh”</b> o <b>“touch ssh”</b> para crear un archivo para el servicio SSH.
  10. Para finalizar, insertaremos la Micro-SD con la configuración dentro de la Raspberry PI.
   

<br/>

## Hardening del servicio SSH 
### Creación del par de claves
1. Abrimos la terminal del sistema operativo desde el que queramos conectarnos.
2. Ejecutaremos el comando “ssh-keygen” o “ssh-keygen -b 4096 -t rsa”.
3. Seguidamente nos pedirá un nombre para el par de claves y una contraseña para estas. Para procesos automáticos no hará falta ponerle una contraseña a la clave, ya que únicamente la autenticación por clave ya tiene una seguridad alta.

### Traspaso de claves desde Windows y Linux

#### Windows a Linux.
1. Antes de empezar con el proceso, debemos de crear la carpeta “.ssh” en el servidor Linux.
2. Posteriormente, debemos crear el archivo “authorized_keys” dentro de la carpeta “.ssh” con el comando “touch authorized_keys”
3. Debemos ejecutar el comando “scp [Clave_publica] [Usuario_ser]@[IP_Servidor]: [Ruta_donde_queremos_transferirlo]/”
4. Una vez tenemos la clave dentro de la carpeta “.ssh” debemos ejecutar el comando “cat [Clave_publica] > authorized_keys”.

#### Linux a Linux
1. Debemos ejecutar el comando “sudo ssh-copy-id -i [ruta]/[Clave_publica][Usuario_ser]@[IP_Servidor]”

### Comprobación del traspaso de claves al servidor Linux
1. Para comprobar que la clave se ha traspasado, debemos iniciar sesión en el servidor Linux y movernos a la carpeta “[home]/[Usuario]”.
2. Una vez ahí, ejecutaremos el comando “ls -la” para que nos liste todos los archivos, estén ocultos o no.
3. Ahora entraremos a la carpeta con el comando “cd .ssh”.
4. Posteriormente, dentro de la carpeta veremos un archivo llamado “authorized_keys”.
5. Para comprobar su contenido, basta con ejecutar el comando “sudo cat authorized_keys

### Cambio de autenticación de “usuario” y “contraseña” a par de clave
1. Debemos movernos dentro de la carpeta “/etc/ssh”.
2. Una vez ahí, abrimos el archivo “ssh_config”, ejecutando el comando “sudo nano sshd_config”.
3. Dentro del archivo de configuración, debemos buscar las siguientes líneas y descomentarlas.
- PermitRootLogin no (No permitimos que el usuario root (Pi), pueda iniciar sesion)
- PubkeyAuthentication yes (Permitimos la autenticación mediante Clave publica)
- PasswordAuthentication no (No permitimos la autenticación mediante contraseña)

Hardening del servicio SSH en cada nodo (sshd_config)
Port [Puertos] --> Los puertos que se utilizarán para conectarnos al servicio SSH.
LoginGraceTime 60 --> Tiempo máximo de conexión para la contraseña.
MaxAuthTries 3
AllowUsers [RemoteUser] [RemotePowerOffUser] [RemoteCopyUser]--> Usuarios permitidos para autenticarse en el sistema
HostbasedAuthentication no --> Autenticaciones basada en host NO.
IgnoreRhosts yes
X11Forwarding no --> No ejecutar aplicaciones gráficas
ClientAliveInterval (300) --> Cada 300 segundos mandará un mensaje al cliente comprobando que esté operativo.
ClientAliveCountMax (X) --> Veces que mandará un mensaje de comprobación al cliente cada (300).
MaxStartups (2) --> Conexiones Simultaneas
ChallengeRespondeAuthentication no
KerberosAuthentication no
GSSAPIAuthentication no
Banner [Ruta]/[Archivo_banner] --> Establecer una carta de presentación por SSH en cada nodo.

Crear banner para el inicio de sesión por SSH
1º - Primero, debemos de movernos a la carpeta que contendrá nuestro banner, para ello ejecutaremos 
“cd [ruta]”.
2º - Ahora ejecutaremos el siguiente comando para crear un archivo “sudo touch banner”.
3º - Para finalizar, abriremos el archivo banner e insertaremos cualquier contenido que queramos que se vea “sudo nano banner”.

Requisitos para iniciar sesión por clave
1º - Para iniciar sesión por clave pública y privada, debemos indicar varios atributos en el comando de 
conexión SSH, por lo tanto, el comando quedaría tal que así:
“sudo ssh -i [Clave_privada] [Usuario_server]@[IP_Server] -p [Puerto]”

Administración del servicio SSH (Una vez terminada la configuración)
1º - Para reiniciar el servicio SSH debemos ejecutar el siguiente comando:
“sudo systemctl restart ssh.service”
2º - Para saber el estado del servicio SSH debemos ejecutar el siguiente comando:
“sudo systemctl status ssh.service”
