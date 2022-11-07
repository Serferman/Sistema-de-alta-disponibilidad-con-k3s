# Sistema de alta disponibilidad con k3s
## En que consiste

  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 1 Rack).png" align="right" width=25% height=75% padding="10px"/>

El proyecto inicial consiste en una estructura de servidores de bajo consumo eléctrico en clúster que proporcionará alta disponibilidad y escalabilidad al sistema mediante el sistema de clusterización K3s, pudiendo ser complementada por capas de seguridad físicas (Firewalls, Proxys, IPS) o lógicas.

Estos “servidores” tendrán distintas arquitecturas “Banana PI M5 (**ARMv8-A**)”, “Raspberry PI 3 (**ARMv8**)”, “Raspberry PI 4 (**ARMv8-A**)”, “PC formato micro-ITX (**x86**)” y distintos sistemas operativos, ya que estos deben de estar adaptados a cada equipo.

Para el tratamiento de los datos, dispondríamos de una nube privada (NAS). En este se podría almacenar tanto copias de seguridad de los sistemas, como posibles datos logísticos o de configuracón.

Además, gracias a un SAI semi gestionable, se podrá disponer de una situación de protección electrica y salvaguardado de los sistemas, ya que, en caso de fallo en la red eléctrica principal, los servidores se apagarán automáticamente, sin que estos acaben dañados.

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
