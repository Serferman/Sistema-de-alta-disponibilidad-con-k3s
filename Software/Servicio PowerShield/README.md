Administración del UPS Riello 800VA
Instalación de PowerShield (Servidor maestro).
Configuración de PowerShield (Servidor maestro).
1º - Primero crearemos una carpeta dentro de “/etc”, la cual tendrá el nombre de esta aplicación. Para 
ello, ejecutaremos el siguiente comando “sudo mkdir PowerShield”.
2º - Debemos descargar el archivo “.deb” para poder instalarlo en el sistema. Para ello ejecutaremos 
el siguiente comando “wget https://www.riello-ups.es/uploads/file/64/1064/upsmon-5.3.0-linux2.6-x86_64.deb”.
3º - Ahora debemos descomprimir e instalar el archivo. Para ello ejecutaremos el siguiente comando 
“sudo dpkg -i [Nombre_del_Paquete.deb]”.
4º - Una vez hayamos instalado el paquete, los archivos de la aplicación estarán en la ruta 
“/opt/upsmon”, por lo que nos debemos mover ahí con el comando “cd /opt/upsmon”.
5º - Una vez ahí, debemos ejecutar el Script de la aplicación para ponerla en marcha. Para ello 
ejecutamos el comando “sudo ./upsetup”.
1º - Cuando ya hemos ejecutado el script de configuración del software “upsetup”, debemos de irnos 
a la quinta opción del menú emergente “Configuración de trabajo”.
2º - En el siguiente menú emergente, pulsaremos sobre “Gestor hechos – hechos base”.
3º - Posteriormente, nos iremos a “Falta de red. SAI desde batería”.
4º - En el menú que nos aparece, pulsaremos sobre “Ejec. archivo” y así, entraremos dentro del último 
menú, en el que configuraremos lo siguiente:
- Ejec. archivo → Aquí definiremos si queremos activar esta directiva mediante SI o NO.
- Retardo → Es el tiempo que tardará en ejecutar el archivo por primera vez.
- Interv. (s) → Es el tiempo que tardará en volver a ejecutar el archivo por segunda vez.
- Archivo → Es la ruta donde estará el script que se ejecutará y el nombre de este.
5º - Ahora pulsaremos todo el rato “Salir” y cuando estemos otra vez en terminal, ejecutaremos “sudo 
./upsrestart” para reiniciar el servicio con permisos de administrador.
Fig. 1. Configuración de alerta del SAI por falta de energía.
Sergio Fernández Pardo
pág. 8
Configuración del sistema para la ejecución del Script de apagado automáticamente.
Creación de claves SSH para la automatización y securización del proceso de apagado.
REALIZAR TANTO EN EL SERVIDOR MAESTRO COMO EN LOS SERVIDORES ESCLAVOS
1º - Crearemos un usuario mediante el comando “sudo adduser [usuario]”.
2º - Crearemos un grupo mediante el comando “sudo groupadd [grupo]”.
3º - Añadiremos el usuario al grupo mediante el comando “sudo adduser [usuario] [grupo]”.
4º - Ahora abriremos el archivo “Sudoers”, mediante el comando “sudo visudo” o “sudo nano 
/etc/sudoers”.
5º - Al final del archivo debemos añadir la siguiente línea “%[grupo] ALL=(root) NOPASSWD: 
/sbin/poweroff”.
6º - Ahora guardaremos el archivo y saldremos de este.
7º - Posteriormente, nos moveremos al directorio “/usr/bin” mediante el comando “cd /usr/bin”.
8º - En este directorio debemos crear un archivo mediante el comando “sudo nano Poweroff.sh”.
9º - Dentro de este archivo debemos de insertar las siguientes sentencias:
#!/bin/sh
sudo /sbin/poweroff $*
10º - Ahora guardaremos el archivo y saldremos de este.
11º - Después, tenemos que asignarle los permisos y propiedad adecuados al fichero, mediante los 
comandos:
- "sudo chown root.[Grupo] /usr/bin/Poweroff.sh"
- "sudo chmod 750 /usr/bin/Poweroff.sh"
REALIZAR EN EL SERVIDOR MAESTRO Y TRASPASARLA A LOS ESCLAVOS Y A SI MISMO
1º - Creación de las claves mediante el comando “ssh-keygen -b 4096 -t rsa”.
2º - Ahora debemos cambiarle los permisos y la propiedad a la clave privada mediante los siguientes 
comandos:
- "sudo chown [Usuario_maestro]:[Grupo_Apagado] [Clave_privada]"
- "sudo chmod 750 [Clave_privada]"
3º - Traspaso de claves mediante el comando “ssh-copy-id -i [Clave_publica] 
[Nombre_Usuario_Apagado_worker]@[IP_Nodos_Workers]”
