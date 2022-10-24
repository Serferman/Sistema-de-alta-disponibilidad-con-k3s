# High availability system with k3s
## En que consiste

  <img src="https://github.com/Serferman/high-availability-system-with-k3s/blob/f073996cc14c1d34aa923d18cdeb911db5039c56/recursos/Diagramas%20Explicativos/Diagramas%20de%20las%20versiones%20proyecto%20Rack%2010''/Servidores%20horizontales%20(Version%201%20Rack).png" align="right" width=272 height=500 padding="10px"/>

El proyecto consiste en una estructura de servidores de bajo consumo en clúster que proporcionará alta disponibilidad y escalabilidad al sistema mediante K3s, pudiendo ser complementada por capas de seguridad físicas (Firewalls, Proxys, IPS) o lógicas.

Estos “servidores” tendrán distintas arquitecturas “Banana PI M5 (ARMv8-A)”, “Raspberry PI 3 (ARMv8)”, “Raspberry PI 4 (ARMv8-A)”, “PC formato micro-ITX (x86)” y sistemas operativos, ya que estos deben de estar adaptados a cada equipo.

Para el tratamiento de los datos, dispondríamos de una nube privada, gracias a un NAS. En este se podría almacenar tanto copias de seguridad de los sistemas, como posibles datos logísticos.

Gracias a un SAI semi gestionable, se podrá disponer de una situación de alta disponibilidad, ya que, en caso de fallo en la red eléctrica principal, los servidores se apagarán automáticamente, sin que estos acaben dañados.

Por último, todo esto será administrado mediante un servicio VPN (Zerotier o Hamachi) y SSH (OpenSSH o DropBear). 

¿Cuáles son los objetivos?
--------------------------
El motivo principal de la realización de este proyecto es mostrar a las empresas la posibilidad de tener una estructura de servidores propia, sin que esto, conlleve realizar un gran desembolso de dinero para las mismas.

La principal ventaja que obtendrían las empresas es la escalabilidad que tiene el sistema y su alta disponibilidad en relación con los servicios que se pueden brindar. 

## ¿Qué es lo que quiere decir esto?
El motivo principal de la realización de este proyecto es mostrar a las empresas la posibilidad de tener una estructura de servidores propia, sin que esto, conlleve realizar un gran desembolso de dinero para las mismas.

La principal ventaja que obtendrían las empresas es la escalabilidad que tiene el sistema y su alta disponibilidad en relación con los servicios que se pueden brindar. 

<div align="center">
  <img src="https://github.com/Serferman/high-availability-system-with-k3s/blob/57a2a7c39b55bb3055ad8898ebc6aefc97c9db9b/recursos/Diagramas%20Explicativos/Un%20pod.png" width=40% height=10% padding="30px"/>
  
  <img src="https://github.com/Serferman/high-availability-system-with-k3s/blob/57a2a7c39b55bb3055ad8898ebc6aefc97c9db9b/recursos/Diagramas%20Explicativos/Varios%20pods.png" width=40% height=10% padding="30px"/>
</div>

## Objetivos básicos

* Desarrollar una estructura de Clúster mediante K3s, disponiendo de 4 SBC’s y un nodo maestro basado en X86.
* Obtener un acceso seguro mediante SSH y VPN a estos servidores para una correcta administración.
* Capacitar al sistema el correcto despliegue de PODs desde la terminal permitiendo así administrarlos, replicarlos y eliminarlos. (Alta disponibilidad)
* Posteriormente, capacitar al sistema de una administración gráfica desde la que desplegar PODs y administrarlos.
* Abaratar costes en el desarrollo de una estructura de servidores propietaria
* Facilitar la escalabilidad del sistema y la alta disponibilidad de este y de los servicios, en función de las necesidades de la empresa.
* Proporcionar una monitorización más personalizada, esto iría en relación con lo grande que sería nuestro clúster, ya que en ciertos puntos podríamos poner proxy’s o firewalls.

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
o Placa base ITX.
o Nano PSU.
o 2 módulos RAM 8GB.
o Disipador pequeño.
o Tarjeta Gráfica Slim genérica 1 Slot.
o Modelo 3D para el soporte
o HDD 500GB
o SSD 120GB
* 2 pasacables (0,5U).
* Un ventilador específico para refrigerar el rack 10”.
* 2 regletas de 4 enchufes cada una con un interruptor para poder apagarla (2U).
* 4 transformadores para los SBC’s
* Un transformador para cada uno de estos; Servidor maestro ITX, el Switch, el NAS WD y el 
disco duro externo.
* Un SAI administrable de 480W con 4 tomas de corriente.
* Una NAS de red WD de 2 Bahías.
o 2 discos Duros de 500GB
* Un disco duro externo de 2.5 pulgadas de 4TB
* Un disco duro externo de 3.5 pulgadas de 1TB
* Una Orange PI R1 como Firewall/proxy (Este apartado es opcional)

### Necesidades lógicas generales:
- 3 sistemas operativos “Raspberry PI OS”.
- Un sistema operativo basado en Ubuntu Server “Ubuntu Server 20.04 bpi m5”.
- Un sistema operativo “Ubuntu Server”.
- Servicio VPN (Zerotier o Hamachi) o (Wireguard/OpenVPN).
- Servicio SSH (OpenSSH).
- Herramienta para la administración del SAI (PowerShield).
- Servicio de clusterización (K3s).
- Acceso al sistema operativo (MY Cloud OS 5) del NAS en red.
