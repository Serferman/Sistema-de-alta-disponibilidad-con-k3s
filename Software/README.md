## Propuesta de un sistema funcional 

<img src="/diagramas/Diagrama lógico del sistema y sus relaciones/Esquema-por-capas-realista (Propuesta inicial).png" align="left" width=48% height=5% hspace=2% vspace=2% />
</br>

### Software (Servicios)

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

### Sistemas Operativos (S.Os)

* **Ubuntu Server** → Este es el típico S.O de Ubuntu Server, la versión escogida es la 20.04 LTS.

* **Raspberry PI OS** → Este sistema está adaptado por la marca “Raspberry” para su propio hardware, es una derivación del S.O Debian convencional.

* **Ubuntu Buster Lite** → De la misma manera que el caso anterior, este sistema ha sido modificado a partir de un S.O Debian por los creadores de “Banana PI” para adaptarse su propio hardware.

* **MyCloud OS 5 (Sistema)** → Este es el sistema que la marca WD le pone a sus servidores NAS. También es una derivación de Debian, con la pequeña peculiaridad de que este S.O tiene muy restringido el uso de su línea de comandos, por lo que apenas se le puede hacer alguna modificación.

<br/>

Gracias al software de clusterización K3s que se esta usando, se pueden configurar despliegues de servicios en un clúster creado con casi todos sus equipos en una arquitectura ARM. La idea principal es que siempre estén disponibles una cierta cantidad de PODs, para que si alguno de estos "cae", el tráfico de este se redirija a otro o que automaticamente se cree otro consiguiendo asi un entorno de alta disponibilidad. Ademas, para estos PODs se pueden reservar una cantidad de recursos físicos de cada nodo existente dentro de la agrupación del cluster.

Respecto a los demás servicios, su funcionamiento es muy parecido a la propuesta del sistema ideal, obviamente quitándole algunas capas de seguridad, como el proxy o firewall.

Estas son las posibles bases que estableceré al proyecto, pero obviamente todo proyecto es mejorable y adaptativo a lo largo del tiempo, por lo que puedo sumarle o quitarle software al proyecto en medida de lo que las necesidades de este dicten.

<br/>

## Orden de creación de cada servicio ##
<div align="center">
 <table>
  <tr>
   <td>
  
  1. <a href="https://github.com/Serferman/Sistema-de-alta-disponibilidad-con-k3s/tree/main/Software/Servicio%20SSH"> Servicio SSH </a>
  2. <a href="https://github.com/Serferman/Sistema-de-alta-disponibilidad-con-k3s/tree/main/Software/Protocolo%20de%20apagado%20remoto%20(PowerShield)"> Servicio PowerShield (Apagado remoto) </a>
  3. <a href="https://github.com/Serferman/Sistema-de-alta-disponibilidad-con-k3s/tree/main/Software/Servicio%20Entware%20y%20SSH%20en%20Western%20Digital%20(WD)"> Servicio Entware y SSH en el NAS(Western Digital) </a>
  4. <a href="https://github.com/Serferman/Sistema-de-alta-disponibilidad-con-k3s/tree/main/Software/Protocolo%20de%20copias%20de%20seguridad%20remotas%20(TAR)"> Servicio TAR (Copias de seguridad remotas) </a>
  5. <a href="https://github.com/Serferman/Sistema-de-alta-disponibilidad-con-k3s/tree/main/Software/Servicio%20Zerotier"> Servicio Zerotier (VPN/VPS)</a>
  6. <a href="https://github.com/Serferman/Sistema-de-alta-disponibilidad-con-k3s/tree/main/Software/Servicio%20K3s"> Servicio K3s </a>
  7. <a href="https://github.com/Serferman/Sistema-de-alta-disponibilidad-con-k3s/tree/main/Software/Servicio%20Portainer%20(K3s)"> Servicio Portainer (K3s) </a>
               
   </td>
  </tr>
 </table>
</div>

## Expansiones o ampliaciones lógicas ##
Con relación a las ampliaciones lógicas, debemos de tener en cuenta que el núcleo del sistema es el software de clusterización, por lo que todo lo que se añada al sistema, será complementario al mismo o con la finalidad de mejorar o proteger el sistema. Se tendrá en cuenta las siguientes características:

* Mayor seguridad en cada nodo y en la red.
* Capacidad de realizar copias de seguridad parciales (De los datos o servicios).
* Instalar en el sistema, un sistema de balanceo de carga especifico.
* Instalar un servicio de clusterización complementario (Rancher) que sea capaz de administrar el clúster principal por una interfaz gráfica.
* Instalar y configurar en uno de los nodos que tenga dos tarjetas de red, un sistema operativo firewall (IPFire, PFsense) y configurarlo.

<br/>

## Restricciones o limitaciones lógicas
- Toda conectividad remota existente debe de ser segura, mediante protocolos o técnicas seguras.
- El servicio de clusterización usa una base de datos “ETCD” que se ejecuta en el servidor maestro por defecto, pero no se puede acceder a ella. Si queremos acceder, deberíamos externalizarla en otro nodo distinto.
- Como K3s es un proyecto reciente, en comparación a otros softwares de clustering, tiene fases en común con muchos de estos sistemas, pero con la pequeña diferencia que estas partes/fases no están en sus versiones completas, por lo que muchas funcionalidades no se pueden explotar.
- El sistema que trae el NAS (My cloud OS 5), no tiene un gran abanico de compatibilidad con los servicios de almacenamiento en nube más conocidos como “Mega”, “Drive”, “Dropbox”, etc

