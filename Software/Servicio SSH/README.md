## Creación del servicio SSH ##
Para instalar el servicio SSH no debería haber muchas dificultades, ya que el proceso que se debe de realizar no es muy complicado. El principal problema es que estamos tratando con diferentes tipos de ordenadores, por lo que la instalación/activación del servicio puede variar. La manera más simple y general de instalarlo es con el siguiente comando:

<div align="center"> <b>
  “sudo apt-get install openssh-server” 
</b></div>

<br/>

<table>
 <tr>
  <td>

   <div align="center"> <h3>
    Sistemas operativos "Raspberry Pi OS"
   </h3></div>

   1. Posteriormente a instalar el S.O en la Micro-SD, debemos insertarla en la Raspberry y esperar 2 – 3 minutos, de esta forma dejaremos tiempo para que se creen los archivos del sistema.
   2. Extraemos la tarjeta de la Raspberry y la ponemos dentro de un adaptador SD.
   3. Insertamos el adaptador en un ordenador y buscamos la carpeta “boot” dentro de la unidad de la tarjeta.
   4. Dentro de esta carpeta buscaremos los archivos <b>“cmdline.txt”</b> y <b>“config.txt”</b>.
   5. Abriremos el archivo <b>“cmdline.txt”</b> y añadiremos al final de este <b>“cgroup_memory=1 cgroup_enable=memory”</b>.
   6. Seguidamente añadiremos al final del mismo archivo la siguiente sentencia <b>“ip=Dirección_IP::Gateway:Mascara_Subred:Hostname:Interfaz_red:off”</b>.
   7. Posteriormente, Abriremos el archivo <b>“config.txt”</b> y añadiremos al final de este <b>“arm_64bit=1”</b>.
   8. Ahora, abriremos la Powershell y ejecutaremos el comando <b>“Letra_Unidad_SD”</b> para movernos a la unidad.
   9. Una vez ahí, ejecutaremos el comando <b>“new-item ssh”</b> o <b>“touch ssh”</b> para crear un archivo para el servicio SSH.
  10. Para finalizar, insertaremos la Micro-SD con la configuración dentro de la Raspberry PI.
  
  </td>
 </tr>
</table>

<br/>

## Hardening del servicio SSH ##
### Creación del par de claves ###
<table>
 <tr>
  <td>
  
  1. Abrimos la terminal del sistema operativo desde el que queramos conectarnos.
  2. Ejecutaremos el comando <b>“ssh-keygen”</b> o <b>“ssh-keygen -b 4096 -t rsa”</b>.
  3. Seguidamente nos pedirá un nombre para el par de claves y una contraseña para estas. Para procesos automáticos no hará falta ponerle una contraseña a la clave, ya que únicamente la autenticación por clave ya tiene una seguridad alta. 
  
  </td>
 </tr>
</table>

<br/>

### Traspaso de claves desde Windows y Linux ###
<table>
 <tr>
  <td>
    
   <div align="center">
    <h3>Windows a Linux.</h3>
   </div>
    
  </td>
  <td>
    
   <div align="center">
    <h3>Linux a Linux</h3>
   </div>
    
  </td>
 </tr>
 <tr>
  <td>
      
1. Antes de empezar con el proceso, debemos de crear la carpeta <b>“.ssh”</b> en el servidor Linux. 
2. Posteriormente, debemos crear el archivo <b>“authorized_keys”</b> dentro de la carpeta <b>“.ssh”</b> con el comando <b>“touch authorized_keys”</b>.
3. Debemos ejecutar el comando <b>“scp [Clave_publica] [Usuario_ser]@[IP_Servidor]: [Ruta_donde_queremos_transferirlo]/”</b>.
4. Una vez tenemos la clave dentro de la carpeta <b>“.ssh”</b> debemos ejecutar el comando <b>“cat [Clave_publica] > authorized_keys”</b>.
    
  </td>
  <td>    
    
1.‎ Debemos ejecutar el comando <b>“sudo ssh-copy-id -i [ruta]/[Clave_publica][Usuario_ser]@[IP_Servidor]”</b>.
    
  </td>
 </tr>
</table>

<br/>

### Comprobación del traspaso de claves al servidor Linux ###
<table>
 <tr>
  <td>
    
  1. Para comprobar que la clave se ha traspasado, debemos iniciar sesión en el servidor Linux y movernos a la carpeta <b>“[home]/[Usuario]”</b>.
  2. Una vez ahí, ejecutaremos el comando <b>“ls -la”</b> para que nos liste todos los archivos, estén ocultos o no.
  3. Ahora entraremos a la carpeta con el comando “<b>cd .ssh”</b>.
  4. Posteriormente, dentro de la carpeta veremos un archivo llamado <b>“authorized_keys”</b>.
  5. Para comprobar su contenido, basta con ejecutar el comando <b>“sudo cat authorized_keys"</b>.
    
  </td>
 </tr>
