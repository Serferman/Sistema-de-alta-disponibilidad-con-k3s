<table>
 <tr>
  <td><h3> Equipo </h3></td>
  <td><h3> Proceso de instalación de k3s </h3></td>
 </tr>
 
 <tr>
  <td align="center"><b> Master (Server_ITX) </b></td>
  <td>
  
  1. “curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -s -“
  2. “sudo reboot”
  3. “kubectl get nodes”
  4. “sudo cat /var/lib/rancher/k3s/server/node-token”
  
  </td>
 </tr>
 
 
 <tr>
  <td align="center"><b> Nodo1 (RaspberryPI) </b></td>
  <td>
  
  1. “curl -sfL https://get.k3s.io | K3S_TOKEN="K10fda709ef5a6a5d61c8a7b42fdab8d82fc4fa059149424403d6db3ef967605aeb::server:da079804ac9d07934d62b2ae91c2da55" K3S_URL="https://192.168.2.7:6443" K3S_NODE_NAME="servername" sh -"
  
  </td>
 </tr>
 
 
 <tr>
  <td align="center"><b> Nodo2 (BananaPI) </b></td>
  <td>
  
  1. “curl -sfL https://get.k3s.io | K3S_TOKEN="K10fda709ef5a6a5d61c8a7b42fdab8d82fc4fa059149424403d6db3ef967605aeb::server:da079804ac9d07934d62b2ae91c2da55" K3S_URL="https://192.168.2.7:6443" K3S_NODE_NAME="servername" sh -"
  
  </td>
 </tr>
 
 
 <tr>
  <td align="center"><b> Nodo3 (RaspberryPI) </b></td>
  <td>
  
 1. “curl -sfL https://get.k3s.io | K3S_TOKEN="K10fda709ef5a6a5d61c8a7b42fdab8d82fc4fa059149424403d6db3ef967605aeb::server:da079804ac9d07934d62b2ae91c2da55" K3S_URL="https://192.168.2.7:6443" K3S_NODE_NAME="servername" sh -"
  
  </td>
 </tr>
 
 
 <tr>
  <td align="center"><b> Nodo4 (RaspberryPI) </b></td>
  <td>
  
 1. “curl -sfL https://get.k3s.io | K3S_TOKEN="K10fda709ef5a6a5d61c8a7b42fdab8d82fc4fa059149424403d6db3ef967605aeb::server:da079804ac9d07934d62b2ae91c2da55" K3S_URL="https://192.168.2.7:6443" K3S_NODE_NAME="servername" sh -"
 
  </td>
 </tr>
</table>