<br/>

## Peligros o riesgos lógicos
Si hablamos de los riesgos lógicos, uno de los principales es el robo o perdida de datos. Si existe una brecha en el sistema que ha sido explotada por un atacante y los datos se pierden o se encriptan impidiendo el acceso a ellos, deben existir copias de seguridad tanto en servidores de almacenamiento en red como en dispositivos de almacenamiento externos rutinarios (diarios/ semanales/ mensuales/ trimestrales). 

En el caso de este proyecto, el procedimiento es simple, se harán copias de seguridad incrementales de los sistemas de cada equipo y se exportarán en los dispositivos de almacenamiento externoscada 2 semanas. De esta forma tenemos los datos guardados a través de la red y no dejamos mucho tiempo entre exportación y exportación los mismos en un dispositivo externo.

También tendré en cuenta las bombas lógicas, las cuales tienen una gran dificultad para ser detectadas, por lo que la única forma de evitarlas es tener un buen protocolo de almacenaje de lascopias de seguridad, es decir, establecer un rango de tiempo amplio en el que se almacenará los datos antes de ser borrados.

En el caso de este proyecto, los datos serán almacenados en los dispositivos externos hasta un plazo de 8 meses. Se almacenarán este tiempo teniendo en cuenta que el objetivo de un atacante no es tener la bomba lógica durante mucho tiempo, si no el suficiente para que el administrador no sepaen qué momento el sistema ha sido infectado con el malware

<br/>

## Licencias y coste del software
En este apartado explicare el coste del software que estoy usando y sus licencias de uso. Los servicios y herramientas usadas son:


<div align="center">
<table>
<tr> <td align="center"> <h3> Software </h3> </td> <td align="center"> <h3> Precio </h3> </td> <td align="center"> <h3> Breve descripción </h3> </td> </tr>
<tr> <td  width="19%"> - K3s </td> <td  width="13%"> Sin Coste </td> <td> Esta bajo una licencia [Apache License 2.0](https://github.com/k3s-io/k3s/blob/master/LICENSE) </td> </tr>
<tr> <td> - Zerotier </td> <td> Sin Coste </td> <td> Esta bajo una doble licencia [Zerotier BSL y Apache License 2.0]( https://www.zerotier.com/pricing/) </td> </tr>
<tr> <td> - OpenSSH </td> <td> Open Source </td> <td> Esta bajo una licencia [BSD](https://es.wikipedia.org/wiki/OpenSSH)</td> </tr>
<tr> <td> - PowerShield </td> <td> Sin coste </td> <td> Tiene dos versiones, la gratuita, que viene con ciertas limitaciones (no de funcionalidad si no de cantidad) y la de pago, que está sin capar. </td> </tr>
<tr> <td> - Tar </td> <td> Open Source </td> <td></td> </tr>
<tr> <td> - Portainer </td> <td> Sin Coste </td> <td> Esta bajo una doble licencia [Zlib y MIT](https://es.wikipedia.org/wiki/Portainers_(Docker)) </td> </tr>
<tr> <td> - Entware </td> <td> Sin Coste </td> <td>Esta bajo una serie de licencias (https://github.com/Entware/Entware/tree/master/LICENSES)</td> </tr>
<tr> <td> - ComEmu64 </td> <td> Sin Coste </td> <td>Esta bajo su propia licencia (https://conemu.github.io/en/AboutDialog.html#About-License.png) </td> </tr>
<tr> <td> - MyCloud OS 5 (Web) </td> <td> Comprar NAS </td> <td> </td> </tr>
<tr> <td> - Script apagado </td> <td> En propiedad </td> <td> Esta bajo la licencia de este proyecto. </td> </tr>
<tr> <td> - Script Copias </td> <td> En propiedad </td> <td>Esta bajo la licencia de este proyecto. </td> </tr>
</table>

<br/>
  
<table>
<tr> <td align="center"> <h3> Sistemas </h3> </td> <td align="center"> <h3> Precio </h3> </td> <td align="center"> <h3> Breve descripción </h3> </td> </tr>
<tr> <td width="19%"> - Ubuntu Server </td> <td width="13%"> Open Source </td> <td>Esta bajo unas cuantas licencias entre las que esta [GPL](https://es.wikipedia.org/wiki/Ubuntu) </td> </tr>
<tr> <td> - Raspberry PI OS </td> <td> Sin Coste </td> <td>Esta bajo unas cuantas licencias entre las que esta [GPL](https://es.wikipedia.org/wiki/Raspberry_Pi_OS) </td> </tr>
<tr> <td> - Ubuntu Server (Kernel 4.9.241) </td> <td> Sin Coste </td> <td> Informacion sobre el sistema (https://wiki.banana-pi.org/Banana_Pi_BPI-M5#Linux) </td> </tr>
<tr> <td> - MyCloud OS 5 (Sist.) </td> <td> Comprar NAS </td> <td> Información sobre el comando Tar (https://es.frwiki.wiki/wiki/Tar_(informatique)) </td> </tr>
</table>
</div>
  
<br/>

<div align="left">
En general, se está usando servicios o herramientas de Open Source o directamente gratis, por lo que el coste por software se reduce al mínimo. También hemos de valorar que, si queremos desarrollar este mismo proyecto en un entorno más profesional, muchos de estos servicios se deberán contratar o directamente, montarlos uno mismo, de esta forma te aseguras de que el servicio este acorde a tus necesidades y tenga una mínima garantía de que no fallará.
</div>
