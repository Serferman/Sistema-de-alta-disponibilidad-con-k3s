# High availability system with k3s
En que consiste
---------------

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

¿Qué es lo que quiere decir esto?
---------------------------------
El motivo principal de la realización de este proyecto es mostrar a las empresas la posibilidad de tener una estructura de servidores propia, sin que esto, conlleve realizar un gran desembolso de dinero para las mismas.

La principal ventaja que obtendrían las empresas es la escalabilidad que tiene el sistema y su alta disponibilidad en relación con los servicios que se pueden brindar. 

  <img src="https://github.com/Serferman/high-availability-system-with-k3s/blob/57a2a7c39b55bb3055ad8898ebc6aefc97c9db9b/recursos/Diagramas%20Explicativos/Un%20pod.png" align="right" width=272 height=500 padding="10px"/>
  
    <img src="https://github.com/Serferman/high-availability-system-with-k3s/blob/57a2a7c39b55bb3055ad8898ebc6aefc97c9db9b/recursos/Diagramas%20Explicativos/Varios%20pods.png" align="right" width=272 height=500 padding="10px"/>

Objetivos básicos
-----------------
* Desarrollar una estructura de Clúster mediante K3s, disponiendo de 4 SBC’s y un nodo maestro basado en X86.
* Obtener un acceso seguro mediante SSH y VPN a estos servidores para una correcta administración.
* Capacitar al sistema el correcto despliegue de PODs desde la terminal permitiendo así administrarlos, replicarlos y eliminarlos. (Alta disponibilidad)
* Posteriormente, capacitar al sistema de una administración gráfica desde la que desplegar PODs y administrarlos.
* Abaratar costes en el desarrollo de una estructura de servidores propietaria
* Facilitar la escalabilidad del sistema y la alta disponibilidad de este y de los servicios, en función de las necesidades de la empresa.
* Proporcionar una monitorización más personalizada, esto iría en relación con lo grande que sería nuestro clúster, ya que en ciertos puntos podríamos poner proxy’s o firewalls.

