<table>
 <tr>
  <td> Equipo </td>
  <td> IP (Zerotier) </td>
  <td> Proceso de instalación de Zerotier </td>
 </tr>
  
 <tr>
  <td> Master </td>
  <td></td>
  <td>

  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> Entrar en la VPN
  4. “sudo zerotier-cli leave [Network_ID]” --> Salir de la VPN

  </td>
 </tr>
 
 <tr>
  <td> Nodo1 </td>
  <td></td>
  <td>
  
  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> Entrar en la VPN
  4. “sudo zerotier-cli leave [Network_ID]” --> Salir de la VPN
    
  </td>
 </tr>
 
 <tr>
  <td rowspan="2"> Nodo2 (BananaPI) </td>
  <td rowspan="2"></td>
  <td>
 
  1. “apt-get install wget”
  2. “wget https://download.zerotier.com/RELEASES/1.6.5/dist/debian/buster/zerotier-one_1.6.5_amd64.deb -O zerotierone_1.6.5_amd64.deb”
  3. “apt install apt-transport-https ca-certificates curl gnupg lsb-release”
  4. “curl -fsSL https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/zerotier.gpg”
  5. “echo "deb https://download.zerotier.com/debian/$(lsb_release -cs)/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/zerotier.list”
  6. “sudo zerotier-cli join [Network_ID]” --> Entrar en la VPN
  7. “sudo zerotier-cli leave [Network_ID]” --> Salir de la VPN
    
  </td>
 </tr>
 
 <tr>
  <td>

  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> Entrar en la VPN
  4. “sudo zerotier-cli leave [Network_ID]” --> Salir de la VPN  
    
  </td>
 </tr>
 
 <tr>
  <td> Nodo3 </td>
  <td></td>
  <td>
  
  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> Entrar en la VPN
  4. “sudo zerotier-cli leave [Network_ID]” --> Salir de la VPN

    
  </td>
 </tr>

 <tr>
  <td> Nodo4 </td>
  <td></td>
  <td>
  
  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> Entrar en la VPN
  4. “sudo zerotier-cli leave [Network_ID]” --> Salir de la VPN
    
  </td>
 </tr>
  
 <tr>
  <td> WD NAS </td>
  <td></td>
  <td>
  
  1. Bajar el binario "https://download.zerotier.com/dist/wd/"
  2. Una vez descargado, lo instalaremos en el apartado de "Aplicaciones" de la interfaz gráfica del NAS.
  3. Ahora debemos de activar el servicio SSH en el NAS. Para ello:
  
  - Nos vamos a "Configuración".
  - Después a "Red".
  - Buscaremos el apartado "Servicio de red" y activamos SSH 
  
  4. Ahora desde una terminal o CMD, intentamos conectarnos ejecutando el comando "ssh sshd@(IP_del_Servidor)"
  5. Por último, para conectarnos a la red debemos ejecutar "zerotier-cli join [Network_ID]"  
    
  </td>
 </tr>
</table>
