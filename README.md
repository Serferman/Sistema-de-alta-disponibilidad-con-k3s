# Sistema de alta disponibilidad con k3s
## En que consiste

  <img src="diagramas/Diagramas de versiones del sistema del Rack 10''/Servidores horizontales (Version 1 Rack).png" align="right" width=25% height=75% padding="10px"/>

El proyecto inicial consiste en una estructura de servidores de bajo consumo eléctrico en clúster que proporcionará alta disponibilidad y escalabilidad al sistema mediante el sistema de clusterización K3s, pudiendo ser complementada por capas de seguridad físicas (Firewalls, Proxys, IPS) o lógicas.

Estos “servidores” tendrán distintas arquitecturas “Banana PI M5 (**ARMv8-A**)”, “Raspberry PI 3 (**ARMv8**)”, “Raspberry PI 4 (**ARMv8-A**)”, “PC formato micro-ITX (**x86**)” y distintos sistemas operativos, ya que estos deben de estar adaptados a cada equipo.

Para el tratamiento de los datos, dispondríamos de una nube privada (NAS). En este se podría almacenar tanto copias de seguridad de los sistemas, como posibles datos logísticos o de configuracón.

Además, gracias a un SAI semi gestionable, dispondremos de una situación de protección electrica y salvaguardado de los sistemas, ya que, en caso de fallo en la red eléctrica principal, los servidores se apagarán automáticamente, sin que estos acaben dañados.

Por último, todo esto será administrado mediante un servicio VPN externo (Zerotier o Hamachi) y SSH (OpenSSH o DropBear). 

## ¿Cuáles son los objetivos?

El motivo principal de la realización de este proyecto es mostrar a las empresas la posibilidad de tener una estructura de servidores propia, sin que esto conlleve realizar un gran desembolso de dinero para estas. Aun asi, la tendencia actual es tener todos los servicios en la nube, normalmente mediante las plataformas Azure o AWS.

La principal ventaja que obtendrían las empresas es la escalabilidad que tiene el sistema de clusterización y su alta disponibilidad en relación con los servicios que se pueden brindar. 

## ¿Qué es lo que quiere decir "tener alta disponibilidad"?
Esto nos quiere decir que, cuando tengamos una gran fluctuación de peticiones de entrada y salida en nuestro servidor, podemos distribuir la carga entre distintos servidores mediante un balanceador de carga del sistema de clusterización, evitando así la saturación del sistema y la probable caída del servicio que estemos brindando.

<div align="center">
  <img src="diagramas/Un pod.png" width=45% height=14% padding="30px"/>
  <img src="diagramas/Varios pods.png" width=45% height=14% padding="30px"/>
</div>

## Objetivos básicos/fundamentales y adaptativos/opcionales

* Desarrollar una estructura de Clúster mediante K3s, disponiendo de 4 SBC’s y un nodo maestro basado en X86. (Objetivo adaptativo dependiendo del hardware que dispongamos)
* Obtener un acceso relativamente seguro mediante SSH y VPN a estos servidores para su correcta administración.
* Capacitar al sistema para el correcto despliegue de PODs desde la terminal permitiendo así administrarlos, replicarlos y eliminarlos. (Objetivo adaptativo si disponemos de interfaz gráfica)
* Capacitar al diseño de un sistema de administración gráfica para k3s desde el que desplegar, administrar y replicar PODs.
* Abaratar costes para el desarrollo de una estructura de servidores propietaria.
* Facilitar la escalabilidad del sistema y la alta disponibilidad de este y sus servicios en función de las necesidades que tengamos.
* Proporcionar una monitorización más personalizada, esto iría en relación con la magnitud que tenga nuestro clúster/proyecto, ya que en ciertos puntos podríamos poner proxy’s o firewalls. (Objetivo adaptativo dependiendo de la magnitud del proyecto y sus necesidades)

## Análisis general del sistema.
### Análisis breve de las tecnologías que se utilizarán.

<div align="center">
  <img src="https://github.com/Serferman/high-availability-system-with-k3s/blob/3db77254bb9573efc96390a6a38cf2c089ea6a53/recursos/Diagramas%20Explicativos/ModelRack1.png" align="right" width=40% height=12% padding="30px"/>
