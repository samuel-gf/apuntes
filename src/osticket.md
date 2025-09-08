---
title : Servidor osTicket
toc : true
logo : true
---

Dificultad :: &#11088 (Práctica guiada)

# Instalación del entorno de trabajo

En primer lugar vamos a actualizar el sistema gestor de paquetes con `$ sudo apt update`.

Ahora vamos a instalar todos los paquetes, tanto los obligatorios como los opcionales:

```
$ sudo apt install -y apache2 mariadb-server php libapache2-mod-php php-cli php-mysql php-mbstring php-imap php-gd php-xml php-intl php-apcu unzip
```

## Apache2

Comprueba que Apache2 es un servicio operativo en tu sistema, en caso de que no lo esté puedes instalarlo con:

```
$ sudo apt install apache2
```

Una vez instalado, puedes comprobar que funciona mediante:

```
$ sudo systemctl status apache2
```

- Visita el sitio web por defecto de tu servidor *Apache2*. Normalmente se suele hacer abriendo un navegador y visitando \
  la url: `http://localhost`.
- Toma nota del directorio donde *Apache2* tiene hospedada la página web por defecto porque es en esa dirección donde vamos \
  a instalar el servicio de *OSTicket*.
- Borra el fichero `index.html` que se encuentra en el directorio por defecto de *Apache2*

# Instalación de los paquetes de osTicket

Podemos descargarla del servidor *Github* en un directorio de trabajo:

```
$ git clone https://github.com/osTicket/osTicket.git
```

Ahora es necesario acceder al directorio donde se ha descargado el código fuente `$ cd osTicket` y lo instalamos en el directorio
definitivo mediante lo orden:

```
php manage.php deploy --setup /var/www/html
```

- Nota : Aquí el directorio `/var/www/html` es el directorio por defecto de *Apache2*.

## Creación de la base de datos

Accede a MySQL:

```
$ sudo mysql -u root -p
```

Crea la base de datos y el usuario para osTicket:

```
CREATE DATABASE osticket;
CREATE USER 'osticketuser'@'localhost' IDENTIFIED BY 'password_segura';
GRANT ALL PRIVILEGES ON osticket.* TO 'osticketuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```


# Proceso de instalación de osTicket

Ahora abre el navegador y a continuación ve a la URL `http://localhost`.

- Podrás comprobar que se cumplen todos los requisitos y puedes pasar a la siguiente pantalla
- Ahora aparece una advertencia que indica que debes disponer de un fichero llamado `include/ost-config.php` y que además \
  este fichero debe poder ser escrito por *Apache2*, para poder hacer esto damos los siguientes pasos:
  - Entra en el directorio `include`
  - Copia el archivo `ost-sampleconfig.php` al archivo `ost-config.php`
  - Ahora cambia el grupo al que pertence dicho archivo. Pasará a ser parte del grupo *www-data* que es el usuario del servidor *Apache2*
  - Finalmente otrorga a este fichero permiso de escritura para el grupo
  - Regresa al navegador y comprueba que el fichero ya puede ser escrito por el servidor *Apache2*

## Rellenando los datos de configuración

En el formulario web debemos poner estos datos:

- Helpdesk Name = Nombre de la empresa
- Default Email = El correo del administrador del servicio
- First Name = Nombre del administrador del servicio
- Last Name = Apellido del administador del servicio
- Email Address = Otro correo electrónico diferente del de defecto que has escrito antes
- Username = Nombre de usuario del administrador
- Password = Contraseña del administrador

## Protegiendo el sistema

Debemos hacer un cambio para proteger el servicio de usos no autorizados:

Cambia los permisos del archivo de configuración `$ chmod 0644 include/ost-config.php`

## Instalando el idioma de trabajo

- Descarga el paquete de idioma español desde `https://osticket.com/download`
- Ve a la pestaña *Language Packs*
- Selecciona la versión que tienes instalada en el sistema
- Selecciona el idioma
- Pulsa el botón *Download*
- Si te pide !!datos para suscribirte!! a su boletín de noticias, pincha en «No gracias» que aparece abajo a la izquierda en pequeño
- Mueve el archivo descargado al directorio `include/i18n`

# Probando el servicio

Algunos enlaces estándar ahora que el sistema está funcionando son:

- Página principal del servicio `http://localhost`
- Página de acceso al servicio para las personas que administran el servicio: `http://localhost/scp`


## Accede como administrador del sistema

- Accede como administrador del sistema a `http://localhost/scp`
- Accede a la pestaña de *configuración* (settings en inglés) y baja hasta *System language*, cambia el idioma de la interfaz y guarda los cambios
- Sal del sistema *logout* y vuelve a entrar *login*

## Crea una cuenta de usuario

- Accede a la página principal y crea una cuenta de usuario
- Abre un ticket con una petición

## Desbloquea el usuario nuevo

- Accede al panel de control de administradores
- Mira la lista de tickets
- Desbloquea al usuario nuevo


