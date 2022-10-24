# High availability system with k3s
## En que consiste

  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 1 Rack).png" align="right" width=25% height=75% padding="10px"/>

El proyecto consiste en una estructura de servidores de bajo consumo en clúster que proporcionará alta disponibilidad y escalabilidad al sistema mediante K3s, pudiendo ser complementada por capas de seguridad físicas (Firewalls, Proxys, IPS) o lógicas.

Estos “servidores” tendrán distintas arquitecturas “Banana PI M5 (ARMv8-A)”, “Raspberry PI 3 (ARMv8)”, “Raspberry PI 4 (ARMv8-A)”, “PC formato micro-ITX (x86)” y sistemas operativos, ya que estos deben de estar adaptados a cada equipo.

Para el tratamiento de los datos, dispondríamos de una nube privada, gracias a un NAS. En este se podría almacenar tanto copias de seguridad de los sistemas, como posibles datos logísticos.

Gracias a un SAI semi gestionable, se podrá disponer de una situación de alta disponibilidad, ya que, en caso de fallo en la red eléctrica principal, los servidores se apagarán automáticamente, sin que estos acaben dañados.

Por último, todo esto será administrado mediante un servicio VPN (Zerotier o Hamachi) y SSH (OpenSSH o DropBear). 

## ¿Cuáles son los objetivos?

El motivo principal de la realización de este proyecto es mostrar a las empresas la posibilidad de tener una estructura de servidores propia, sin que esto, conlleve realizar un gran desembolso de dinero para las mismas.

La principal ventaja que obtendrían las empresas es la escalabilidad que tiene el sistema y su alta disponibilidad en relación con los servicios que se pueden brindar. 

## ¿Qué es lo que quiere decir esto?
El motivo principal de la realización de este proyecto es mostrar a las empresas la posibilidad de tener una estructura de servidores propia, sin que esto, conlleve realizar un gran desembolso de dinero para las mismas.

La principal ventaja que obtendrían las empresas es la escalabilidad que tiene el sistema y su alta disponibilidad en relación con los servicios que se pueden brindar. 

<div align="center">
  <img src="diagramas/Un pod.png" width=45% height=14% padding="30px"/>
  <img src="diagramas/Varios pods.png" width=45% height=14% padding="30px"/>
</div>

## Objetivos básicos

* Desarrollar una estructura de Clúster mediante K3s, disponiendo de 4 SBC’s y un nodo maestro basado en X86.
* Obtener un acceso seguro mediante SSH y VPN a estos servidores para una correcta administración.
* Capacitar al sistema el correcto despliegue de PODs desde la terminal permitiendo así administrarlos, replicarlos y eliminarlos. (Alta disponibilidad)
* Posteriormente, capacitar al sistema de una administración gráfica desde la que desplegar PODs y administrarlos.
* Abaratar costes en el desarrollo de una estructura de servidores propietaria
* Facilitar la escalabilidad del sistema y la alta disponibilidad de este y de los servicios, en función de las necesidades de la empresa.
* Proporcionar una monitorización más personalizada, esto iría en relación con lo grande que sería nuestro clúster, ya que en ciertos puntos podríamos poner proxy’s o firewalls.

## Análisis general del sistema.
### Análisis breve de las tecnologías que se utilizarán.

<div align="center">
  <img src="https://github.com/Serferman/high-availability-system-with-k3s/blob/3db77254bb9573efc96390a6a38cf2c089ea6a53/recursos/Diagramas%20Explicativos/ModelRack1.png" align="right" width=40% height=12% padding="30px"/>
</div>

Para realizar un análisis breve del sistema, nos debemos centrar en los componentes básicos que componen el mismo y necesita para funcionar, por lo tanto, estará compuesto de 5 nodos/equipos los cuales son:

* **Banana PI M5** (ARMv8-A) (4Gb, Amlogic S905X3 Cortex-A55 4 Núcleos) 
* **Raspberry PI 3** (ARMv8) (1Gb, Broadcom BCM2837B0 Cortex-A53 4 Núcleos)
* **Raspberry PI 4** (ARMv8-A) (4Gb, Broadcom BCM2711 Cortex-A72 4 Núcleos) 
* **Raspberry PI 4** (ARMv8-A) (8Gb, Broadcom BCM2711 Cortex-A72 4 Núcleos)
* **Servidor ITX 2U** (x86) (16Gb RAM, Ryzen 5 2600 6 Núcleos) 

