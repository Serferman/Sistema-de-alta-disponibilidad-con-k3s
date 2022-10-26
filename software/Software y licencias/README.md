## Software y licencias

En este apartado explicare el software finamente usado para el desarrollo de este proyecto y su posible coste, para ello me apoyaré en un esquema en el que definiré el uso de cada servicio. 
Los servicios y herramientas usadas son:

<img src="/diagramas/Diagrama lógico del sistema y sus relaciones/Esquema-por-capas-realista v2 (Mayor Calidad).png" align="right" width=50% height=5% hspace=2% />

<table>
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

<table>
<tr> <td align="center"> <b> Sistemas </b> </td> <td align="center"> <b> Precio </b> </td> </tr>
<tr> <td> Ubuntu Server </td> <td> Open Source </td> </tr>
<tr> <td> Raspberry PI OS </td> <td> Sin Coste </td> </tr>
<tr> <td> Ubuntu Buster Lite </td> <td> Sin Coste </td> </tr>
<tr> <td> MyCloud OS 5 (Sist.) </td> <td> Comprar NAS </td> </tr>
</table>

- K3s → (Kubernetes Lightweight) Es un software de clusterización que nos permite unir distintos nodos de una red (En un grupo virtual), de esta manera podemos usar su potencia en conjunto hacia un objetivo en concreto (Servicios, herramientas, CMS). Todo esto se consigue instalando en el servidor maestro el servicio y mediante unos tokens, los cuales se generan en los nodos del clúster, podremos unir estos al mismo.

- Zerotier → Es una VPN por software (VPS), mediante esta VPN tendremos acceso a todos los nodos del clúster, ya que estará instalado en todos estos. Para configurar la red de este servicio, disponemos de una página web en la que debemos iniciar sesión con un usuario, establecer el nombre de una red y la IP de esta. (Esta puede ser la que queramos).

- Tar → Este es un comando que viene instalado por defecto en la gran mayoría de distribuciones Linux, sirve para conseguir una compresión de los archivos que le pasemos a través del comando. En conjunto con otros comandos, se puede establecer un protocolo de copias de seguridad remotas.

- PowerShield → Es el software gratuito que provee “Riello” para controlar sus SAIs gestionables en sistemas de explotación. Tiene dos versiones, la gratuita, que viene con ciertas limitaciones (no de funcionalidad si no de cantidad) y la de pago, que está sin capar.

- OpenSSH → Es un servicio OpenSource (Código abierto) que nos permite conectarnos remotamente a nuestros sistemas a través de una línea de comandos/terminal. Este servicio funciona mejor cuando se le hace un hardening. En este proyecto se instalará en cada nodo para mantener el acceso individual y personalizado.

- Portainer → Es un software que instalaremos en el NAS WD a través de un archivo binario. Portainer es la interfaz gráfica que brindan los sistemas Docker para poder ser administrador de una manera más sencilla. En este proyecto se utilizará para administrar el clúster de una manera gráfica.

- Entware → Es un software que se instalará en el NAS WD a través de un archivo binario. Este nos permitirá mantener un conjunto de carpetas importantes de forma persistente, ya que el NAS WD reinicia cualquier configuración que se le realice al apagarse o reiniciarse.

- ComEmu64 → Es una herramienta de administración que nos permite tener varias Terminales/CMD simultaneas en una misma ventana, esto nos facilita mucho la tarea de administración, ya que podemos ir comparando la información paralelamente. 

- MyCloud OS 5 (Web) → Es un servicio web que nos brinda Western digital en casi todos sus productos, nos permite acceder a través de internet a nuestro NAS y lo que en este se esté almacenando. Por lo tanto, podemos verificar el estado de las copias de seguridad remotas.

- Script apagado → Este es un script que ha sido desarrollado por mí mismo para realizar un apagado remoto en el sistema del clúster. Se ha tenido en cuenta la seguridad y se ha juntado con el servicio OpenSSH, de esta manera hemos usado autenticación por clave.

- Script copias de seguridad remotas → De la misma manera que en el caso anterior, este es un script desarrollado por mí mismo para realizar copias de seguridad de cada nodo del clúster y mandarlas a través de la red al NAS, teniendo así una manera de recuperar los sistemas en caso de corrupción. Para esto también se ha tenido en cuenta la seguridad y se ha fusionado con el servicio OpenSSH, de esta forma se ha usado la autenticación por clave.

<br/>

- Ubuntu Server→ Este es el típico de Ubuntu Server, la versión escogida es la 20.04 LTS.

- Raspberry PI OS → Este sistema está adaptado por la marca “Raspberry” para su propio hardware, es una derivación del Debian convencional.

- Ubuntu Buster Lite → De la misma manera que el anterior, este sistema esta modificado por los creadores de “Banana PI” para su propio hardware, es una derivación del Debian convencional.

- MyCloud OS 5 (Sistema) → Este sistema es el que WD le pone a sus NAS, también está basado en Debian, pero a diferencia de los anteriores, este S.O es super capado desde la línea de comandos, por lo que apenas puedes hacerle alguna modificación.

En general, se está usando servicios o herramientas de Open Source o directamente gratis, por lo que el coste por software se reduce al mínimo. También hemos de valorar que, si queremos desarrollar este mismo proyecto en un entorno más profesional, muchos de estos servicios se deberán contratar o directamente, montarlos uno mismo, de esta forma te aseguras de que el servicio este acorde a tus necesidades y tenga una mínima garantía de que no fallará.

De la misma manera, aunque estos servicios que se ven en el esquema sean servicios base para el funcionamiento del sistema, sobre estos se pueden montar cualquier otro, ya que mi proyecto se especializa en la alta disponibilidad de K3s y sus pods, en los cuales podríamos montar un servidor Nginx, Apache2, MongoDB, MariaDB, MySQL, Filezilla, etc 
