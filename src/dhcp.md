---
title : Servicio DHCP
subtitle : Teoría y práctica
toc : true
logo : true
---

# Servicio DHCP

## Introducción

El **DHCP (Dynamic Host Configuration Protocol)** es un protocolo de la capa de aplicación (modelo OSI) que permite a 
los equipos de una red obtener de forma **automática** una configuración de red válida.  

Sin DHCP, los administradores tendrían que asignar manualmente direcciones IP, máscaras de subred, puertas de enlace 
y servidores DNS a cada host. Esto es poco práctico en redes medianas o grandes, y muy propenso a errores de 
configuración.


## Objetivos principales
El protocolo DHCP tiene como objetivos:

- **Asignar direcciones IP** de manera dinámica a los clientes.
- Entregar otros parámetros de configuración de red, como:
  - Máscara de subred.
  - Dirección de la puerta de enlace por defecto (gateway).
  - Dirección de servidores DNS.
  - Dirección de servidores WINS, NTP, etc.
- Evitar conflictos de direcciones IP duplicadas.
- Centralizar la administración de las configuraciones de red.

## Funcionamiento de DHCP

El proceso de obtención de configuración se conoce como **DORA**, por las iniciales de los cuatro pasos principales:

1. **DHCP Discover**  
- El cliente (sin IP) envía un mensaje **broadcast** (a la dirección `255.255.255.255`) preguntando si hay un \
  servidor DHCP disponible.  
- El mensaje incluye la **dirección MAC** del cliente.

2. **DHCP Offer**  
- Los servidores DHCP que recibieron el "Discover" responden con una oferta.  
- La oferta incluye: dirección IP sugerida, máscara de subred, gateway y tiempo de concesión.

3. **DHCP Request**  
- El cliente responde solicitando de forma explícita la dirección IP de una de las ofertas recibidas.  
- Este mensaje también se envía como broadcast, para que todos los servidores DHCP sepan qué oferta ha aceptado.

4. **DHCP Acknowledge (ACK)**  
- El servidor confirma la asignación con un mensaje ACK.  
- A partir de ese momento, el cliente puede usar la dirección IP concedida.