Seguidamente a estos elementos básicos que componen la espina dorsal del proyecto, tenemos algunos elementos complementarios. Algunos de los cuales son:

* **Servidor NAS WD Mycloud EX2 ULTRA** (2 Bahías, 1 Disco duro Externo de 4 TB, 1 Disco duro 
  Externo de 1 TB)
* **Switch Gestionable D-LINK** (8 Puertos, 1000Gb/s, Smart)
* **Riello UPS 800VA** (4 Enchufes, 1 Conector USB, 480W)

Con esto finalizaríamos el listado de los dispositivos que tienen unas mínimas tecnologías para su gestión/administración, pero no quiere decir que esto sea todo el hardware necesario para el proyecto, ya que quedarían unos cuantos componentes para su estructuración y administración que posteriormente se mencionarán.

En relación con los sistemas operativos que se deben instalar en cada uno de los nodos, se deben de tener en cuenta la arquitectura y la marca de estos, ya que pueden existir S.O específicos para estos. Por lo tanto, los siguientes sistemas operativos que se instalarán serán los siguientes:

* **Ubuntu Server** (Sistema principal para el equipo Server ITX 2u).
* **Debian Buster/Ubuntu** (Para el equipo Banana Pi M5).
* **Raspberry PI OS Lite** (Para los equipos que son Raspberry`s).

Respecto al software que instalaremos para el correcto funcionamiento del clúster, necesitaremos instalar las siguientes herramientas en todos los equipos:

  <img src="https://github.com/Serferman/high-availability-system-with-k3s/blob/cb88074d755c62382ca87abb4fe62ca5aea006e9/recursos/Diagramas%20Explicativos/Esquema-por-capas-realista%20(Propuesta%20inicial)v2.png" align="left" width=35% height=6% hspace=4% vspace=4%/>
 </br>
 
  * **K3S** (Kubernetes Lightweight)(Software para creación de clúster con ARM)
  * **Tar** (Es el comando que tienen todos los sistemas Linux para comprimir archivos, que, en conjunto con otros en un script, se puede hacer un protocolo de                      copias remotas)
  * **OpenSSH** (Es el servidor SSH por el que se accederá a cada nodo en caso de necesitarlo)
  * **Zerotier** (VPN principal “VPS” por la que se tendrá acceso remoto al sistema del clúster)
  * **Hamachi** (VPN secundaria “VPS” por la que se tendrá acceso remoto al sistema del clúster)

En relación con el software especifico que debemos instalar en el máster sería:

  * **PowerShield** (Software para la automatización del apagado de los servidores en caso de corte eléctrico.)

Respecto a los servicios que se podría montar encima de K3s, serian:

  * **Servidor Web** (NginX)
  * **Servidor base de datos** (MariaDB), (MySQL) o (MongoDB)
  * **Cualquier CMS** (Wordpress), (Drupal), (Joomla), (Moodle), etc …

Además de todo esto, dependiendo de la versión del software de clusterización que este instaladase utilizará la base de datos “SQLite” o “ETCD”, estas dos son bases de datos enfocadas a distribuciones ligeras.

## Listado de las necesidades del proyecto
### Necesidades físicas generales:

* Una salida de la red a internet.
* Un Armario rack 10” 12U
* Un dispositivo de red capaz de hacer enrutamiento NAT (Router).
* Un switch de X puertos inteligente (1U) (Dependiendo de lo grande que queramos hacer el 
  clúster).
  * Modelo 3D para el soporte (obviamente se podría comprar un switch específico 
    para rack de 10” y ahorrarse esto).
* Un patch panel de X puertos (0,5U) (en relación con el switch).
* Unos 10 metros de cableado de par tranzado de categoría 6a.
* 6 cables de par trenzado de Cat 6a para conectar el switch con el patch panel.
* Unas cabezas RJ45 FTP cat7.
* 4 miniordenadores o SBC’s (2U) (Podemos usar la cantidad que queramos o podamos).
  * 2 modelos 3D para el soporte.
  * Disipadores para SBC’s .
  * 4 tarjetas microSD de 32 GB
* Un servidor maestro basado el x86, con formato ITX (2U)
  * Placa base ITX.
  * Nano PSU.
  * 2 módulos RAM 8GB.
  * Disipador pequeño.
  * Tarjeta Gráfica Slim genérica 1 Slot.
  * Modelo 3D para el soporte
  * HDD 500GB
  * SSD 120GB
* 2 pasacables (0,5U).
* Un ventilador específico para refrigerar el rack 10”.
* 2 regletas de 4 enchufes cada una con un interruptor para poder apagarla (2U).
* 4 transformadores para los SBC’s
* Un transformador para cada uno de estos; Servidor maestro ITX, el Switch, el NAS WD y el 
  disco duro externo.
* Un SAI administrable de 480W con 4 tomas de corriente.
* Una NAS de red WD de 2 Bahías.
  * 2 discos Duros de 500GB
* Un disco duro externo de 2.5 pulgadas de 4TB
* Un disco duro externo de 3.5 pulgadas de 1TB
* Una Orange PI R1 como Firewall/proxy (Este apartado es opcional)

### Necesidades lógicas generales:
* 3 sistemas operativos “Raspberry PI OS”.
* Un sistema operativo basado en Ubuntu Server “Ubuntu Server 20.04 bpi m5”.
* Un sistema operativo “Ubuntu Server”.
* Servicio VPN (Zerotier o Hamachi) o (Wireguard/OpenVPN).
* Servicio SSH (OpenSSH).
* Herramienta para la administración del SAI (PowerShield).
* Servicio de clusterización (K3s).
* Acceso al sistema operativo (MY Cloud OS 5) del NAS en red.


## Definición y valoración de alternativas. 
### Servidores horizontales (Versiones 1 - 2 - 3)

<div align="center">
  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 1 Rack).png" width=30% height=10% hspace=1% />
  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 2 Rack).png" width=30% height=10% hspace=1% /> 
  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 3 Rack)(Servidor Maestro como proxy).png" width=30% height=10% hspace=1%/>
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
  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores Blade Atornillados (Version 1 Rack).png" width=30% height=10% hspace=5% />
  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores Blade Atornillados (Version 2 Rack).png" width=30% height=10% hspace=5% /> 
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
  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores Blade Deslizadores (Version 1 Rack).png" width=30% height=10% hspace=5% />
  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores Blade Deslizadores (Version 2 Rack).png" width=30% height=10% hspace=5%/> 
</div>
 
Como última propuesta tendríamos esta, la cual se centra en optimizar el máximo espacio posible mediante un modelo que también se asemeja bastante a como los servidores Blade están colocados.

En esta disposición podremos colocar hasta un máximo de 7 SBC`s haciéndola la más optima.Debemos de tener en cuenta que cuantos más SBC’s estén colocados en nuestro rack, másconexiones debemos tener. Por lo que podríamos disponer de las conexiones justas para los nodos que hay en el rack (Propuesta 2) o podríamos disponer de bastantes puertos para hacer escalable el sistema y en un futuro poder ampliarlo (Propuesta 1).

Las principales diferencias respecto a la propuesta inicial son:

* Switch 10/100/1000 Mbps 16Ports. (Propuesta 1)
* Patch Panel Cat6a 12Ports. (Propuesta 1)
* Soporte para servidores blade SBC´s. (Propuesta 1 - 2
<br/>

### Selección, valoración y posibles mejoras de la solución elegida.

  <img src="diagramas/Diagramas detallados electrico y de conectividad del Rack 10''/Esquema conjunto (Electricidad).png" width=30% height=10% hspace=5% />

Como se puede observar, en la parte superior tenemos dos diagramas sobre el circuito eléctrico del proyecto. El primero hace referencia a la fase actual del proyecto, es decir, el nivel que el proyecto está desarrollado ahora mismo y el segundo sería la situación ideal en la que estaría nuestro proyecto en caso de estar completamente desarrollado en el ámbito eléctrico.

En la parte inferior de este apartado, observamos dos diagramas que hacen referencia a la conectividad de red (Ethernet) y de datos (USB). De la misma forma que los esquemas anteriores, el primero hace referencia al diseño que ya está montado y desarrollado, por otro lado, el segundo es la situación ideal que tendría el proyecto de cara a la conectividad de este

  <img src="diagramas/Diagramas detallados electrico y de conectividad del Rack 10''/Esquema conjunto (Conectividad).png" width=30% height=10% hspace=5% />

