---
title : Servicio DHCP
toc : true
logo : true
---



# Instalación

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




