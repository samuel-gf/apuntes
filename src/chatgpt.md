---
title : Práctica de prompt
toc : true
logo : true
---


# Práctica: Creación de Prompts Avanzados en la Shell de Linux

## Objetivo
El objetivo de esta práctica es que los alumnos diseñen y configuren un prompt avanzado en la shell de Linux utilizando variables, colores e información útil sobre el sistema y el usuario.

## Requisitos previos
- Conocimientos básicos sobre variables de entorno en Bash.
- Uso de la variable `PS1` para personalizar el prompt.
- Manejo de secuencias de escape ANSI para colores.
- Uso de comandos como `whoami`, `pwd`, `date`, `uptime`, `tput` y `tput setaf`.


## Parte 1: Personalización Básica
+ Modifica tu prompt para que muestre el nombre de usuario, el nombre de la \
  máquina y el directorio de trabajo actual.
+ Colorea el prompt utilizando secuencias de escape ANSI.
  - El nombre de usuario en azul.
  - El hostname en verde.
  - El directorio de trabajo en amarillo.

Ejemplo de prompt esperado:

```
[usuario@maquina:/home/usuario]$
```

(Donde "usuario" está en azul, "maquina" en verde y "/home/usuario" en amarillo).

## Parte 2: Información Adicional

+ Añade la fecha y la hora en el prompt con el formato `DD/MM/YYYY HH:MM:SS`.
+ Muestra un símbolo especial (✅ o ❌) según si el último comando fue exitoso (`$?`).
  - ✅ si el código de salida fue `0`.
  - ❌ si el código de salida fue distinto de `0`.

Ejemplo:

```
[usuario@maquina:/home/usuario - 10/02/2025 14:35:20 ✅]$
```


## Parte 3: Personalización Avanzada

+ Muestra en el prompt el tiempo que el sistema lleva encendido (`uptime`).
+ Si el usuario es root, muestra el prompt en rojo y con `#` en lugar de `$`.
+ Usa `tput` para establecer el color del fondo del terminal según el usuario.
  - Fondo azul para usuarios normales.
  - Fondo rojo para root.


## Parte 4: Validación y Reflexión

+ Guarda el prompt personalizado en `~/.bashrc` para que persista en nuevas sesiones.
+ Explica en un comentario dentro del archivo cada parte del código.
+ Responde a las siguientes preguntas:
  - ¿Cómo se aplican los cambios en el prompt sin cerrar la terminal?
  - ¿Por qué el prompt cambia cuando usamos `su` para convertirnos en root?
  - ¿Cómo se puede restaurar el prompt original si algo sale mal?


## Entrega

Cada alumno debe entregar su archivo `~/.bashrc` modificado y una captura de pantalla de su terminal con el prompt en funcionamiento.