![Ejemplo gráfico de DORA](https://ipwithease.com/wp-content/uploads/2017/07/dora-process.jpg)

## ¿Qué es un <i>lease</i>?

Un lease (concesión) es el período de tiempo durante el cual un servidor DHCP asigna una dirección IP a un cliente. 
Es uno de los conceptos clave para entender cómo funciona DHCP.

### Concepto

- Cuando un cliente solicita una IP al servidor DHCP, este le da una dirección IP junto con otros parámetros \
  (máscara de subred, gateway, DNS, etc.).
- Esa asignación no es indefinida: tiene un tiempo limitado, que se llama lease time o tiempo de concesión.
- Durante ese tiempo, el cliente puede usar la IP asignada de forma exclusiva.

### Proceso de lease

+ Cliente solicita IP : DHCP Discover
+ Servidor ofrece IP : DHCP Offer
+ Cliente acepta IP : DHCP Request
+ Servidor confirma : DHCP ACK
+ Comienza el lease : el cliente puede usar la IP mientras dure la concesión.

### Renovación de lease

- Cuando el 50% del lease ha pasado, el cliente intenta renovar la IP con el servidor mediante un mensaje DHCP Request.
- Si el servidor acepta, el lease se extiende por un nuevo período.
- Si el lease expira y no se renueva, la IP puede ser asignada a otro cliente.

/// ejemplo
Ejemplo de lease en DHCP

### Borrar los leses del servidor

+ Detener el servidor `sudo systemctl stop isc-dhcp-server`
+ Limpiar los leases `sudo rm /var/lib/dhcpd/dhcpd.leases`
+ Reiniciar el servicio `sudo systemctl start isc-dhcp-server`

**Servidor DHCP**

```
default-lease-time 600;   # 10 minutos
max-lease-time 3600;      # 1 hora
```

- Si un cliente obtiene una IP a las 10:00, tendrá la dirección garantizada hasta las 10:10 (lease default).
- Si la IP se renueva correctamente, puede extenderse hasta 11:00 (máximo permitido).
- Tras las 11:00, si no hay renovación, la IP vuelve al pool de direcciones disponibles.
///

### Datos que contiene un lease

En Linux, se pueden ver en `/var/lib/dhcp/dhclient.leases`:

- Dirección IP asignada.
- Tiempo de lease (inicio y fin).
- Dirección del servidor DHCP que asignó la IP.
- Opciones DHCP: gateway, DNS, dominio, etc.

## Tipos de asignación de direcciones

- **Asignación dinámica**  
  - El servidor asigna direcciones IP de un rango (scope) definido.  
  - Cuando expira el "lease" (tiempo de concesión), la IP puede volver al pool y ser usada por otro cliente.

- **Asignación automática**  
  - La dirección IP se asigna permanentemente al cliente, incluso después de expirar el lease.  
  - Útil en redes pequeñas.

- **Asignación manual (reservación)**  
  - El administrador asocia una dirección IP fija a una **MAC** determinada.  
  - Ejemplo: reservar siempre `192.168.1.50` para la impresora de red.


## Conceptos clave

- Lease (concesión) = Es el período de tiempo durante el cual un cliente puede usar la dirección IP asignada.  
- Scope o ámbito = Es el rango de direcciones IP que el servidor puede asignar. \
  *Ejemplo*: `192.168.1.100 – 192.168.1.200`.
- Relay DHCP = Dispositivo (normalmente un router) que reenvía las solicitudes DHCP entre clientes y \
  servidores en diferentes redes:
  - Se usa cuando los clientes no están en la misma subred que el servidor DHCP.  
  - El protocolo usado es **DHCP Relay Agent (BOOTP relay)**.


## Ventajas de usar DHCP

- Administración centralizada de direcciones IP.  
- Menor probabilidad de errores humanos.  
- Escalabilidad: funciona bien en redes pequeñas, medianas y grandes.  
- Permite reutilizar direcciones IP gracias al sistema de concesiones.  
- Facilita la movilidad de equipos (portátiles, móviles).

---

## Desventajas y riesgos de DHCP

- Dependencia del servidor : si el servidor DHCP falla, los clientes nuevos no obtendrán configuración.  
- Ataques de servidores falsos (Rogue DHCP) : un atacante puede levantar un servidor DHCP no autorizado y entregar \
  configuraciones maliciosas. *Ejemplo*: dar como gateway la IP del atacante para espiar el tráfico.  
- Necesidad de controles de seguridad : en redes corporativas (autenticación, filtrado de MAC).


# Instalación básica del sistema

## Instalación servidor DHCP

### Paquete de instalación

Instala el paquete *isc-dhcp-server*.

Tiene dos !!ficheros de configuración!!:

- Interface : /etc/default/isc-dhcp-server
- Configuración general : /etc/dhcp/dhcpd.conf

- Comprobar errores : dhcpd -cf /path/to/dhcpd.conf
- Controlar las conexiones en tiempo real : sudo watch dhcp-lease-list

### Configuración del sistema

Ejemplo de un servidor DHCP para red 192.168.1.0/24:

```
# Tiempo de concesión por defecto
default-lease-time 600;
max-lease-time 7200;

# Dirección del servidor DNS y dominio
option domain-name "midominio.local";
option domain-name-servers 8.8.8.8, 1.1.1.1;

# Rango de direcciones que entregará el servidor
subnet 192.168.1.0 netmask 255.255.255.0 {
  range 192.168.1.100 192.168.1.200;
  option routers 192.168.1.1;
  option broadcast-address 192.168.1.255;
}
```

### Comandos para el servicio

```
sudo systemctl restart isc-dhcp-server   # Reinicia servicio
sudo systemctl status isc-dhcp-server    # Ver estado
sudo journalctl -xeu isc-dhcp-server     # Ver logs en caso de error
```

### Reservas estáticas

Puedes asignar una IP fija a un cliente concreto usando su MAC address:

```
host servidor1 {
  hardware ethernet 08:00:27:aa:bb:cc;
  fixed-address 192.168.1.50;
}
```

### Ver concesiones activas

En el archivo `/var/lib/dhcp/dhcpd.leases`

O mediante el comando `cat /var/lib/dhcp/dhcpd.leases`




## Instalación básica Cliente DHCP

Instala el paquete *isc-dhcp-client*.

- Info sobre el servidor DHCP : sudo dhclient -v «interfaz»
- Soltar una IP : sudo dhclient -r «interfaz»





# DHCP en sistemas concretos

## DHCP en Linux

En sistemas GNU/Linux existen varias implementaciones de cliente y servidor DHCP:

- **Cliente DHCP**:  
  - `dhclient` (usado en Debian, Ubuntu, Max).  
  - `dhcpcd` (usado en Arch Linux).  

- **Servidor DHCP**:  
  - `isc-dhcp-server`: el más clásico y extendido.  
  - `dnsmasq`: ligero, combina DNS y DHCP.  
  - `keadhcp`: sucesor moderno del ISC DHCP.

### Ejemplo de configuración en `isc-dhcp-server`

/// ejemplo

En este ejemplo:

- El servidor da IPs entre 192.168.1.100 y 192.168.1.200.
- Todos los clientes reciben como router el 192.168.1.1 y DNS de Google.
- La impresora con MAC 00:11:22:33:44:55 siempre recibirá la IP 192.168.1.50.

Archivo: `/etc/dhcp/dhcpd.conf`

```
# Definición de un ámbito
subnet 192.168.1.0 netmask 255.255.255.0 {
  range 192.168.1.100 192.168.1.200;
  option routers 192.168.1.1;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  default-lease-time 600;   # 10 minutos
  max-lease-time 7200;      # 2 horas
}

# Reservación de IP para un cliente específico
host impresora {
  hardware ethernet 00:11:22:33:44:55;
  fixed-address 192.168.1.50;
}
```
///

## DHCP en Windows

Se gestiona desde la Consola DHCP del servidor Windows.
Permite configurar scopes, reservas y opciones adicionales de manera gráfica.
En clientes Windows, el comando para renovar la IP es:

```
ipconfig /release
ipconfig /renew
```

## DHCPv6 (para IPv6)

- DHCP también tiene una variante para redes IPv6: DHCPv6.
- Puede coexistir con SLAAC (Stateless Address Autoconfiguration).
- Los mensajes son similares a los de IPv4, pero adaptados a IPv6.
- Existen dos modos principales:
  - Stateful = el servidor gestiona direcciones IPv6 y parámetros.
  - Stateless = solo entrega parámetros (ejemplo: servidores DNS), mientras que la IP la obtiene con SLAAC.

# Comandos útiles

## Comandos en Linux

```
ip addr show        #Verificar configuración IP
sudo dhclient -v    #Forzar renovación de IP
sudo dhclient -r    #Liberar la IP
```

## Comandos en Windows

```
ipconfig /all       # Ver configuración
ipconfig /renew     # Renovar IP
ipconfig /release   #Liberar IP
```




# Prácticas de DHCP

## Referencias del servidor DHCP

El paquete del servidor es *isc-dhcp-server*.

Tiene dos ==ficheros de configuración==:

- Interface : /etc/default/isc-dhcp-server
- Configuración general : /etc/dhcp/dhcpd.conf

**Comandos útiles del servidor**

- Comprobar errores : `dhcpd -cf /path/to/dhcpd.conf`
- Controlar las conexiones en tiempo real : `sudo watch dhcp-lease-list`
- Comprobar el estatus del servidor : `sudo systemctl status isc-dhcp-server`
- Reiniciar el servicio : `sudo systemctl restart isc-dhcp-server`
- Detener el servidor : `sudo systemctl stop isc-dhcp-server`
- Arrancar el servidor : `sudo systemctl start isc-dhcp-server`
- Recargar configuración sin reiniciar completamente : `sudo systemctl reload isc-dhcp-server`
- Logs para verificar : `sudo journalctl -u isc-dhcp-server -f`

## Referencias del cliente DHCP

Instala el paquete *isc-dhcp-client*.

- Info sobre el servidor DHCP : sudo dhclient -v «interfaz»
- Soltar una IP : sudo dhclient -r «interfaz»

**Comandos útiles del cliente**

- Ver la IP asignada por DHCP : `ip addr show`
- Solicitar una dirección IP nueva : `sudo dhclient`
- Liberar la dirección IP actual : `sudo dhclient -r`
- Renovar la dirección IP : `sudo dhclient -v`
- Comprobar leases actuales : `cat /var/lib/dhcp/dhclient.leases`
- Detalles importantes : dhclient es solo el cliente, no gestiona múltiples clientes ni servidores. \
  Si hay conflictos, a veces es útil hacer: 
  - `sudo dhclient -r`
  - `sudo dhclient -v -pf /run/dhclient.eth0.pid eth0`
  - Recuerda que : eth0 es el nombre del interfaz


## Prácticas sencillas

Configura un servidor DHCP en una máquina Linux (con *isc-dhcp-server*) que asigne direcciones en el rango
  192.168.10.100 – 192.168.10.150, con:

- Máscara de subred /24.
- Gateway 192.168.10.1.
- DNS 8.8.8.8.

Comprueba desde un cliente (máquina virtual o física) que recibe la configuración automáticamente.

Cambia la duración de la concesión y modifica el servidor DHCP para que la duración de la concesión 
(lease-time) sea de solo 2 minutos.

- Arranca un cliente y comprueba cuánto tarda en renovar su dirección.
- Muestra la información con ip addr o ipconfig.

## Prácticas intermedias

### Reserva de dirección IP

Configura en tu servidor DHCP una reserva para que la máquina cliente con la MAC `00:11:22:33:44:55` reciba siempre la 
dirección `192.168.10.50`.

Comprueba que el cliente obtiene siempre esa dirección aunque liberes/renueves con `dhclient -r` o `ipconfig /release`.

### Exclusión de direcciones

Define un rango DHCP de `192.168.10.100 – 192.168.10.200`, pero excluye las direcciones de `192.168.10.120 – 
192.168.10.130`.

- Justifica para qué sirve este tipo de exclusiones.
- Verifica que un cliente nunca recibe esas direcciones reservadas.

### Prueba con múltiples clientes

Lanza tres máquinas clientes en la red y observa cómo cada una recibe una dirección diferente dentro del rango 
disponible.

- Documenta las IP que reciben y el archivo de concesiones del servidor (`/var/lib/dhcp/dhcpd.leases`).

### Configuración de múltiples ámbitos

Configura un servidor DHCP que gestione dos rangos de direcciones diferentes en la misma red:

- 192.168.10.100 – 192.168.10.150
- 192.168.10.200 – 192.168.10.220

Observa qué direcciones recibe cada cliente y explica cómo decide el servidor a qué rango asignar.

### Cambiar la puerta de enlace por defecto

Configura un servidor DHCP que entregue como gateway por defecto la dirección `192.168.10.254`.

- Comprueba que los clientes actualizan su tabla de rutas.
- Explica qué ocurriría si entregas como gateway una dirección inexistente.

Referencia: https://serviciosgs.readthedocs.io/es/latest/practicas/practica_dhcp.html#preparacion-del-escenario
