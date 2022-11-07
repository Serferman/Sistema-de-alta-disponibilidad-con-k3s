## Propuesta de un sistema funcional 

<img src="/diagramas/Diagrama lógico del sistema y sus relaciones/Esquema-por-capas-realista (Propuesta inicial).png" align="left" width=48% height=5% hspace=2% />
</br>

* **K3s** → Es un software de clusterización que nos permite unir distintos nodos de una red (En un grupo virtual), de esta manera podemos usar su potencia en conjunto hacia un objetivo en concreto (Servicios, herramientas, CMS). Todo esto se consigue instalando en el servidor maestro el servicio y mediante unos tokens, los cuales se generan en los nodos del clúster, podremos unir estos al mismo.

* **Zerotier/ Hamachi** → Se instalaría con la intención de tener un acceso remoto al sistema mediante VPN (VPS).

* **Tar/Rsync** → “Tar” es un comando que está instalado por defecto en la amplia mayoría de distribuciones Linux, “Rsync” se debe de instalar en los sistemas Linux, ya que este no está instalado por defecto. Estos dos servicios son posibles soluciones para establecer un sistema de Backups remotos realizando una compresión parcial o completa del sistema, para posteriormente enviarla al sistema que se encargará de almacenarlas.

* **PowerShield** → Es un software de control del SAI que nos permitirá recibir los avisos de apagado que el SAI nos mandará atraves del cable USB al servidor maestro, junto a este funcionará un script desarrollado para realizar un apagado remoto en todos los nodos esclavos (dependientes del maestro) del clúster.

* **OpenSSH** → Es un servicio que nos permitirá acceder al sistema con usuario, contraseña, puerto, claves, etc. En el caso de este proyecto, se usará la autenticación mediante clave pública-privada y usuario. Además, se fortalecerá el servicio para mejorar su seguridad.

Gracias a este sistema de clusterización K3s se pueden configurar despliegues de servicios en un clúster creado con casi todos sus equipos en una arquitectura ARM. La idea principal es que siempre estén disponibles una cierta cantidad de PODs, para que si alguno de estos "cae", el tráfico de este se redirija a otro o que automaticamente se cree otro consiguiendo asi un entorno de alta disponibilidad. Ademas, para estos PODs se pueden reservar una cantidad de recursos físicos de cada nodo existente dentro de la agrupación del cluster.

Respecto a los demás servicios, su funcionamiento es muy parecido a la propuesta del sistema ideal, obviamente quitándole algunas capas de seguridad, como el proxy o firewall.

Estas son las posibles bases que estableceré al proyecto, pero obviamente todo proyecto es mejorable y adaptativo a lo largo del tiempo, por lo que puedo sumarle o quitarle software al proyecto en medida de lo que las necesidades de este dicten.

## Licencias y coste del software
En este apartado explicare el software finamente usado para el desarrollo de este proyecto y su posible coste, para ello me apoyaré en un esquema en el que definiré el uso de cada servicio. 
Los servicios y herramientas usadas son:

<div align="center">
<img src="/diagramas/Diagrama lógico del sistema y sus relaciones/Esquema-por-capas-realista v2 (Mayor Calidad).png" align="right" width=52% />

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
</div>
