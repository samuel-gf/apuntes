---
title : Administración del Sistema Operativo
toc : true
logo : true
---



# Introducción a la Administración del sistema

La administración de Linux implica gestionar sistemas operativos basados en Linux para garantizar su correcto funcionamiento. Los administradores deben 
dominar varios aspectos como usuarios, permisos, procesos, sistemas de archivos, red y seguridad.

# Gestión de usuarios y grupos

## Usuarios

- Añadir usuarios `sudo adduser usuario`
- Cambiar contraseñas `sudo passwd usuario`
- Eliminar usuarios `sudo deluser usuario`

## Grupos
- Añadir un grupo `sudo addgroup grupo1`
- Añadir usuario a un grupo `sudo usermod -aG grupo usuario`
- Ver los grupos de un usuario `groups usuario`



# Permisos y Propiedades de Archivos

## Propietarios

- Cambiar propietario de un archivo `sudo chown usuario archivo.txt`
- Cambiar grupo propietario `sudo chgrp grupo archivo.txt`

## Permisos

- Lectura (r), escritura (w), ejecución (x).
- Cambiar permisos `chmod 755 archivo.txt` 
  Esto asigna permisos :  rwxr-xr-x. 


# Procesos y Servicios

- Ver procesos en ejecución :  ps aux o top
- Terminar procesos `kill -s 9 1234` (donde 1234 es el ID del proceso).
- Administrar servicios. Ejemplos:

```
sudo systemctl start servicio # Arrancar un servicio
sudo systemctl stop servicio  # Deterner un servicio
```


# Gestión de Archivos y Directorios

- Crear directorio `mkdir carpeta`
- Eliminar archivos o carpetas `rm archivo.txt o rm -r carpeta`
- Copiar archivos `cp origen destino`
- Mover archivos `mv origen destino`

# Gestión de Redes

- Ver la configuración de red :  `ip a` o `ifconfig`
- Configurar una dirección IP estática :  Editar el archivo `/etc/network/interfaces` (dependiendo de la distribución).
- Probar conectividad `ping 8.8.8.8`
- Resolver nombres de dominio :  `nslookup` o `dig`.

# Gestión de Paquetes

Usar apt en distribuciones basadas en Debian:

- Actualizar listas de paquetes :  sudo apt update
- Instalar un paquete :  sudo apt install nombre_paquete
- Eliminar un paquete :  sudo apt remove nombre_paquete
- Usar dnf o yum en distribuciones basadas en Red Hat.

# Seguridad

Configurar el firewall con `ufw`

- Activar :  `sudo ufw enable`
- Permitir un puerto :  `sudo ufw allow 22`
- Ver reglas activas :  `sudo ufw status`
- Configurar contraseñas seguras y usar autenticación basada en claves para SSH.

# Registro de Eventos

Logs del sistema  :  

- Ver logs :  `sudo less /var/log/syslog`
- Filtrar logs :  `grep`
- Ejemplo :  `grep "error" /var/log/syslog`

