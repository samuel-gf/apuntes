---
title : Servidores
toc : true
logo : true
---


# Configurar el equipo

Cambiar el nombre al equipo

```
sudo hostnamectl set-hostname «nuevo_nombre»
```

# Netplan

Configura la red.

- Fichero de configuración : /etc/netplan/01-network-manager-all.yaml

```
network:
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.1.10/24]
      gateway4: 192.168.1.1
      nameservers:
         addresses: [208.67.222.222]
  version: 2
```

Para aplicar los cambios *sudo netplan apply*

# Servidor DHCP

Instala el paquete *isc-dhcp-server*.


Tiene dos !!ficheros de configuración!!:

- Interface : /etc/default/isc-dhcp-server
- Configuración general : /etc/dhcp/dhcpd.conf

- Comprobar errores : dhcpd -cf /path/to/dhcpd.conf
- Controlar las conexiones en tiempo real : sudo watch dhcp-lease-list


# Cliente DHCP

Instala el paquete *isc-dhcp-client*.

- Info sobre el servidor DHCP : sudo dhclient -v «interfaz»
- Soltar una IP : sudo dhclient -r «interfaz»




