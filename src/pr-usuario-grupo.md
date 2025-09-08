---
title : Práctica de usuarios y grupos
toc : true
logo : true
---


# Requisitos

Para esta práctica necesitamos dos máquinas virtuales:

- Máquina que se llamará *servidor*
- Máquina que se llamará *cliente*




# Prepara el cliente y el servidor

## Configuración de red

Ambas máquinas se van a comunicar entre sí, para ello:

- Ponemos ambas en modo *red interna*
- Asignaremos a cada una una IP fija
- Servidor : Su IP será `192.168.1.100/24`
- Cliente : Su IP será `192.168.1.200/24`
- !!No hay que poner!! ni puerta de enlace ni dirección de DNS

## Aspecto visual

### Servidor

- El servidor tendrá el nombre de host *servidor* y se consigue de esta manera `$ sudo hostnamectl hostname servidor`
- El terminal del *servidor* tendrá fondo oscuro con letras claras
- Añade la IP de del *cliente* al archivo `/etc/hosts`

### Cliente

- El nombre del host cliente será *cliente* y se hace así `$ sudo hostnamectl hostname cliente`
- El terminal del *cliente* tendrá fondo claro con letras oscuras
- Añade la IP de del *servidor* al archivo `/etc/hosts`

# Comprobación inicial

Comprueba que ambas máquinas se ven entre con `ping`

- [ ] El *servidor* ve al *cliente*
- [ ] El *cliente* ve al *servidor*

# Creación de usuarios y grupos

+ Crea en el servidor los usuarios: *antonio*, *beatriz* y *carlos*
+ Crea en el servidor los grupos: *desarrollo* y *soporte*
+ Asigna al grupo *desarrollo* a los usuarios *antonio* y *beatriz*
+ Asigna al grupo *soporte* a *beatriz* y *carlos*

# Creación de directorios de trabajo

Todo esto **en el servidor**

```
/home/empresa/
      ├── desarrollo/
      │   ├── proyectos/
      │   ├── documentos/
      │   └── scripts/
      ├── soporte/
      ├── tickets/
      ├── informes/
      └── herramientas/
```

Asigna estos propietarios y grupos:

<table border="1">
    <tr>
        <th>Directorio</th>
        <th>Propietario</th>
        <th>Grupo</th>
        <th>Descripción</th>
    </tr>
    <tr>
        <td>/home/empresa</td>
        <td>root</td>
        <td>root</td>
        <td>Directorio raíz de la empresa</td>
    </tr>
    <tr>
        <td>/home/empresa/desarrollo</td>
        <td>carlos</td>
        <td>desarrollo</td>
        <td>Área de desarrollo</td>
    </tr>
    <tr>
        <td>/home/empresa/desarrollo/proyectos</td>
        <td>antonio</td>
        <td>desarrollo</td>
        <td>Proyectos en desarrollo</td>
    </tr>
    <tr>
        <td>/home/empresa/desarrollo/documentos</td>
        <td>carlos</td>
        <td>desarrollo</td>
        <td>Documentación de desarrollo</td>
    </tr>
    <tr>
        <td>/home/empresa/desarrollo/scripts</td>
        <td>beatriz</td>
        <td>desarrollo</td>
        <td>Scripts del equipo de desarrollo</td>
    </tr>
    <tr>
        <td>/home/empresa/soporte</td>
        <td>carlos</td>
        <td>soporte</td>
        <td>Área de soporte</td>
    </tr>
    <tr>
        <td>/home/empresa/soporte/tickets</td>
        <td>beatriz</td>
        <td>soporte</td>
        <td>Gestión de tickets de soporte</td>
    </tr>
    <tr>
        <td>/home/empresa/soporte/informes</td>
        <td>antonio</td>
        <td>soporte</td>
        <td>Informes de soporte</td>
    </tr>
    <tr>
        <td>/home/empresa/soporte/herramientas</td>
        <td>carlos</td>
        <td>soporte</td>
        <td>Herramientas del equipo de soporte</td>
    </tr>
</table>

# Simular un ataque

## Instala un servidor SSH

Todo esto !!en el servidor!!

- [ ] Configura el virtualbox del servidor para que tenga *red* en modo *adaptador punte*
- [ ] Configura el *servidor* para que tenga una IP dinámica (DHCP)
- [ ] Instala en el *servidor* SSH con el comando `$ sudo apt install ssh`
- [ ] Vuelve a poner al *servidor* la **IP fija** que tenía al principio
- [ ] Inicia el servicio de SSH en el servidor `$ sudo systemctl start ssh`
- [ ] Comprueba que el servicio SSH está funcionando `$ sudo systemctl status ssh`


## Inicia el ataque

Todo esto !!desde el cliente!!

- Accede como el usuario *antonio* al sistema mediante SSH 
```
$ ssh antonio@servidor
```
- Accede al directorio `/home/empresa/soporte` y crea algún archivo para ver si puedes hacer cambios \
  en el directorio
- Trata de crear un archivo vacío

- [ ] Tu sistema ha impedido que acceda al directorio
- [ ] Tu sistema ha impedido que antonio pueda crear un archivo


Activa la cuenta de root con una contraseña que no sea _fácil de averiguar_
```
$ sudo passwd root
```

- [ ] Tu sistema ha impedido que *antonio* pueda cambiar la contraseña de root

Ya puedes dejar de ser el usuario *antonio* y pasar al siguiente punto de la práctica.

# Prepárate contra borrado de datos

- Crea una nueva carpeta llamada `/home/empresa/backup`
- Copiar todos los archivos de empresa (excepto backup) dentro del directorio que acabas de crear
- Comprueba el resultado usando `tree`

- [ ] Has podido realizar la copia de seguridad

 

