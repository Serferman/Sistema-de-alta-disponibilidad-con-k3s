
## Administración gráfica del clúster “K3s”. ##
### Instalación del Dashboard gráfico para el Clúster K3s (Docker - Portainer.io). ###
<table>
 <tr>
  <td>

  1. Primero, nos debemos mover al apartado de <b> "Aplicaciones" </b> de la interfaz gráfica del NAS.
  2. Una vez ahí, debemos pulsar sobre <b> “Instalar una aplicación manualmente”</b>.
  3. Al pulsar sobre esta, se nos abrirá el explorador de archivos de nuestro sistema, para que busquemos el archivo que queremos instalar.
  4. Una vez se instale correctamente el software, seleccionaremos la nueva aplicación y pulsaremos sobre <b> “configurar” </b> para poder acceder a la web y configurar un nuevo usuario y contraseña (Recordamos que el nombre del usuario no puede ser típico y la contraseña debe de estar endurecida).
  5. Posteriormente a este proceso, ya habremos accedido a la web de <b> “Portainer.io”</b>.
  
  </td>
 </tr>
</table>

<div align="center">
 <img src="/diagramas/Recursos varios/MyCloudOS5_Portainer.png" width="75%">
</div>

### Añadir el Clúster “K3s” a la administración gráfica de “Portainer.io”. ###
<table>
 <tr>
  <td>

  1. Ahora mismo estamos en el <b> “Home” </b> de Portainer, por lo que tenemos que movernos a <b> “Environments” </b> para poder iniciar el proceso de adición del clúster K3s.
  2. Una vez ahí, pulsaremos sobre <b> “Add environment” </b> para crear un entorno nuevo.
  3. Nos aparecerán muchas pestañas, pero la que nos interesa se llama <b> “Agent”</b>.
  4. Dentro de esta, seleccionaremos el sistema Linux.
  5. Además, debemos asignarle los siguientes parámetros:
  
  - <b> Nombre </b> --> Debes de asignar el nombre que quieras.
  - <b> URL del entorno </b> --> Vamos a exponer el puerto 9001 por una IP o nombre de dominio que queramos, esto sirve para establecer una intercomunicación entre Portainer y K3s mediante una API.
  - <b> IP pública </b> --> Asigna una IP por donde se expondrán los contenedores.
  
  6. Posteriormente, debemos copiar el comando que nos aparece sobre un recuadro rojo e iniciar sesión mediante SSH al servidor Maestro con el comando <b> “ssh -i [Clave] [Usuario]@[IP] -p [Puerto]”</b>.
  7. Una vez ahí, nos iremos a la carpeta <b> “/etc” </b> mediante el comando <b> “cd /etc” </b> y ahí, crearemos una carpeta nueva mediante el comando <b> “sudo mkdir portainer”</b>.
  8. Nos metemos en la carpeta mediante el comando cd <b> “/etc/portainer” </b> y ejecutamos el comando <b> “curl -L https://downloads.portainer.io/ce2-13/portainer-agent-k8s-lb.yaml -o portainer-agentk8s.yaml; kubectl apply -f portainer-agent-k8s.yaml”</b>.

  </td>
 </tr>
</table>

<div align="center">
 <img src="/diagramas/Recursos varios/Portainer_Insercción_Cluster.jpg" width="75%">
</div>

  <br/>

<div align="center">
 <img src="/diagramas/Recursos varios/Portainer_Cluster_Recursos.png" width="75%">
</div>
