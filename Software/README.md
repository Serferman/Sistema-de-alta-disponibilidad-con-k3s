## Propuesta un sistema funcional 

<img src="/diagramas/Diagrama lógico del sistema y sus relaciones/Esquema-por-capas-realista (Propuesta inicial).png" align="left" width=50% height=5% hspace=2% />

* **Zerotier/ Hamachi** → Se instalaría con la intención de tener un acceso remoto al sistema mediante VPN (VPS).

* **Tar/Rsync** → “Tar” es un comando que está instalado por defecto en la amplia mayoría de distribuciones Linux, “Rsync” se debe de instalar en los sistemas Linux, ya que este no está instalado por defecto. Estos dos servicios son posibles soluciones para establecer un sistema de Backups remotos realizando una compresión parcial o completa del sistema, para posteriormente enviarla al sistema que se encargará de almacenarlas.

* **PowerShield** → Es un software de control del SAI que nos permitirá recibir los avisos de apagado que el SAI nos mandará atraves del cable USB al servidor maestro, junto a este funcionará un script desarrollado para realizar un apagado remoto en todos los nodos esclavos (dependientes del maestro) del clúster.

* **OpenSSH** → Es un servicio que nos permitirá acceder al sistema con usuario, contraseña, puerto, claves, etc. En el caso de este proyecto, se usará la autenticación mediante clave pública-privada y usuario. Además, se fortalecerá el servicio para mejorar su seguridad.

* **K3s** → Es un software de clusterización que nos permitirá agrupar nodos individuales en grupos, permitiendo así aprovechar su potencia de cómputo o almacenamiento como un conjunto.

Gracias a este sistema de clusterización K3s se pueden configurar despliegues de servicios en un clúster creado con casi todos sus equipos en una arquitectura ARM. La idea principal es que siempre estén disponibles una cierta cantidad de PODs, para que si alguno de estos "cae", el tráfico de este se redirija a otro o que automaticamente se cree otro consiguiendo asi un entorno de alta disponibilidad. Ademas, para estos PODs se pueden reservar una cantidad de recursos físicos de cada nodo existente dentro de la agrupación del cluster.

Respecto a los demás servicios el funcionamiento es muy parecido a la propuesta del sistema ideal, obviamente quitándole algunas capas de seguridad, como el proxy o firewall.

Estas son las posibles bases que estableceré al proyecto, pero obviamente todo proyecto es mejorable y adaptativo a lo largo del tiempo, por lo que puedo sumarle o quitarle software al proyecto en medida de lo que las necesidades de este dicten.
