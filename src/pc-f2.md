---
title : Sistemas Operativos
subtitle : Examen Global - Segunda evaluación
logo : true
toc : true
---

Esta práctica se realizará sobre una .ova llamada Examen y dispone de !!una hora!! para completarla.



# Configuración previa

+ Cambia el nombre de tu máquina, que pasará a llamarse `mario-server`
+ Monta un servicio SSH en tu sistema para que pueda acceder el profesor desde su ordenador

# Usuarios y grupos

Crea estos usuarios y anota las contraseñas para poder acceder posteriormente:

+ Crea tres usuarios:
  - Mario
  - Luigi
  - Bowser
+ Crea tres grupos:
  - Buenos
  - Malos
  - Todos

Asigna los usuarios a los grupos de la siguiente manera:

- Buenos : Pertenecerán a este grupo *Mario* y *Luigi*
- Malos : Pertenecerá a este grupo *Bowser*
- Todos : Pertenecerán a este grupo los usuarios: *Mario*, *Luigi* y *Bowser*

<img src="https://i.ytimg.com/vi/_VDAd77B-RE/maxresdefault.jpg">

# Árbol de directorios

Crea este árbol de directorios en el sistema:

```
/home/castillo
/home/reino
/home/mundo
```

- [ ] (0,3 puntos) Por cada directorio creado correctamente

- [ ] (0,5 puntos) El directorio `castillo` pertenecerá al usuario *bowser* y al grupo *bowser*
- [ ] (0,5 puntos) El directorio `reino` pertenecerá al usuario *mario* y al grupo *buenos*
- [ ] (0,5 puntos) El directorio `mundo` pertenece al usuario *administrador* y al grupo *todos*
- [ ] (0,5 puntos) En el directorio `castillo`, el usuario *Bowser* solo debe tener permisos de lectura y escritura. \
      Nadie más tendrá permisos de acceso a dicho directorio ni para leer, ni para escribir ni para ejecutar, ni tan siquiera los que \
      pertenezcan al grupo *bowser*
- [ ] (0,5 puntos) En el directorio `reino`, los usuarios *Mario* y *Luigi* tendrán permisos de lectura, escrituras y ejecución. \
      Nadie más tendrá acceso a dicho directorio ni para leer, ni para escribir, ni para ejecutar.
- [ ] (0,5 puntos) Los tres usuarios (*mario*, *luigi* y *bowser*) tendrán todos los permisos sobre la carpeta `mundo`. Todos los demás usuarios del sistema \
      no tendrán acceso al directorio de ningún tipo (ni lectura, ni escritura ni ejecución).

<img src="https://i.ytimg.com/vi/jDVhjQg4ukg/maxresdefault.jpg">


# Accede como Mario

Accede por *SSH* al sistema `mario-server` como !!Mario!! desde tu máquina real:

- [ ] (1,5 puntos) Crea un documento de texto vacío en la carpeta `reino` que se llamará `secreto_mario.txt` que solo podrá ser \
      leído y escrito (no ejecución) por *Mario*, pero no por *Luigi* ni por ningún otro usuario del sistema (mucho menos por *Bowser*).
- [ ] (1,5 puntos) Crea el fichero `plan_rescate.txt` en el directorio `mundo` que solo podrá ser leído y escrito por *Mario* y por *Luigi* (no ejecutado) pero \
      no podrá ser leído ni escrito ni ejecutado por *Bowser*
- [ ] (1,5 puntos) Crea el fichero `recursos.csv` en el directorio `mundo`, solo *Mario*  puede leer y escribir (pero no ejecutar). \
      Tanto *Luigi* como *Bowser* pueden leer el fichero (solo leerlo). El resto de usuarios del sistema no tendrán \
      ningún permiso concedido sobre el archivo.
- [ ] (1,5 puntos) Crea el fichero `noticias.md` en el directorio `mundo`. Todos los usuarios del sistema pueden leer pero no escribir ni ejecutar este fichero.






# Final

Apunta tu dirección de IP y házsela llegar al profesor. Si puede conectarse por SSH a tu servidor tienes +0,1 puntos más:

<textarea placeholder="Apunta aquí la IP de tu máquina porque tu profesor te la va a pedir para la evaluación"></textarea>


Ejecuta la orden: `$ tree -pug /home` y apunta lo que obtienes:

<textarea placeholder="Resultado de tree -pug /home"></textarea>

Se lo puedes enviar al profesor por correo electrónico.
