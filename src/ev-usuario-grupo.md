---
title : Evaluación de usuarios y grupos
toc : true
logo : true
---


# Evaluación completa de SSH

Para esta práctica necesitamos dos máquinas virtuales:

- Máquina que se llamará *gotham* que será el *servidor*
- Máquina que se llamará *cliente* que será el *cliente*

<img src="img/batmanrobin1.png">


# Prepara el servidor Gotham

## Configuración de red

Ambas máquinas se van a comunicar entre sí, para ello:

- Ponemos ambas en modo *red interna*
- Asignaremos a cada una una IP fija
- Servidor gotham : Su IP será `192.168.7.10/24`
- Cliente : Su IP será `192.168.7.20/24`
- !!No hay que poner!! ni puerta de enlace ni dirección de DNS

## Aspecto visual

### Gotham

- [ ] El servidor tendrá el nombre de host *gotham*
- [ ] El terminal de *gotham* tendrá fondo oscuro con letras claras
- [ ] Añade la IP de de *cliente* al archivo `/etc/hosts`

### Cliente

- [ ] El nombre del host cliente será *cliente*
- [ ] El terminal de *cliente* tendrá fondo claro con letras oscuras
- [ ] Añade la IP de de *gotham* al archivo `/etc/hosts`

# Comprobación inicial

Comprueba que ambas máquinas se ven entre sí con `ping`

- [ ] El servidor *gotham* ve a *cliente*
- [ ] *Cliente* ve a *gotham*

# Creación de usuarios y grupos

+ Crea en el servidor *gotham* los usuarios: *batman*, *robin* y *harley*
+ Crea en el servidor *gotham* los grupos: *heroes*, *villanos* y *todos*
+ Asigna al grupo *heroes* a los usuarios *batman* y *robin*
+ Asigna al grupo *villanos* a *harley*
+ Asigna todos los usuarios al grupo *todos*

# Creación de directorios de trabajo

Todo esto **en el servidor**

```
/home/gotham/  
       │── heroes/  
       │   ├── batman/  
       │   ├── robin/  
       │   ├── compartido/      # Solo accesible por el grupo "heroes"  
       │── villanos/  
       │   ├── harley/  
       │   ├── compartido/      # Solo accesible por el grupo "villanos"  
       │── compartido/          # Accesible para todos  
       │── publico/             # Accesible para todos sin restricciones  
```

Asigna estos propietarios y grupos:

<table border="1">
    <tr>
        <th>Directorio</th>
        <th>Usuario</th>
        <th>Grupo</th>
    </tr>
    <tr>
        <td>/home/gotham/heroes/batman</td>
        <td>batman</td>
        <td>heroes</td>
    </tr>
    <tr>
        <td>/home/gotham/heroes/robin</td>
        <td>robin</td>
        <td>heroes</td>
    </tr>
    <tr>
        <td>/home/gotham/heroes/compartido</td>
        <td>-</td>
        <td>heroes</td>
    </tr>
    <tr>
        <td>/home/gotham/villanos/harley</td>
        <td>harley</td>
        <td>villanos</td>
    </tr>
    <tr>
        <td>/home/gotham/villanos/compartido</td>
        <td>-</td>
        <td>villanos</td>
    </tr>
    <tr>
        <td>/home/gotham/compartido</td>
        <td>-</td>
        <td>todos</td>
    </tr>
    <tr>
        <td>/home/gotham/publico</td>
        <td>-</td>
        <td>todos</td>
    </tr>
</table>

<img src="img/batmanrobin2.png">


# Comprobar la seguridad del sistema

Para comprobar la seguridad del sistema vamos a acceder por SSH desde la máquina virtual *cliente* con
diferentes usuarios y vamos comprobar si podemos crear o borrar archivos.

## Instala un servidor SSH en Gotham

Todo esto !!en el servidor gotham!!

- [ ] Configura el servidor *gotham* para que tenga una IP dinámica (DHCP) y pueda salir a Internet
- [ ] Instala en el servidor *gotham* un servidor de SSH
- [ ] Vuelve a poner al servidor *gotham* la **IP fija** que tenía al principio
- [ ] Inicia el servicio de SSH en el servidor *gotham*
- [ ] Comprueba que el servicio SSH está funcionando en el servidor *gotham*


## Conecta desde el cliente

Todo esto !!desde el cliente!!

- [ ] Accede como el usuario *batman* al servidor *gotham* mediante SSH 
- [ ] Accede al directorio `/home/gotham/heroes/batman` y crea el archivo vacío `batcueva.txt`
- [ ] Sal del servidor *gotham* y accede de nuevo con el usuario *harley*
- [ ] Accede al directorio `/home/gotham/heroes/batman` y borra el archivo `batcueva.txt`
- [ ] Accede al directorio `/home/gotham/villanos/harley` y crea el archivo `planes_malvados.txt`
- [ ] Sal del servidor *gotham* y accede con el usuario *robin*
- [ ] Accede al directorio `/home/gotham/villanos/harley/` y copia el archivo `planes_malvados.txt` al \
      directorio base de *robin*

## Haz una copia de seguridad

Una copia de seguridad es una buena idea para minimizar el riesgo de perder información.

- [ ] Crea una nueva carpeta llamada `/home/backup`
- [ ] Copiar todo el árbol de directorios de `/home/gotham` a `/home/backup`

# Evaluación

Para la evaluación vamos a comprobar !!estos items!! el tiempo disponible para la práctica es de 60 minutos. Por cada
diez minutos o fracción que exceda la cantidad se restará medio punto:

<table border="1">
<tr><th>Puntuación</th><th>Puntuación</th><th>Descripción</th></tr>
<tr><td><input type="checkbox"></td><td>1,5</td><td style="text-align: left; padding: 1rem;"> \
    Configuración de colores y nombres *host* adecuados en cliente y servidor</td></tr>
<tr><td><input type="checkbox"></td><td>1,5</td><td style="text-align: left; padding: 1rem;"> \
    Desde el servidor *gotham*: `$ ip a` debe mostrar la IP fija</td></tr>
<tr><td><input type="checkbox"></td><td>1,5</td><td style="text-align: left; padding: 1rem;"> \
    Desde el *cliente* `$ ssh batman@gotham` Debe poder acceder al servidor</td></tr>
<tr><td><input type="checkbox"></td><td>1,5</td><td style="text-align: left; padding: 1rem;"> \
    Ejecuta el comando `$ ls -l /home/gotham/heroes` Deben estar creados los directorios con los permisos adecuados</td></tr>
<tr><td><input type="checkbox"></td><td>2</td><td style="text-align: left; padding: 1rem;"> \
    Ejecuta el comando `$ ls -l /home/gotham/villanos/harley/planes_malvados.txt` Debe contener los permisos para *otros*: \
    no lectura, no escritura y no ejecución para *otros*</td></tr>
<tr><td><input type="checkbox"></td><td>2</td><td style="text-align: left; padding: 1rem;"> \
    Ejecuta el comando `$ tree /home/backup` Debe mostrar el árbol de directorios</td></tr>
</table>


