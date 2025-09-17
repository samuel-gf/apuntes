---
title : Nombres y NetPlan
subtitle : Guía básica que explica como asignar nombres a los equipos de una red y como usar NetPlan
toc : true
logo : true
---

Esta guía ofrece información sobre como asignar nombres a los equipos de una red y como usar NetPlan.


# Dar nombre a los equipos de la red

## Nombre para el equipo en el que estoy trabajando

Cambiar el nombre al equipo

```
sudo hostnamectl set-hostname «nuevo_nombre»
```

o más sencilla para hacer un cambio que pueda ser temporal:

```
sudo hostname «nuevo_nombre»
```

## Nombre a otros equipos de la red

Debes editar el fichero `/etc/hosts` y en él añadir el nombre y la ip de la máquina que quieres hacer referencia

## Asignar una dirección de resolución de nombres de dominio

Edita el fichero `/etc/resolv.conf` para asignar un servidor como por ejemplo el `8.8.8.8`:

```
nameserver 127.0.0.53
nameserver 8.8.8.8
```

# Netplan

Netplan es un sistema de configuración de red en Linux, introducido principalmente en Ubuntu 17.10 y versiones posteriores.
Funciona como una capa de abstracción:

- Los usuarios administradores configuran la red en YAML.
- Netplan traduce esa configuración a systemd-networkd o NetworkManager, según la elección.


## Ficheros de configuración de NetPlan

NetPlan lee todos los ficheros que se encuentran en el directorio:

`/etc/netplan/`

y los ejecuta en orden numérico del menor al mayor.

## Configuración para IP estática

Ejemplo de configuración estática con *systemd-networkd*. En este ejemplo se configura un equipo
con la IP `192.168.1.100` con una máscara de 24 bits, y los servidores de nombres `8.8.8.8` y `1.1.1.1`.


```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.1.100/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```

Para aplicar los cambios *sudo netplan apply*

## Configuración para IP dinámica

Ejemplo de configuración estática con *systemd-networkd*. En este ejemplo se configura un equipo
con la IP `192.168.1.100` con una máscara de 24 bits, y los servidores de nombres `8.8.8.8` y `1.1.1.1`.

```
# Configuración DHCP
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: yes
```

Para aplicar los cambios *sudo netplan apply*

## Renderers

- systemd-networkd : Ligero, usado en servidores `renderer: networkd`
- NetworkManager : Orientado a escritorios y entornos con cambios frecuentes de red `renderer: NetworkManager`

Si no hay renderer, Netplan aplica el predeterminado del sistema que suelen ser:

- En Ubuntu Server : suele ser systemd-networkd.
- En Ubuntu Desktop : suele ser NetworkManager.


# Comandos básicos de NetPlan

## Probar configuración sin hacerla definitiva

Permite validar y volver atrás si falla (útil para no perder conexión en remoto) `sudo netplan try`

## Aplicar la configuración

Hace los cambios permanentes `sudo netplan apply`


# Buenas prácticas

Siempre hacer copia de seguridad antes de editar:

`sudo cp /etc/netplan/01-netcfg.yaml ~/backup-netcfg.yaml`

- Verificar la indentación en YAML (muy estricta).
- Probar siempre con netplan try antes de aplicar en un servidor en producción.

