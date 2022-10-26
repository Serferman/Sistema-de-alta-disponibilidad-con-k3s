
## Requisitos del sistema.
### Técnicos o hardware
* 1x Armario rack 10” 12U.
* 1x Paquete de tornillos.
* 1x Router Mi AIoT AC2350 (4 Puertos) (10/100/1000 Mbps).
* 1x Switch D-Link DGS-1100-08 (8 Puertos) (10/100/1000 Mbps) (1U).
  * 1x Modelo 3D (Soporte Switch 10”).
* 1x Patch Panel deleyCON (8 Puertos) (Cat6) (0.5U).
* 1x Cable de par trenzado (Cat6a) (SFTP) (10M).
* 10x Conectores RJ45 (Cat7) (FTP).
* 10X Protectores para conectores RJ45 (Rojas)
* 6x Cables de par trenzado (Cat6) (UTP).
* 4x SBCs (2U)
  * 2x Modelos 3D (Soporte SBCs 10”).
  * 4x Disipadores (Para SBCs).
  * 4x MicroSD Sandisk (32Gb).
  * 4x Transformadores de (5V 3A) o (5V 2.5A).
  * 4x Cables de energía (Tipo-C) o (Micro-USB).
  * 4x Cables de USB 2.0 a USB 2.0 en L.
* 1x Servidor ITX x86 (2U)
  * 1x CPU “AMD Ryzen 2600” (6 Cores) (3.4GHz) (65W) (95º)
  * 1x Placa base “B450 I AORUS PRO WIFI” (AMD).
  * 1x “RGeek” pico PSU (150W).
  * 2x “G.Skill Ripjaws V” RAM (8GB) (3000Mhz) (DDR4).
  * 1x Disipador “AMD Wraith Stealth Socket AM4”.
  * 1x Tarjeta Gráfica Slim genérica 1 Slot.
  * 1x WD HDD 500GB (2.5 Pulgadas).
  * 1x Kingston SSD 120GB (2.5 Pulgadas).
  * 1x Interruptor de metal Rojo.
  * 1x Ventilador Slim (120x120x12MM).
  * 1x RGeek Transformador (120W).
  * 1x Adaptador en L (AC).
    * 1x Modelo 3D (Caja para Rack 10”).
* 2x Pasacables DIGITUS (0.5U).
* 1x Ventilador Rack 10” (12x12Cm).
* 2x Regletas de 4 enchufes (2U).
* 1x NAS Western Digital de Red (2 Bahías).
  * 1x Adaptador en L de RJ45 macho a hembra.
  * 1x Adaptador en L (AC).
  * 1x Transformador (Del Fabricante).
  * 2x WD HDD 500GB (3.5 Pulgadas).
* 1x HDD Externo Western Digital (4TB) (2.5 Pulgadas).
  * 1x Cable USB a Micro USB Tipo-C.
* 1x HDD Externo Yottamaster (1TB) (3.5 Pulgadas).
  * 1x Cable USB 3.0 Tipo-B.
  * 1x Transformador (Del Fabricante).
* 1x SAI Riello 800VA (480W).
  * 4x Adaptador en L (IEC).
  * 4x Adaptador de IEC a enchufe tipo C.
  * 1x Cable USB 2.0 Tipo-B.
### Sistema o Software
* 3x Raspberry PI OS.
* 1x “Ubuntu Server 20.04 bpi m5”.
* 1x Ubuntu Server 20.04 LTS.
* 6x Zerotier/Hamachi.
* 5x OpenSSH.
* 1x PowerShield.
* 5x K3s.
* 1x Portainer.
* 1x Entware.
* 1x Script Apagado.
* 5x Scripts Copias remotas (Tar).
* 1x Acceso a MY Cloud OS 5.

## Definición y valoración de alternativas. 
### Servidores horizontales (Versiones 1 - 2 - 3)

<div align="center">
  <img src="/diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 1 Rack).png" width=30% height=10% hspace=1% />
  <img src="/diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 2 Rack).png" width=30% height=10% hspace=1% /> 
  <img src="/diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 3 Rack)(Servidor Maestro como proxy).png" width=30% height=10% hspace=1%/>
</div>

Esta propuesta se centra en las bases del concepto y es la que primordialmente he seguido. Podemos ver que en las diferentes versiones siempre aparecen SBC’s colocados horizontalmente, en tandas de 2, consiguiendo de esta manera mucha capacidad de gestión física de los mismos, pero desaprovechamos mucho espacio de la unidad del rack. 

Además, observamos como podemos jugar con la cantidad de puertos del panel de parcheo (12) y del switch (16), consiguiendo de esta manera, más conectividad en nuestro rack, pero como ya he comentado varias veces, todo depende de la necesidad de ese momento.

En la tercera propuesta existe una peculiaridad, tendríamos el clúster que proponemos como base del proyecto, pero el maestro no sería el pc basado en X86, ya que este se dedicaría exclusivamente a proteger la red mediante un sistema Proxy o Firewall. De esta forma, dedicamos todos los recursos del nodo más potente del rack a proteger a todos los demás.

Las principales diferencias respecto a la propuesta inicial son:

* Switch 10/100/1000 Mbps 16Ports. (Propuesta 2)
* Patch Panel Cat6a 12Ports. (Propuesta 2)
* Server ITX X86 como proxy (Añadiendo tarjeta de red). (Propuesta 3)
* Añadir una unidad al rack de servidores SBC´s. (Propuesta 3)


### Servidores Blade Atornillados (Versiones 1 - 2)
 
<div align="center">
  <img src="/diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores Blade Atornillados (Version 1 Rack).png" width=30% height=10% hspace=5% />
  <img src="/diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores Blade Atornillados (Version 2 Rack).png" width=30% height=10% hspace=5% /> 