</table>
    
<br/>
    
### Cambio de autenticación de “usuario” y “contraseña” a par de clave ###
<div align="center">
 <table>
  <tr>
   <td>
    
  1. Debemos movernos dentro de la carpeta <b> “/etc/ssh” </b>.
  2. Una vez ahí, abrimos el archivo <b> “ssh_config” </b>, ejecutando el comando <b> “sudo nano sshd_config” </b>.
  3. Dentro del archivo de configuración, debemos buscar las siguientes líneas y descomentarlas.
  
  <br/>
  - <b> PermitRootLogin no </b> (No permitimos que el usuario root (Pi), pueda iniciar sesion)
  - <b> PubkeyAuthentication yes </b> (Permitimos la autenticación mediante Clave publica)
  - <b> PasswordAuthentication no </b> (No permitimos la autenticación mediante contraseña)
  <br/>
    
   </td>
  </tr>
 </table>
</div>

<br/>

### Hardening del servicio SSH en cada nodo (sshd_config) ###
<table>
 <tr>
  <td>
      
- <b> Port [Puertos] </b>--> Los puertos que se utilizarán para conectarnos al servicio SSH.
- <b> LoginGraceTime 60 </b>--> Tiempo máximo de conexión para la contraseña.
- <b> MaxAuthTries 3</b>
- <b> AllowUsers [RemoteUser] [RemotePowerOffUser] [RemoteCopyUser] </b>--> Usuarios permitidos para autenticarse en el sistema.
 <br/>
    
- <b> HostbasedAuthentication no </b> --> Autenticaciones basada en host NO.
- <b> IgnoreRhosts yes </b>
 <br/>
    
- <b> X11Forwarding no </b>--> No ejecutar aplicaciones gráficas
- <b> ClientAliveInterval (300) </b>--> Cada 300 segundos mandará un mensaje al cliente comprobando que esté operativo.
- <b> ClientAliveCountMax (X) </b>--> Veces que mandará un mensaje de comprobación al cliente cada (300).
 <br/>
    
- <b> MaxStartups (2) </b>--> Conexiones Simultaneas
 <br/>
    
- <b> ChallengeRespondeAuthentication no </b>
- <b> KerberosAuthentication no </b>
- <b> GSSAPIAuthentication no </b>
- <b> Banner [Ruta]/[Archivo_banner] </b> --> Establecer una carta de presentación por SSH en cada nodo.
 <br/>

  </td>
 </tr>
</table>
   
<br/>
 
### Crear banner para el inicio de sesión por SSH ###
<table>
 <tr>
  <td>
  
  1. Primero, debemos de movernos a la carpeta que contendrá nuestro banner, para ello ejecutaremos <b> “cd [ruta]” </b>.
  2. Ahora ejecutaremos el siguiente comando para crear un archivo <b> “sudo touch banner” </b>.
  3. Para finalizar, abriremos el archivo banner e insertaremos cualquier contenido que queramos que se vea <b> “sudo nano banner” </b>.
  
  </td>
 </tr>
</table>
  
<br/>

### Requisitos para iniciar sesión por clave. ###
<table>
 <tr>
  <td>
    
1.‎Para iniciar sesión por clave pública y privada, debemos indicar varios atributos en el comando de conexión SSH, por lo tanto, el comando quedaría tal que así: <br/>
    
   <div align="center">
    <b> “sudo ssh -i [Clave_privada] [Usuario_server]@[IP_Server] -p [Puerto]” </b>
   </div>
   <br/>
   
  </td>
 </tr>
</table>

<br/>

### Administración del servicio SSH (Una vez terminada la configuración). ###
<div align ="center">
 <table>
  <tr>
   <td>

  1. Para reiniciar el servicio SSH debemos ejecutar el siguiente comando: <br/>
   
   <div align="center"><b>
    “sudo systemctl restart ssh.service”
   </b></div>
   <br/>
   
  2. Para saber el estado del servicio SSH debemos ejecutar el siguiente comando: <br/>
   
   <div align="center"><b>
    “sudo systemctl status ssh.service”
   </b></div>
   <br/>
  
   </td>
  </tr>
 </table>
</div>