</div>

Para realizar un análisis breve del sistema que utilizaré, nos centraremos en los componentes que lo componen para su funcionamiento. Por lo tanto, estará compuesto de 5 nodos/equipos los cuales son:

* **Banana PI M5** (ARMv8-A) (4Gb, Amlogic S905X3 Cortex-A55 4 Núcleos).
* **Raspberry PI 3** (ARMv8) (1Gb, Broadcom BCM2837B0 Cortex-A53 4 Núcleos).
* **Raspberry PI 4** (ARMv8-A) (4Gb, Broadcom BCM2711 Cortex-A72 4 Núcleos).
* **Raspberry PI 4** (ARMv8-A) (8Gb, Broadcom BCM2711 Cortex-A72 4 Núcleos).
* **Servidor ITX 2U** (x86) (16Gb RAM, Ryzen 5 2600 6 Núcleos).

Seguidamente a estos componentes básicos que componen la espina dorsal del proyecto, tenemos algunos elementos complementarios, pero aun asi, necesarios. Los cuales son:

* **Servidor NAS WD Mycloud EX2 ULTRA** (2 Bahías, RJ45, 2 USB 3.0)
* **Switch Gestionable D-LINK** (8 Puertos, 1000Gb/s, Smart)
* **Riello UPS 800VA** (4 Enchufes, 1 Conector USB type-B, 480W)

Con esto finalizaríamos el listado de los dispositivos que sirven para la intercomunicación del sistema y sobre los que instalaremos el S.O y el software de clusterización, pero no quiere decir que esto sea todo el hardware necesario para el proyecto, ya que quedarían unos cuantos componentes para su estructuración y administración que posteriormente se mencionaré.

En relación con los sistemas operativos que se deben instalar en cada uno de los equipos, se deben de tener en cuenta la arquitectura y la marca de estos, ya que pueden existir S.O específicos para estos equipos. Por lo tanto, los S.O que se instalarán serán los siguientes:

* **Ubuntu Server** (Sistema principal para el equipo Server ITX 2U).
* **Debian Buster/Ubuntu** (Para el equipo Banana Pi M5).
* **Raspberry PI OS Lite** (Para los 3 equipos que son Raspberry`s).

Respecto al software que instalaremos para el correcto funcionamiento del sistema instalado en elRack, tendremos el siguiente esquema para mostrar las propuestas de software que se podrián instalar en cada equipo:

  <img src="diagramas/Diagrama lógico del sistema y sus relaciones/Esquema-por-capas-del-software.png" align="left" width=35% height=6% hspace=4% vspace=4%/>
 </br>
 
  * **K3S** (Kubernetes Lightweight)(Software de clusterización compatible con las aquitecturas ARM).
  * **Tar** (Comando que tienen todos los S.O Linux para la compresión de archivos, con el que podemos hacer un protocolo de copias remotas).
  * **OpenSSH** (Es el servicio SSH por el que se accederá a cada nodo).
  * **Zerotier** (VPN principal “VPS” por la que se tendrá acceso remoto al sistema del clúster).
  * **Hamachi** (VPN secundaria “VPS” por la que se tendrá acceso remoto al sistema del clúster).
  * **Entware** (Software para hacer persistente parte del S.O del NAS WD Ext2 Ultra).

En relación con el software que debemos instalar en el equipo maestro será:

  * **PowerShield** (Software para el control del SAI semigestionable, nos permite crear alertas y ciertas automatizaciones).

Respecto a los servicios que se podría montar encima del software de clusterización K3s, serian:

  * **Servidor Web** (NginX), (apache2), etc...
  * **Servidor base de datos** (MariaDB), (MySQL) o (MongoDB).
  * **Cualquier CMS** (Wordpress), (Drupal), (Joomla), (Moodle), etc ...

Además, dependiendo de la versión del software de clusterización **k3s** que tengamos instalada, se utilizará la base de datos “SQLite” o “ETCD”, estas son bases de datos enfocadas a distribuciones ligeras.
