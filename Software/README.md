## Propuesta de un sistema funcional 

<img src="/diagramas/Diagrama lógico del sistema y sus relaciones/Esquema-por-capas-realista (Propuesta inicial).png" align="left" width=48% height=5% hspace=2% vspace=2% />
</br>

* **K3s** → Es un software de clusterización que nos permite unir distintos nodos de una red en un "grupo virtual", de esta manera podemos enfocar su potencia de computo individual hacia un objetivo en concreto (Servicios, herramientas, CMS). Todo esto se consigue instalando en el servidor maestro el servicio k3s y mediante unos tokens, que se generan en los nodos esclavos, podremos unirlos al "grupo virtual".

* **Portainer** → Es un software que instalaremos en el NAS WD a través de un archivo binario. Portainer es la interfaz gráfica que brinda el servicio de Docker para poder administrar sus contenedores de una manera gráfica y más sencilla. Esta herramienta se utilizará como complemento para administrar el clúster de una manera gráfica.

* **Zerotier/ Hamachi** → Es una VPN por software (VPS), mediante esta VPN tendremos acceso a todos los nodos del clúster, ya que estará instalado en todos estos. Para configurar la red de este servicio, disponemos de una página web en la que debemos iniciar sesión con un usuario, establecer el nombre de una red y la IP de esta. (Esta puede ser la que queramos).

* **Tar/Rsync** → “Tar” es un comando que está instalado por defecto en la amplia mayoría de distribuciones Linux, “Rsync” se debe de instalar en los sistemas Linux, ya que este no está instalado por defecto. Estos dos servicios son posibles soluciones para establecer un sistema de Backups remotos realizando una compresión parcial o completa del sistema, para posteriormente enviarla al sistema que se encargará de almacenarlas.

* **PowerShield** → Es un software de control del SAI que provee la marca "Riello" y nos permitirá recibir los avisos de apagado que el SAI nos mandará atraves del cable USB al servidor maestro, junto a este funcionará un script desarrollado para realizar un apagado remoto en todos los nodos esclavos (dependientes del maestro) del clúster.

* **OpenSSH** → Es un servicio OpenSource (Codigo abierto) que nos permitirá acceder al sistema con usuario, contraseña, puerto, claves, etc. En el caso de este proyecto, se usará la autenticación mediante clave pública-privada y usuario. Además, se fortalecerá el servicio para mejorar su seguridad.

* **Entware** → Es un software que se instalará en el NAS WD a través de un archivo binario. Este nos permitirá mantener un conjunto de carpetas importantes de forma persistente, ya que el "NAS WD Ext2 Ultra" reinicia cualquier configuración que se le realice al apagarse o reiniciarse.

* **MyCloud OS 5 (Web)** → Es un servicio web que nos brinda Western digital en casi todos sus productos, nos permite acceder a través de internet al almacenamiento de nuestro NAS. Por lo tanto, podemos verificar el estado de las copias de seguridad remotas.

* **Script apagado** → Este script que ha sido desarrollado para realizar un apagado remoto en el sistema del clúster. Se ha tenido en cuenta la seguridad y se ha juntado con el servicio OpenSSH, de esta manera hemos usado autenticación por clave. Su manera de funcionar es simple, el SAI semigestionable detecta un corte de corriente, este le manda un aviso al servidor maestro y este ultimo, empieza con la ejecución del script en consecuencia al aviso recibido, por lo que secuencialmente irá apagando los servidores esclavos uno a uno.

* **Script copias de seguridad remotas** → Este es un script desarrollado para realizar copias de seguridad de cada nodo del clúster y mandarlas a través de la red al NAS, teniendo así una manera de recuperar los sistemas en caso de corrupción. Para esto también se ha usado el servicio OpenSSH teniendo en cuenta su seguridad y realizando asi, la autenticación mediante clave pública/privada.

<br/>

* **Ubuntu Server** → Este es el típico S.O de Ubuntu Server, la versión escogida es la 20.04 LTS.

* **Raspberry PI OS** → Este sistema está adaptado por la marca “Raspberry” para su propio hardware, es una derivación del S.O Debian convencional.

