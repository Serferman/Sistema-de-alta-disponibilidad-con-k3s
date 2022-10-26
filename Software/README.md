## Propuesta del sistema funcional 

En esta propuesta hemos eliminado por completo cualquier rastro de la estructura de Docker. Por lo que el Servidor Maestro se quedaría con un único S.O “Ubuntu Server” y sobre este instalaremos varios servicios, entre los que están Zerotier/Hamachi, Tar/Rsync,PowerShield, K3s (Para desplegar servicios), openSSH, etc…

  <img src="/diagramas/Diagrama lógico del sistema y sus relaciones/Esquema-por-capas-realista (Propuesta inicial).png" align="left" width=50% height=5% hspace=2% />

* **Zerotier/ Hamachi** → Se instalaría con la intención de tener un acceso remoto al sistema mediante VPN (VPS).

* **Tar/Rsync** → “Tar” es un comando que está instalado por defecto en la gran mayoría de distribuciones Linux, “Rsync” se debe de instalar en los sistemas Linux, ya que este no está instalado por defecto. Estos dos servicios son posibles soluciones para establecer un sistema de Backups remotos.

* **PowerShield** → Es un software de control que nos servirá para recibir las señales de apagado que el SAI nos mandará al servidor maestro, junto a este funcionará un script desarrollado para realizar un apagado remoto en todos los nodos esclavos del clúster.

* **OpenSSH** → Es un software que nos permitirá acceder al sistema con usuario y contraseña. En el caso de este proyecto, se usará la autenticación mediante clave pública-privada y usuario. Además, se fortalecerá el servicio para mejorar su seguridad.

* **K3s** → Es un software de clusterización que nos permitirá agrupar nodos individuales en grupos, permitiendo así aprovechar su potencia de cómputo o almacenamiento como un conjunto.

Gracias al sistema de clusterización K3s se pueden configurar los despliegues de aplicaciones/servicios en el clúster con relación a las necesidades existentes, por ejemplo, que siempre estén disponibles una cierta cantidad de PODs, para que si alguno de estos cae eltráfico se redirija a otro o tengan una cantidad de recursos reservados a cada uno de estos.

Respecto a los demás servicios el funcionamiento es muy parecido a la propuesta del sistema ideal,obviamente quitándole algunas capas de seguridad, como el proxy o firewall.

Estas son las posibles bases que estableceré al proyecto, pero obviamente todo proyecto es mejorable y adaptativo a lo largo del tiempo, por lo que puedo sumarle o quitarle software al proyecto en medida de lo que las necesidades de este dicten.
