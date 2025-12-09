---
title : Wiki
toc : true
logo : true
---


# Instalación

+ Comprueba la versión de PHP instalado `php --version` necesitarás la versión 8.3 o posterior.
+ Puedes instalarlo con:
```
sudo apt update
sudo apt install php8.3-cli
```
+ Descarga <a href="https://www.mediawiki.org/wiki/Download">Media Wiki</a> en format *tar.gz* y guardálo en un
  directorio llamado _Wiki_.
+ Descomprime el archivo con el comando `tar xvzf nombre_del_archivo.tar.gx`
+ Mediawiki requiere una serie de extensiones de Apache que puedes instalar con
```
sudo apt install php php-intl php-mbstring php-xml php-apcu php-curl php-mysql
```
+ Instala MaríaDB con `sudo apt install mariadb-server`
+ Mueve los archivos de la wiki a alguna dirección donde Apache pueda mostrarlo como lo que es: una página web
+ Encárgate de que en el sistema haya un servidor Apache funcionando
+ Abre el navegador y apunta a la IP de tu equipo para abrir la wiki
+ Si fuera necesario (en esta práctica creo que no lo es) cambia el _DirectoryIndex_ en el fichero de configuración de Apache:
```
DirectoryIndex index.php index.html
```
+ Ejecuta María DB con el comando `mariadb` y lanza los comandos para crear un usuario administrador:
```
create user 'adm'@'localhost' identified by '1234';
grant all privileges on &#42;.&#42; to 'adm'@'localhost';
flush privileges;
```
+ Puedes salir con el comando `exit`
+ Es necesario que el directorio donde está el wiki permita escritura al servicio Apache
  para que se pueda guardar la configuración
+ A la hora de configurarlo emplea el aspecto *Monobook* deshabilitando todos los demás.
+ Mueve el archivo `$HOME/Descargas/LocalSettings.php` al directorio donde está el Wiki



