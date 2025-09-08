---
title : Servidor vsFTPd
toc : true
logo : true
---


# Instalación

Puedes instalar el servidor con:

```
$ sudo apt install vsftpd
```

Podemos comprobar que el servidor está funcionando correctamente mediante:

```
$ sudo systemctl status vsftpd
```

<img src="https://www.ryadel.com/wp-content/uploads/2017/12/vsftpd-linux-very-secure-ftp-server-logo.png">

# Configuración del servidor

El archivo de configuración es `/etc/vsftpd.conf`

/// atencion
Aunque existe la posibilidad de emplear usuarios anónimos y esto puede ser muy buena idea para facilitar
las descargas, supone un problema de seguridad a la hora de subir archivos por lo que no se recomienda.
///

Vamos a editar el fichero con `nano` o con `vim` y debemos tener estas directivas activadas (si están
comentadas hay que descomentarlas y si no existen hay que añadirlas):

```
utf8_filesystem=YES
local_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
write_enable=YES
```

Estas directivas se encargan de los siguiente:

+ utf8_filesystem = Se encarga de que los nombres de ficheros y directorios con tildes se vean correctamente
+ local_enable = Permite que las cuentas de los usuarios normales del sistem de Linux puedan usar FTP
+ chroot_local_user = Impide a los usuarios de FTP poder navegar por todo el disco duro libremente y \
  confina a los usuarios al directorio personal
+ allow_writeable_chroot = Permite al usuario subir archivos a su directorio de trabajo

**No olvides reiniciar el servicio**

## Creación de una cuenta de usuario específica

Vamos a crear un usuario para que otras personas puedan conectarse al servidor FTP, le vamos a llamar *visitante*:

```
$ sudo adduser visitante
```

Como es un usuario de pruebas, usaremos una contraseña sencilla: *1234*

# Configuración del cliente

El cliente que vamos a usar es *Filezilla* que es *software libre* y ha sido exaustivamente probado.

<img src="img/filezilla2.webp">

Para instalarlo:

```
$ sudo apt install filezilla
```

Ahora el cliente abre el *Gestor de sitios* e introduce las credenciales:

+ Nuevo Sitio
+ Asigna el nombre al servidor
+ Servidor = La ip del servidor
+ Modo de acceso = Normal
+ Usuario = visitante
+ Contraseña = La constraseña que hemos establecido antes para el usuario

Además vamos a forzar el modo de funcionamiento *UTF-8* para que podamos ver correctamente las tildes y las letras ñ:

<img src="img/filezilla1.webp">