* **Ubuntu Buster Lite** → De la misma manera que el caso anterior, este sistema ha sido modificado a partir de un S.O Debian por los creadores de “Banana PI” para adaptarse su propio hardware.

* **MyCloud OS 5 (Sistema)** → Este es el sistema que la marca WD le pone a sus servidores NAS. También es una derivación de Debian, con la pequeña peculiaridad de que este S.O tiene muy restringido el uso de su línea de comandos, por lo que apenas se le puede hacer alguna modificación.


Gracias al software de clusterización K3s que se esta usando, se pueden configurar despliegues de servicios en un clúster creado con casi todos sus equipos en una arquitectura ARM. La idea principal es que siempre estén disponibles una cierta cantidad de PODs, para que si alguno de estos "cae", el tráfico de este se redirija a otro o que automaticamente se cree otro consiguiendo asi un entorno de alta disponibilidad. Ademas, para estos PODs se pueden reservar una cantidad de recursos físicos de cada nodo existente dentro de la agrupación del cluster.

Respecto a los demás servicios, su funcionamiento es muy parecido a la propuesta del sistema ideal, obviamente quitándole algunas capas de seguridad, como el proxy o firewall.

Estas son las posibles bases que estableceré al proyecto, pero obviamente todo proyecto es mejorable y adaptativo a lo largo del tiempo, por lo que puedo sumarle o quitarle software al proyecto en medida de lo que las necesidades de este dicten.

## Licencias y coste del software
En este apartado explicare el coste del software que estoy usando y sus licencias de uso. Los servicios y herramientas usadas son:

<table align="left">
<tr> <td align="center"> <b> Software </b> </td> <td align="center"> <b> Precio </b> </td> </tr>
<tr> <td> K3s </td> <td> Sin Coste </td> </tr>
<tr> <td> Zerotier </td> <td> Sin Coste </td> </tr>
<tr> <td> OpenSSH </td> <td> Open Source </td> </tr>
<tr> <td> PowerShield </td> <td> Sin coste </td> </tr>
<tr> <td> Tar </td> <td> Open Source </td> </tr>
<tr> <td> Portainer </td> <td> Sin Coste </td> </tr>
<tr> <td> Entware </td> <td> Sin Coste </td> </tr>
<tr> <td> ComEmu64 </td> <td> Sin Coste </td> </tr>
<tr> <td> MyCloud OS 5 (Web) </td> <td> Comprar NAS </td> </tr>
<tr> <td> Script apagado </td> <td> En propiedad </td> </tr>
<tr> <td> Script Copias </td> <td> En propiedad </td> </tr>
</table>

<table align="right">
<tr> <td align="center"> <b> Sistemas </b> </td> <td align="center"> <b> Precio </b> </td> </tr>
<tr> <td> Ubuntu Server </td> <td> Open Source </td> </tr>
<tr> <td> Raspberry PI OS </td> <td> Sin Coste </td> </tr>
<tr> <td> Ubuntu Buster Lite </td> <td> Sin Coste </td> </tr>
<tr> <td> MyCloud OS 5 (Sist.) </td> <td> Comprar NAS </td> </tr>
</table>
 
Tiene dos versiones, la gratuita, que viene con ciertas limitaciones (no de funcionalidad si no de cantidad) y la de pago, que está sin capar.
  
En general, se está usando servicios o herramientas de Open Source o directamente gratis, por lo que el coste por software se reduce al mínimo. También hemos de valorar que, si queremos desarrollar este mismo proyecto en un entorno más profesional, muchos de estos servicios se deberán contratar o directamente, montarlos uno mismo, de esta forma te aseguras de que el servicio este acorde a tus necesidades y tenga una mínima garantía de que no fallará.

De la misma manera, aunque estos servicios que se ven en el esquema sean servicios base para el funcionamiento del sistema, sobre estos se pueden montar cualquier otro, ya que mi proyecto se especializa en la alta disponibilidad de K3s y sus pods, en los cuales podríamos montar un servidor Nginx, Apache2, MongoDB, MariaDB, MySQL, Filezilla, etc
