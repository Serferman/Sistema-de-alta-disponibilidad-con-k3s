# High availability system with k3s
En que consiste
---------------
El proyecto consiste en una estructura de servidores de bajo consumo en clúster que proporcionará alta disponibilidad y escalabilidad al sistema mediante K3s, pudiendo ser complementada por capas de seguridad físicas (Firewalls, Proxys, IPS) o lógicas.

Estos “servidores” tendrán distintasarquitecturas “Banana PI M5 (ARMv8-A)”, “Raspberry PI 3 (ARMv8)”, “Raspberry PI 4 (ARMv8-A)”, “PC formato micro-ITX (x86)” y sistemas operativos, ya que estos deben de estar adaptados a cada equipo.

Sobre este sistema de clusterización (K3s) sepodrían montar una serie de servicios, como podrán ser servicios webs como “NginX” o servicios de almacenamiento mediante FTPpara clientes.

Para el tratamiento de los datos de la empresa,dispondríamos de una nube privada, gracias a un NAS. En este se podría almacenar tanto copias de seguridad de los sistemas, como posibles datos logísticos de la propia empresa.

Gracias a un SAI semi gestionable, se podrá disponer de una situación de alta disponibilidad, ya que, en caso de fallo en la red eléctrica principal, los servidores se apagarán automáticamente, sin que estos acaben dañados, a los administradores se les enviara un correo avisando del fallo eléctrico y, en respuesta al fallo, los administradores podrán redireccionar todo el tráfico 
momentáneamente a un servidor de respaldo.

Por último, todo esto será administrado mediante un servicio VPN (Zerotier o Hamachi) y SSH (OpenSSH o DropBear). 
