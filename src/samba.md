---
title : Servidor Samba
toc : true
logo : true
---

Dificultad :: &#11088 (Práctica guiada)

# Instalación y puesta a punto del servidor

En esta práctica es importante que la *máquina virtual servidor* funcione con la configuración de red de !!adaptador puente!!

Ejecuta la siguiente secuencia de comandos:

```
$ sudo apt update
$ sudo apt install samba
```

Prueba que la instalación se ha llevado a cabo de manera correcta con:

```
$ smbd --version
```


<img src="https://www.linuxcompatible.org/data/publish/194/d9412e96ee301096a6c0a822e9fe8ca7fe12e2/77cfdc5b7b9d5b43edc204cf3f77817b08274a96.jpg">

# Crear infraestructura compartida básica

## Crea un directorio compartido en el servidor

Vamos a crear una carpeta para compartir:

```
sudo mkdir -p /srv/samba/compartida
sudo chmod 777 /srv/samba/compartida
```

Esto permite que cualquier usuario pueda leer y escribir en la carpeta.

## Configuración de Samba

Editamos el archivo de configuración:

```
sudo nano /etc/samba/smb.conf
```

Al final del archivo, agrega lo siguiente:

```
[Compartida]
   path = /srv/samba/compartida
   browseable = yes
   read only = no
   guest ok = yes
```

Explicación:

- path = Ruta de la carpeta compartida.
- browseable&nbsp;=&nbsp;yes = Permite que la carpeta sea visible en la red.
- read only&nbsp;=&nbsp;no =  Permite modificar archivos.
- guest ok&nbsp;=&nbsp yes = Permite acceso sin contraseña.

Guarda el archivo y sal del editor

## Reinicia Samba

```
$ sudo systemctl restart smbd
```

Para asegurarte de que Samba se ejecuta al iniciar el sistema:

```
$ sudo systemctl enable smbd
```

## Comprobar el servidor Samba

Puedes verificar si Samba está funcionando con:

```
$ sudo smbstatus
```

Para comprobar la configuración del archivo `/etc/samba/smb.conf` puedes usar:

```
$ testparm
```

<img src="https://i.pinimg.com/originals/94/58/a6/9458a6f147f86870b860452c34747ace.jpg">

# Acceder desde otro equipo 

Accede a la *máquina virtual cliente* y sigue los pasos:

## Modo gráfico desde el cliente

- Abre el explorador de archivos en el modo gráfico del cliente y en la columa izquierda dirígete al apartado *Red*

<img src="img/samba-explorador.png">

- Identifícate de manera anónima en la máquina remota
- Entra en la carpeta compartida
- Crea y sube un fichero de texto vacío a la carpeta *compartida* del servidor Samba


# Configuración avanzada

## Crea usuarios Samba

Regresa al servidor y ejecuta estos comandos para que los usuarios tengan que iniciar sesión con sus cuentas:

```
$ sudo adduser usuariosamba
$ sudo smbpasswd -a usuariosamba
```

Luego, en *smb.conf*, cambia `guest ok = yes` por:

```
valid users = usuariosamba
```

Reinicia Samba para aplicar los cambios:

```
$ sudo systemctl restart smbd
```

Para comprobar todos los usuarios habilitados como clientes de Samba puedes usar:

```
$ sudo pdbedit -L
```

- [ ] Comprueba que el servidor Samba pide permisos para acceder



## Crear carpetas con diferentes permisos

Vamos a crear dos carpetas:

- Pública : todos pueden acceder
- Privada : solo un usuario específico puede acceder

```
sudo mkdir -p /srv/samba/publica
sudo mkdir -p /srv/samba/privada
```

Asignamos los permisos:

```
sudo chmod 777 /srv/samba/publica  # Acceso libre
sudo chmod 770 /srv/samba/privada  # Solo para usuarios del grupo samba
```

Creamos un grupo para los usuarios de Samba:

```
sudo groupadd grpsamba
sudo chown -R root:grpsamba /srv/samba/privada
```

## Crear usuarios y configurar Samba

Si queremos que solo ciertos usuarios puedan acceder, creamos usuarios específicos:

```
sudo adduser usuario1
sudo adduser usuario2
```

Agregamos los usuarios al grupo *grpsamba*:

```
sudo usermod -aG grpsamba usuario1
```

Establecemos sus contraseñas para Samba:

```
sudo smbpasswd -a usuario1
sudo smbpasswd -a usuario2
```

## Configurar las carpetas compartidas

Editamos el archivo de configuración:

```
sudo nano /etc/samba/smb.conf
```

Añadimos las siguientes configuraciones al final del archivo:


```
[Publica]
   path = /srv/samba/publica
   browseable = yes
   read only = no
   guest ok = yes

[Privada]
   path = /srv/samba/privada
   browseable = yes
   read only = no
   valid users = @grpsamba
```

- Pública = Todos pueden acceder sin autenticación.
- Privada = Solo los usuarios en el grupo *grpsamba* pueden acceder.

Guardamos y cerramos el archivo (CTRL + X, luego Y y Enter).

## Reiniciar y probar la nueva configuración

Aplicamos los cambios reiniciando Samba:

```
sudo systemctl restart smbd
```

Para comprobar la configuración:

```
testparm
```

# Comprobación de la práctica

- [ ] El servidor Samba está funcionando correctamente en el servidor
- [ ] El cliente puede conectarse mediante una cuenta de usuario con contraseña al servidor
- [ ] El cliente puede subir o bajar archivos a la carpeta compartida
- [ ] Se puede acceder al servidor Samba desde cualquier equipo de la red

# Comandos útiles opcionales

## Forzar cambio de usuario si ya has iniciado sesión

Si has accedido antes con otro usuario, el sistema puede recordar la sesión. Para asegurarte de conectarte con otro usuario:

```
sudo smbcontrol all close-share Privada
```

Si tienes problemas con credenciales almacenadas, prueba eliminar el caché de credenciales en Linux con:

```
rm ~/.smbcredentials
```

O en Windows:

```
cmdkey /delete:IP_DEL_SERVIDOR
```


