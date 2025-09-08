---
title : Servidor Postfix
toc : true
logo : true
---


Postfix es un servidor de correo (MTA - Mail Transfer Agent) que se usa para enviar y recibir correos en servidores Linux.

# Instalación de Postfix

Para la instalación de los paquetes:

```
$ sudo apt update && sudo apt install postfix -y
```

# Configuración básica

El archivo principal de configuración es `/etc/postfix/main.cf`

Y para poder configurarlo manualmente podemos hacer:

```
$ sudo nano /etc/postfix/main.cf
```

Ahora debes asegurarte de que tengas estas líneas:

```
myhostname = mail.tudominio.com
mydomain = tudominio.com
myorigin = $mydomain
inet_interfaces = all
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
relayhost =
mynetworks = 127.0.0.0/8
home_mailbox = Maildir/
```

Es importante que lo completes con la información correcta.

# Crear una cuenta de correo

Postfix usa cuentas de usuario de Linux para gestionar correos.

Crea un usuario para recibir correos:

```
$ sudo adduser usuario
```

y establecemos una contraseña para el usario con:

```
$ sudo passwd usuario
```

# Enviar un correo desde la terminal

Usa mail (instala mailutils si no lo tienes):

```
$ echo "Hola, este es un correo de prueba" | mail -s "Asunto" usuario@tudominio.com
```

Para verificar los correos recibidos puedes emplear:

```
$ mail
```

# Configurar clientes de correo

Para acceder a los correos, necesitas configurar un servidor IMAP/POP3, como Dovecot.

## Instala Dovecot:

Para instalarlo ejecuta este comando en el terminal:

```
$ sudo apt install dovecot-imapd dovecot-pop3d -y
```

Y ahora edita su configuración:

```
$ sudo nano /etc/dovecot/dovecot.conf
```

Asegúrate de que tenga:

```
protocols = imap pop3
```

Finalmente reiniciamos el servidor con `$ sudo systemctl restart dovecot`.

Ahora puedes acceder con Thunderbird usando:

- Servidor entrante (IMAP/POP3) : mail.tudominio.com
- Servidor saliente (SMTP) : mail.tudominio.com

# Habilitar autenticación y seguridad

Para enviar correos de manera segura, instala certificados SSL:

```
$ sudo apt install certbot -y
$ sudo certbot certonly --standalone -d mail.tudominio.com
```

Edita Postfix para habilitar TLS:

```
$ sudo nano /etc/postfix/main.cf
```

Añade o edita estas líneas:

```
smtpd_tls_cert_file=/etc/letsencrypt/live/mail.tudominio.com/fullchain.pem
smtpd_tls_key_file=/etc/letsencrypt/live/mail.tudominio.com/privkey.pem
smtpd_use_tls=yes
```

Para terminar Reinicia Postfix con `$ sudo systemctl restart postfix`.

# Probar el servidor SMTP

Para probar el envío de correos con autenticación SMTP, usa telnet:

```
$ telnet mail.tudominio.com 25
```

Si responde con *220* mail.tudominio.com, el servidor funciona correctamente.





