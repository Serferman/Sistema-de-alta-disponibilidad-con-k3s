<table>
 <tr align="center">
  <td><h3> Equipo </h3></td>
  <td><h3> IP(Zerotier) </h3></td>
  <td><h3> Proceso de instalación de Zerotier </h3></td>
 </tr>
  
 <tr>
  <td align="center"><b> Master (Server_ITX) </b></td>
  <td> 192.168.192.X </td>
  <td>

  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> <b> Entrar en la VPN </b>
  4. “sudo zerotier-cli leave [Network_ID]” --> <b> Salir de la VPN </b>

  </td>
 </tr>
 
 <tr>
  <td align="center"><b> Nodo1 (RaspberryPI) </b></td>
  <td> 192.168.192.X </td>
  <td>
  
  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> <b> Entrar en la VPN </b>
  4. “sudo zerotier-cli leave [Network_ID]” --> <b> Salir de la VPN </b>
    
  </td>
 </tr>
 
 <tr>
  <td rowspan="2" align="center"><b> Nodo2 (BananaPI) </b></td>
  <td rowspan="2"> 192.168.192.X </td>
  <td>
 
  1. “apt-get install wget”
  2. “wget https://download.zerotier.com/RELEASES/1.6.5/dist/debian/buster/zerotier-one_1.6.5_amd64.deb -O zerotierone_1.6.5_amd64.deb”
  3. “apt install apt-transport-https ca-certificates curl gnupg lsb-release”
  4. “curl -fsSL https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/zerotier.gpg”
  5. “echo "deb https://download.zerotier.com/debian/$(lsb_release -cs)/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/zerotier.list”
  6. “sudo zerotier-cli join [Network_ID]” --> <b> Entrar en la VPN </b>
  7. “sudo zerotier-cli leave [Network_ID]” --> <b> Salir de la VPN  </b>
    
  </td>
 </tr>
 
 <tr>
  <td>

  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> <b> Entrar en la VPN </b>
  4. “sudo zerotier-cli leave [Network_ID]” --> <b> Salir de la VPN </b>  
    
  </td>
 </tr>
 
 <tr>
  <td align="center"><b> Nodo3 (RaspberryPI) </b></td>
  <td> 192.168.192.X </td>
  <td>
  
  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> <b> Entrar en la VPN </b>
  4. “sudo zerotier-cli leave [Network_ID]” --> <b> Salir de la VPN </b>

    
  </td>
 </tr>

 <tr>
  <td align="center"><b> Nodo4 (RaspberryPI) </b></td>
  <td> 192.168.192.X </td>
  <td>
  
  1. “curl -s https://install.zerotier.com/ | sudo bash”
  2. “sudo reboot”
  3. “sudo zerotier-cli join [Network_ID]” --> <b> Entrar en la VPN </b>
  4. “sudo zerotier-cli leave [Network_ID]” --> <b> Salir de la VPN </b>
    
  </td>
 </tr>
  
 <tr>
  <td align="center"><b> WD NAS (WD_Ex2_Ultra)</b></td>
  <td> 192.168.192.X </td>
  <td>
  
  1. Bajar el binario "https://download.zerotier.com/dist/wd/"
  2. Una vez descargado, lo instalaremos en el apartado de "Aplicaciones" de la interfaz gráfica del NAS.
  3. Ahora debemos de activar el servicio SSH en el NAS. Para ello:
  
  - Nos vamos a <b> "Configuración"</b>.
  - Después a <b> "Red"</b>.
  - Buscaremos el apartado <b> "Servicio de red" </b> y activamos SSH. 
  
  4. Ahora desde una terminal o CMD, intentamos conectarnos ejecutando el comando "ssh sshd@(IP_del_Servidor)"
  5. Por último, para conectarnos a la red debemos ejecutar "zerotier-cli join [Network_ID]"  
    
  </td>
 </tr>
</table>
