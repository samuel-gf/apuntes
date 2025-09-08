---
title : Servidor SSH
subtitle : Práctica sencilla y avanzada sobre el servidor SSH y la configuración de usuarios
logo : true
toc : true
---

SSH (Secure Shell) es un protocolo de red que permite acceder de manera segura a otros ordenadores a través de 
internet o una red local. Se utiliza principalmente para administrar servidores de forma remota, garantizando que las 
comunicaciones estén cifradas para proteger la privacidad y la seguridad de los datos.

<img src="https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2017/07/ssh-client-and-server.jpg" />


# Práctica 1

Esta es la práctica inicial para tomar contacto con SSH y la gestión de usuarios. En ella se cuenta lo más elemental
y se ofrece al alumno los comandos que debe usar.

## Instala SSH

Dificultad :: &#11088 (Práctica guiada)

En el servidor debemos instalar los paquetes `ssh`

```
$ sudo apt install ssh
```

Podemos comprobar que el servicio está funcionando mediante la orden `$ sudo systemctl status ssh`

- [ ] El servicio *SSH* está levantado y funcionando

## Cliente y servidor

Ahora vamos a comprobar que podemos conectar al servidor desde el cliente, para ello vamos a crear dos máquinas virtuales
y vamos a comprobar si ambas se pueden ver entre sí:

La máquina que tiene el servicio *SSH* será el *servidor* y la otra será el *cliente*

- [ ] Abre dos máquinas virtuales
- [ ] Llama a una máquina *servidor* mediante `$ sudo hostnamectl hostname servidor`
- [ ] Llama a la otra máquina *cliente*
- [ ] Configura ambas máquinas virtuales con una red de tipo *red interna*
- [ ] Asigna estas IPs a las máquinas:
```
Servidor 192.168.1.100/24
Cliente  192.168.1.200/24
```

Pregunta : ¿Cómo de difícil te ha parecido este paso?

Fácil <input type="range" min="0" max="10" /> Difícil

## Cambios en /etc/hosts

En el cliente añadiremos la IP del servidor y viceversa

- [ ] Edita `$ sudo nano /etc/hosts` en el cliente y añade:
```
192.168.1.100  servidor
```

- [ ] En el servidor, edita el mismo fichero y añade:
```
192.168.1.200  cliente
```

Pregunta : ¿Para qué sirve el fichero `/etc/hosts`?
<textarea placeholder="Respuesta"></textarea>


## Primera conexión

Si todo ha sido realizado correctamente, el cliente tiene que poder conectarse con el servidor mediante la orden:

```
$ ssh alumno@servidor
```

- [ ] El cliente se ha conectado correctamente con el servidor

## Generar claves pública y privada

En el cliente puedes generar la clave pública y privada con la orden:

```
$ ssh-keygen -t ecdsa
```

- Por defecto genera las claves en el directorio `~/.ssh/`.
- Además pedirá una frase de paso, este es un nivel doble de seguridad que podemos omitir pulsando *enter*.
- Cambia al directorio donde ha generado los ficheros con las claves.

## Compartir la clave pública

Se instala con la orden:

```
$ ssh-copy-id -i id_ecdsa.pub «usuario@host»
```

Donde:
- id_ecdsa = hace referencia al archivo con la clave pública
- usuario = es el usuario remoto
- host = el equipo donde instalar la clave



Pregunta : ¿Para qué sirve que el *cliente* comparta su clave *pública* con el servidor *titan*?
<textarea placeholder="Respuesta"></textarea>

## Segunda conexión

Haz que el cliente se conecte con el servidor sin necesidad de tener que poner la clave:

```
$ ssh alumno@servidor
```

Fácil <input type="range" min="0" max="10" /> Difícil






# Segunda práctica

Dificultad :: &#11088 &#11088 &#11088 (Práctica estándar)

En esta práctica vamos a crear varios usuarios en un *servidor* y después vamos a permitir que
los clientes se conecten a nuestro *servidor* con dichos usuarios.

<img src="https://www3.gobiernodecanarias.org/medusa/ecoescuela/proyectoevagd/files/2017/09/usuarios.png" />

## Requisitos

Para esta práctica necesitamos dos máquinas virtuales:

- Máquina virtual que se llamará *titan*
- Máquina virtual que se llamará *cliente*


## Configuración de red

Ambas máquinas se van a comunicar entre sí, para ello:

- Ponemos ambas en modo *adaptador puente*
- Ponemos la puerta de enlace y la dirección DNS que corresponda a la red actual

## Aspecto visual

### Titán

- El *servidor* tendrá el nombre de host *titan*
- El terminal del *servidor* tendrá fondo oscuro con letras claras
- Añade la IP de del *cliente* al archivo `/etc/hosts`

### Cliente

- El nombre del host cliente será *cliente*
- El terminal del *cliente* tendrá fondo claro con letras oscuras
- Añade la IP de del *titan* al archivo `/etc/hosts`


## Titán es visible

Comprueba que ambas máquinas se ven entre sí con `ping`

- [ ] *titan* ve al *cliente*
- [ ] El *cliente* ve al servidor *titan*

Pregunta : Hasta aquí como ha sido la práctica:

Fácil <input type="range" min="0" max="10" /> Difícil


## Usuarios y grupos

+ Crea los usuarios : admin, usuario1, invitado
+ Crea los grupos : admins, usuarios
+ Asigna al grupo : *admins* a *admin*
+ Asigna al grupo : *usuarios* a *usuario1* y a *invitado*

