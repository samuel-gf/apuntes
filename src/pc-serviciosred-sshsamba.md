---
title : SSH y Samba
subtitle : Comprueba tus conocimientos
logo : true
toc : true
---

Esta práctica se realizará sobre una .ova llamada Júpiter.



# SSH

+ Monta un servicio SSH en tu sistema para que pueda acceder el profesor
+ Crear tres usuarios: *vendedor*, *comprador* e *invitado* (sus contraseñas serán «1234»).
+ Crar el grupo: *compraventa* y asociar a los ==dos primeros usuarios== a dicho grupo (invitado se queda fuera).
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


# Samba

+ Monta un servicio Samba en tu sistema para que pueda acceder el profesor
+ Llama a tu servidor «tuNombre-samba»
+ Crear el usuario *mortadelo* (su contraseña será 1234).
+ Crea una carpeta *pública* al que se puede acceder de manera *anónima* desde el ordenador del profesor.
+ Crea una carpeta *privada* donde solo el usuario *mortadelo* pueda entrar y subir archivosorem ipsum.

<img src="https://static.comunicae.com/photos/notas/1256214/document-management-system-concept-corporate-business-technology-online-documentation-database.jpg">

# Evaluación

- Cada apartado tiene una puntuación de 2,5 puntos.
- El alumno solo tendrá ==un intento de evaluación== y tendrá lugar cuando el alumno así lo pida durante el \
  tiempo que dure la clase.
- El tiempo de evaluación finalizará cuando suene la campana.
- El profesor debe poder acceder al servidor del alumno desde su propio ordenador a través de la red y probar lo siguiente:

## Evaluación de SSH

El profesor accede por *SSH* al equipo del alumno y:

- [ ] (2,5 puntos) El profesor puede acceder como *comprador* al servidor SSH `ssh comprador@ip-del-alumno`
- [ ] (2,5 puntos) Las carpetas *compras*, *ventas* y *compartida* tienen los permisos adecuados `ls -l /home/compraventa`

## Evaluación de Samba

Ahora el profesor accede mediante el explorador de archivos al servidor Samba y:

- [ ] (2,5 puntos) El profesor puede acceder a la carpeta anónima desde su ordenador y subir un archivo
- [ ] (2,5 puntos) El profesor puede acceder a la carpeta privada de mortadelo desde su ordenador y subir un archivo