</div>
 
Como bien indica el nombre de esta propuesta, el formato en el que los servidores SBC`s son colocados dentro del rack, se asemeja a como los servidores Blade están colocados en un rack de 19’’.

Podemos observar a simple vista que en un espacio reducido hemos aumentado la cantidad de SBC’s que pueden funcionar simultáneamente, pero de la misma manera hemos aumentado el espacio que estos ocupan dentro del rack, han pasado de ocupar 4 (en tandas de 2 horizontalmente) en 2U a 5 SBC’s verticalmente en 2U.

Una curiosa característica de esta propuesta es que, disponemos en los dos casos de un proxy o firewall con el que protegeremos la red de nuestro clúster. A diferencia de la propuesta anterior, que nos brindaba esta opción montada en el servidor ITX X86, en esta, se nos brinda la posibilidad montada en un SBC’s, el cual no tiene las mismas capacidades físicas que el caso anterior, pero es una capa más de seguridad.

Las principales diferencias respecto a la propuesta inicial son:

* Switch 10/100/1000 Mbps 16Ports. (Propuesta 1)
* Patch Panel Cat6a 12Ports. (Propuesta 1)
* SBC “Orange PI R1 LTS” como proxy. (Propuesta 1 - 2)
* Añadir otra franja de servidores SBC´s al rack. (Propuesta 1)


### Servidores Blade Deslizadores (Versiones 1 – 2)
 
<div align="center">
  <img src="/diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores Blade Deslizadores (Version 1 Rack).png" width=30% height=10% hspace=5% />
  <img src="/diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores Blade Deslizadores (Version 2 Rack).png" width=30% height=10% hspace=5%/> 
</div>
 
Como última propuesta tendríamos esta, la cual se centra en optimizar el máximo espacio posible mediante un modelo que también se asemeja bastante a como los servidores Blade están colocados.

En esta disposición podremos colocar hasta un máximo de 7 SBC`s haciéndola la más optima.Debemos de tener en cuenta que cuantos más SBC’s estén colocados en nuestro rack, másconexiones debemos tener. Por lo que podríamos disponer de las conexiones justas para los nodos que hay en el rack (Propuesta 2) o podríamos disponer de bastantes puertos para hacer escalable el sistema y en un futuro poder ampliarlo (Propuesta 1).

Las principales diferencias respecto a la propuesta inicial son:

* Switch 10/100/1000 Mbps 16Ports. (Propuesta 1)
* Patch Panel Cat6a 12Ports. (Propuesta 1)
* Soporte para servidores blade SBC´s. (Propuesta 1 - 2
<br/>

### Selección, valoración y posibles mejoras de la solución elegida.
<div align="center">
  <img src="/diagramas/Diagramas detallados electrico y de conectividad del Rack 10''/Esquema conjunto (Electricidad).png" width=80% height=40% />
</div>

Como se puede observar, en la parte superior tenemos dos diagramas sobre el circuito eléctrico del proyecto. El primero hace referencia a la fase actual del proyecto, es decir, el nivel que el proyecto está desarrollado ahora mismo y el segundo sería la situación ideal en la que estaría nuestro proyecto en caso de estar completamente desarrollado en el ámbito eléctrico.

En la parte inferior de este apartado, observamos dos diagramas que hacen referencia a la conectividad de red (Ethernet) y de datos (USB). De la misma forma que los esquemas anteriores, el primero hace referencia al diseño que ya está montado y desarrollado, por otro lado, el segundo es la situación ideal que tendría el proyecto de cara a la conectividad de este

<div align="center">
  <img src="/diagramas/Diagramas detallados electrico y de conectividad del Rack 10''/Esquema conjunto (Conectividad).png" width=80% height=40% />
</div>

## Expansiones o ampliaciones
### Expansiones o ampliaciones físicas
En este apartado, se buscarán ampliaciones físicas teniendo en cuenta que las características que buscadas son:

* Mayor potencia.
* Menor espacio ocupado.
* Mejor flexibilidad y escalabilidad.
 
<table>
 <tr>
   <td align="center"><img src="/diagramas/Diagramas de las Expansiones/SBC y Cargadores de pared Atornillados.png" width=90% height=20% /></td>
   <td colspan="2" align="center"><img src="/diagramas/Diagramas de las Expansiones/SBC Deslizadores.png" width=90% height=20% /></td>
 </tr>
 <tr>
   <td align="center"><img src="/diagramas/Diagramas de las Expansiones/Switch16 y Patch Panel12.png" width=90% height=20% /></td>
   <td align="center"><img src="/diagramas/Diagramas de las Expansiones/Anker 5 Ports.png" width=40% height=5% /></td>
   <td align="center"><img src="/diagramas/Diagramas de las Expansiones/Proxy(Orange pi R1).png" width=40% height=5% /></td>
 </tr>
</table>
 
### Expansiones o ampliaciones lógicas
Con relación a las ampliaciones lógicas, debemos de tener en cuenta que el núcleo del sistema es el software de clusterización, por lo que todo lo que se añada al sistema, será complementario al mismo o con la finalidad de mejorar o proteger el sistema. Se tendrá en cuenta las siguientes características:

* Mayor seguridad en cada nodo y en la red.
* Capacidad de realizar copias de seguridad parciales (De los datos o servicios).
* Instalar en el sistema, un sistema de balanceo de carga especifico.
* Instalar un servicio de clusterización complementario (Rancher) que sea capaz de administrar el clúster principal por una interfaz gráfica.
* Instalar y configurar en uno de los nodos que tenga dos tarjetas de red, un sistema operativo firewall (IPFire, PFsense) y configurarlo.

