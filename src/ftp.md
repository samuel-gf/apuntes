---
title : Servidor de archivos FTP
subtitle : Servidor vsftpd
toc : true
logo : true
---


# Instalación del servicio

## Paquetes

Instala los paquetes:

```
sudo apt update
sudo apt install -y vsftpd openssl
```

## Arancar el servicio

```
sudo systemctl enable --now vsftpd
sudo systemctl status vsftpd   # comprobar estado
```

## Crea usuario local

```
sudo adduser --shell /usr/sbin/nologin invitado
```

Añade el shell a la lista de permitidos en `/etc/shells`

```
/usr/sbin/nologin
```

Crea un directorio para subir archivos:

```
/home/invitado/archivos
```

y dale permisos para que se puedan subir archivos desde el cliente:

```
sudo chown invitado:invitado /home/invitado/archivos
```

# Confinar al usuario

Este proceso es conocido como *chroot*.

## Archivo de configuración para confinar usuario

El ==archivo de configuración== del servicio es `/etc/vsftpd.conf`. Se recomienda hacer
una copia de respaldo del fichero antes de editarlo y un ejemplo típico es:

```
# Opciones generales
listen=YES

# Usuarios locales
anonymous_enable=NO
local_enable=YES
write_enable=YES
utf8_filesystem=YES
local_umask=022

# Encierra a cada usuario en su directorio base
chroot_local_user=YES
allow_writeable_chroot=YES

# Usa la variable del usuario
user_sub_token=$USER
local_root=/home/$USER

# Opciones de seguridad
pam_service_name=vsftpd
seccomp_sandbox=NO
```

# Configuración del sistema para usuarios locales

## Fichero de configuración vsftpd.conf

Copia de respaldo del fichero de configuración

```
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
```

## Configuración segura mínima

Edita `/etc/vsftpd.conf` y reemplaza/añade las siguientes líneas:


```
# vsftpd.conf - fragmento seguro
listen=YES
listen_ipv6=NO

anonymous_enable=NO         # no permitir anónimos
local_enable=YES            # permitir usuarios locales
write_enable=YES            # permitir escritura
local_umask=022

chroot_local_user=YES       # encerrar usuarios en su home
allow_writeable_chroot=YES  # si el home es escribible (vsftpd >=3.x)
user_sub_token=$USER
local_root=/home/$USER/ftp  # (opcional) forzar subdir ftp

# Passive mode (importante para firewall/NAT)
pasv_enable=YES
pasv_min_port=40000
pasv_max_port=50000
# pasv_address=TU_IP_PUBLICA   # opcional: si servidor detrás NAT, poner IP pública

# TLS/SSL (FTPS)
ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem

# logging & security
xferlog_enable=YES
log_ftp_protocol=YES
seccomp_sandbox=NO   # si produce problemas, prueba cambiar; por defecto NO en algunas distros
```

## Certificado TLS

```
sudo mkdir -p /etc/ssl/private
sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
  -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem \
  -subj "/CN=ftp.tuservidor.local"
sudo chmod 600 /etc/ssl/private/vsftpd.pem
```

## Usuarios FTP y chroot seguro

vsftpd requiere cuidado con permisos si usas `chroot` el home del usuario.

/// ejemplo
Crear usuario `invitado` con directorio base `/home/invitado` pero que en realidad
su directorio base es `/home/invitado/ftp` y carpeta `archivos` con permiso de escritura:

```
# crear usuario sin shell interactivo
sudo useradd -m -d /home/invitado -s /usr/sbin/nologin invitado
sudo passwd invitado

# crear estructura segura
sudo mkdir -p /home/invitado/ftp/archivos
sudo chown root:root /home/invitado/ftp              # home del chroot debe ser root
sudo chmod 755 /home/invitado/ftp
sudo chown invitado:ftp /home/invitado/ftp/archivos  # carpeta escribible
```

Si usas `local_root=/home/$USER/ftp` en `vsftpd.conf`, esto sirve.
///

## Firewall

```
sudo ufw allow 21/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw reload
```

## Comprobar logs

Reiniciar vsftpd y comprobar logs:

```
sudo systemctl restart vsftpd
sudo journalctl -u vsftpd -f   # ver logs en tiempo real
# o revisar /var/log/vsftpd.log o /var/log/xferlog según distro
```

## Prueba desde cliente

```
lftp -u ftpuser,yourpassword -e "set ftp:ssl-force true; set ftp:ssl-protect-data true; ls; bye" ftp://TU_SERVIDOR
```

## Comandos útiles de diagnóstico

```
# revisar servicio
sudo systemctl status vsftpd
# ver logs recientes
sudo journalctl -u vsftpd -n 200
# probar conexión TCP
telnet TU_SERVIDOR 21
# probar rango pasivo
nc -zv TU_SERVIDOR 40000-40010
```

# Crear un certificado TLS

FTP por sí solo transmite todo sin cifrar. TLS (Transport Layer Security) añade una capa de cifrado, igual que HTTPS lo hace sobre HTTP.

Cuando activas TLS en vsftpd, tu servidor se convierte en FTPS (FTP Secure). No confundir con SFTP, que usa SSH, son protocolos distintos.

Primero necesitas un certificado (puede ser autofirmado o emitido por una CA certificado).

Para un entorno de pruebas, basta con un certificado autofirmado:

```
sudo mkdir -p /etc/ssl/private
sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
  -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem \
  -subj "/CN=ftp.clase.local"
sudo chmod 600 /etc/ssl/private/vsftpd.pem
```

Esto genera un solo fichero que contiene clave privada + certificado público.

## Configurar vsftpd para usar TLS

Abre la configuración del fichero `/etc/vsftpd.conf` y añade estas líneas:

```
# --- Seguridad TLS ---
ssl_enable=YES
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES

rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem

ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO

require_ssl_reuse=NO
ssl_ciphers=HIGH
```
## Conexión segura desde Filezilla

Abre el gestor de sitios y selecciona la opción de *Requiere FTP explícito sobre TLS*.
Al conectar verás un aviso de certificado autofirmado que muestra la identificación del servidor.

# Configuración para acceso anónimo

Escenario que vamos a configurar

Los usuarios anónimos podrán entrar con usuario anonymous o ftp, sin contraseña o con cualquier texto.

Estarán encerrados (chroot) en /srv/ftp (no verán el resto del sistema).

Por seguridad:

No podrán escribir, solo descargar (lectura).

Luego te muestro cómo habilitar escritura si la necesitas.

🧩 1️⃣ Preparar el directorio anónimo

Crea la carpeta pública y dale permisos de solo lectura:

