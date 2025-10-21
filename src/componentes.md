---
title : Componentes y direcciones de red
subtitle : Dispositivos que se encuentran en una red y como cada uno de ellos se identifica con una IP
toc : true
logo : true
---

![](https://castelmartecnologia.com.br/wp-content/uploads/2017/07/infraestrutura-de-redes.jpg)

# Infraestructura de red

La infraestructura de red es el conjunto de elementos físicos y lógicos que permiten la comunicación entre dispositivos dentro de una red y con el exterior.

**Elementos principales**

- Medios de transmisión : Son los canales por los que viajan los datos.
  - Cables de cobre = Ej. par trenzado (UTP/STP) y coaxial.
  - Fibra óptica = Permite alta velocidad y largas distancias.
  - Inalámbrico (Wi-Fi, LTE, 5G) = Comunicación sin cables, con menor estabilidad en algunos casos.
- Equipamiento activo : Dispositivos que procesan y gestionan el tráfico de datos.
  - Switches = Conectan dispositivos dentro de la misma red local (LAN). Operan en la capa 2 del modelo OSI (en ocasiones capa 3 para switches avanzados).
  - Routers = Dirigen los datos entre redes distintas (LAN ↔ WAN), gestionando rutas y protocolos de red.
  - Puntos de acceso (Access Point, AP) = Permiten conectar dispositivos inalámbricos a la red cableada.
- Equipamiento pasivo : Soporta físicamente la red pero no procesa datos.
  - Racks, patch panels, conectores, regletas, canalizaciones.

![](https://img1.wsimg.com/isteam/ip/f04a3b85-a842-4389-9537-7d26d92e9243/redes-de-campus.jpg)

# Dispositivos finales

Los dispositivos finales son aquellos que usan la red para enviar y recibir información. Están conectados al nivel más bajo de la infraestructura.

**Tipos más comunes**

- Ordenadores y servidores : PCs, portátiles, servidores de archivos o aplicaciones.
- Dispositivos móviles : Smartphones y tablets.
- Impresoras y escáneres de red : Pueden ser compartidos en la LAN.
- Dispositivos IoT : Cámaras IP, sensores, termostatos inteligentes.
- Consolas y equipos multimedia : Smart TV, consolas de videojuegos conectadas a Internet.

/// nota
Todos los dispositivos finales necesitan una IP para poder comunicarse en la red.
///

![Esquema LAN](https://4.bp.blogspot.com/-ZVPVzSWEW0Q/VVJ6hEUNKuI/AAAAAAAAAHE/DhUUFiQAzfs/s1600/lan.jpg)

# Opciones de conectividad al ISP

Para acceder a Internet, las redes necesitan conectarse a un Proveedor de Servicios de Internet (ISP). Las opciones más comunes son:

## Conexión por cable

- ADSL/VDSL : Usa la línea telefónica de cobre. Velocidad limitada, buena para usuarios domésticos.
- Cable (HFC) : Utiliza la infraestructura de televisión por cable. Mayor velocidad que ADSL.
- Fibra óptica : Alta velocidad y baja latencia. Cada vez más común.

## Conexión inalámbrica

- Wi-Fi público o privado : Se conecta a un router que a su vez se conecta al ISP.
- Redes móviles (3G, 4G, 5G) : Para movilidad y zonas sin infraestructura fija.
- Satélite : Para zonas rurales o aisladas. Latencia alta, velocidad variable.

## Conexión dedicada o empresarial

- Líneas alquiladas o MPLS : Conexiones seguras y fiables para empresas.
- VPN : Permite a los usuarios conectarse a la red de la empresa a través de Internet de forma segura.


![](https://conectividadiot.telefonicatech.com/wp-content/uploads/2024/03/tipo-de-direcciones-IP.jpg)

# IP y Direcciones de Red

## ¿Qué es una dirección IP?

Una dirección IP (Internet Protocol) es un identificador único que permite que los dispositivos se comuniquen entre sí en una red.

- Funciona como una dirección postal: indica quién envía y quién recibe los datos.
- Cada dispositivo en una red debe tener una IP única dentro de esa red.

**Tipos de IP según versión**

- IPv4 : Formato de 32 bits, representado como 4 octetos en decimal separados por puntos (ej. 192.168.1.10).
- IPv6 : Formato de 128 bits, representado en hexadecimal separado por dos puntos (ej. 2001:0db8:85a3::8a2e:0370:7334).

## Componentes de una dirección IPv4

Una dirección IPv4 se divide en dos partes:

+ Identificador de red = Indica a qué red pertenece el dispositivo.
+ Identificador de host = Identifica al dispositivo dentro de esa red.

![Ejemplo direcciones IP](https://ccnadesdecero.es/wp-content/uploads/2017/11/Tipos-de-direcciones-IP.png)

**Máscara de subred**

Define cuántos bits corresponden a la red y cuántos a los hosts.
Ejemplo:: 192.168.1.10 /24 → los primeros 24 bits son de la red y los últimos 8 del host.

![Direcciones IP](https://image.slidesharecdn.com/direccionamientoip-141217131732-conversion-gate01/95/direccionamiento-ip-3-638.jpg)

## Tipos de direcciones IP

### Según su alcance

- IP privada = Usadas dentro de redes locales (LAN), no son enrutables por Internet.

**Rangos más comunes**

```
10.0.0.0 – 10.255.255.255
172.16.0.0 – 172.31.255.255
192.168.0.0 – 192.168.255.255
```

- IP pública = Asignadas por el ISP y accesibles desde Internet.

### Según su función

- IP unicast = Identifica un solo dispositivo.
- IP broadcast = Envía datos a todos los dispositivos de la red (ej. 192.168.1.255 /24).
- IP multicast = Envía datos a un grupo específico de dispositivos.

## Tipos de asignación de IP

+ Estática = El administrador asigna manualmente la IP a cada dispositivo.
  - Ventaja : control total y estabilidad.
  - Desventaja : requiere configuración manual y mantenimiento.
+ Dinámica = El dispositivo recibe automáticamente la IP de un servidor DHCP.
  - Ventaja : fácil de gestionar y automatiza la asignación.
  - Desventaja : la IP puede cambiar con el tiempo.

## Otros conceptos importantes

- Puerta de enlace (Gateway) = Dirección IP del router que conecta la red local a otras redes o Internet.
- DNS (Domain Name System) = Convierte nombres de dominio (ej. google.com) en direcciones IP.
- Subredes = División de una red grande en redes más pequeñas para optimizar el tráfico y la seguridad.

<div class="actividades">
Nivel 1: Básico

Tienes la red 192.168.1.0/24.

Divide esta red en 4 subredes iguales.

Escribe: máscara de subred, dirección de red, rango de hosts válidos y dirección de broadcast para cada subred.

Una empresa dispone de la red 10.0.0.0/8 y necesita al menos 500 hosts por subred.

¿Qué máscara debe usar?

¿Cuántas subredes se obtienen?

Da un ejemplo con la primera subred.

🔹 Nivel 2: Intermedio

La red 172.16.0.0/16 debe dividirse en subredes con 2000 hosts cada una.

¿Qué máscara utilizar?

¿Cuántas subredes se pueden crear?

Indica las direcciones de red de las tres primeras subredes.

Tienes la dirección 192.168.10.50/27.

Determina:
a) Dirección de red
b) Broadcast
c) Rango de hosts válidos
d) Número total de hosts por subred

🔹 Nivel 3: Avanzado

La compañía “X” tiene asignada la red 200.100.0.0/20. Necesitan 5 sucursales, cada una con al menos 400 hosts.

¿Cómo dividirías la red en subredes válidas para cada sucursal?

Escribe las subredes asignadas.

En la red 192.168.100.0/24, se pide hacer VLSM (subneteo variable) para:

Departamento A: 100 hosts

Departamento B: 50 hosts

Departamento C: 25 hosts

Departamento D: 10 hosts

Calcula cómo repartir las subredes y escribe para cada departamento: red, máscara, hosts válidos y broadcast.
</div>