Ahora vamos a hacer dos comprobaciones para ver si el cliente puede conectar por *SSH* a *titan*.

### Acceso sin clave pública

- [ ] Conectas correctamente el *cliente* con el *servidor* `$ ssh invitado@titan`

### Acceso con clave pública

- [ ] Genera y comparte la clave pública del *cliente* con el servidor *titan*
- [ ] Comparte e instala la clave pública del cliente en el servidor *titan*
- [ ] Conecta desde el cliente con `$ ssh invitado@titan` y no pide contraseña

/// atencion
Desconecta : Ya puedes salir del cliente y volver al servidor *titan*
///


Accede al terminal del servdidor *titan* y crea este árbol de directorios:

```
/home
  ├── admin
  │   ├── documentos
  │   ├── descargas
  │   └── proyectos
  ├── usuario1
  │   ├── documentos
  │   └── fotos
  └── invitado
      └── public
```

### Permisos para /home/admin

/// atencion
Puedes asignar permiso y grupo en un solo comando mediante `$ sudo chown admin:admins /home/admin` para ahorrar pasos.
///


- Propietario : *admin* (lectura, escritura, ejecución).
- Grupo : *admins* (lectura y ejecución).
- Otros : Ningún permiso.
- Comando : `$ chmod 750 /home/admin`
- [ ] Hecho

### Permisos para /home/usuario1

- Propietario : *usuario1* (lectura, escritura, ejecución).
- Grupo : *usuarios* (lectura y ejecución).
- Otros : Ningún permiso.
- [ ] Hecho

### Permisos para /home/invitado

- Propietario : invitado (lectura, escritura, ejecución).
- Grupo : usuarios (lectura y ejecución).
- Otros : Lectura y ejecución (para permitir acceso limitado a los archivos públicos).
- [ ] Hecho

### Permisos para /home/admin/documentos

- Propietario : *admin* (lectura, escritura, ejecución).
- Grupo : *admins* (lectura y ejecución).
- Otros : Ningún permiso.
- [ ] Hecho

### Permisos para /home/usuario1/documentos

- Propietario : *usuario1* (lectura, escritura, ejecución).
- Grupo : *usuarios* (lectura y ejecución).
- Otros : Ningún permiso.
- [ ] Hecho

### Permisos para /home/usuario1/fotos

- Propietario : *usuario1* (lectura, escritura, ejecución).
- Grupo : *usuarios* (lectura y ejecución).
- Otros : Ningún permiso.
- [ ] Hecho

### Permisos para /home/invitado/public

- Propietario : *invitado* (lectura, escritura, ejecución).
- Grupo : *usuarios* (lectura y ejecución).
- Otros : Lectura y ejecución (para permitir que otros usuarios vean el contenido).
- [ ] Hecho

## Comprueba los permisos

Ejecuta esta orden para comprobar usuarios, permisos y grupos:

```
$ tree -pug /home
```

Pregunta : ¿Qué permiso de acceso tiene el usuario *invitado* sobre el directorio *proyectos*?¿Podría un invitado robar los proyectos de *admin*? \
<textarea placeholder="Respuesta"></textarea>

## Tercera conexión

Conecta desde el cliente al servidor con la orden:

```
$ ssh invitado@titan
```

Pregunta : ¿Desde la cuenta de *invitado* puedes borrar la carpeta de *proyectos* de *admin*?
<fieldset>
<div><input type="radio" name="borrable" value="si" /><label>Sí</label></div>
<div><input type="radio" name="borrable" value="no" /><label>No</label></div>
</fieldset>



## Evaluación usuarios SSH

- [ ] Desde el *cliente* `$ ping titan`
- [ ] El cliente conecta con el servidor `$ ssh invitado@titan` sin contraseña
- [ ] Ejecuta en *titan* `tree -pug /home/admin` y comprueba que el directorio *documentos* tiene *admin:admins ---*
- [ ] Ejecuta en *titan* `tree -pug /home/invitado` y comprueba que los permisos permiten a todo el mundo acceder



# Tercera práctica

Dificultad :: &#11088 &#11088 &#11088 &#11088 Práctica desafiante (Requiere razonamiento y resolución de problemas)

+ Monta un servicio SSH en tu sistema para que pueda acceder el profesor
+ Crear tres usuarios: *vendedor*, *comprador* e *invitado* (sus contraseñas serán «1234»).
+ Crar el grupo: *compraventa* y asociar a los !!dos primeros usuarios!! a dicho grupo (invitado se queda fuera).
+ Crea este árbol de carpetas:
```
/home/compraventa
/home/compraventa/compras
/home/compraventa/ventas
/home/compraventa/compartida
```
+ **Solo** el *vendedor* puede entrar con permisos de lectura, escritura y ejecución en la carpeta *ventas* (y nadie más).
+ **Solo** el *comprador* puede entrar con permisos de lectura, escritura y ejecución en la carpeta *compras* (y nadie más).
+ En la carpeta *compartida* **ambos usuarios** (solo ambos usuarios) puedan entrar para leer y escribir.

<textarea placeholder="Apunta aquí la IP de tu máquina porque tu profesor te la va a pedir para la evaluación"></textarea>

## Evaluación de SSH

El profesor accede por *SSH* al equipo del alumno y:

- [ ] El profesor puede acceder como *comprador* al servidor SSH `ssh comprador@ip-del-alumno`
- [ ] Las carpetas *compras*, *ventas* y *compartida* tienen los permisos adecuados `ls -l /home/compraventa`

