---
title : Teoría de usuarios y grupos
toc : true
logo : true
---

# Configuración del sistema

## Comandos para obtener información sobre el sistema

- lsblk : Obtenemos información sobre los dispositivos por bloques
- df -h : Información sobre el espacio ocupado en el sistema
- fdisk : Formateo del sistema (peligroso)
- free -h : Información sobre la memoria RAM en uso
- cat /proc/meminfo : Información sobre la memoria RAM en uso
- less /proc/cpuinfo : Información sobre los microprocesadores del sistema

## Usuarios

### Tipos

Hay tres tipos de usuarios:

- Superusuarios root
- Servicios
- Comunes

## Gestionar usuarios y grupos

- Añadir usuario : `$ adduser usuario`
- Obtener información sobre un usuario : `$ id usuario`
- Crear un grupo : `$ addgroup grupo`
- Agregar usuario a un grupo : `$ usermod -a -G grupo usuario` 
- Asignar un propietario a un archivo o carpeta : `sudo chown usuario archivo`
- Asignar un grupo a un archivo o carpeta : `$ sudo chgrp grupo archivo`
- Bloquear usuario del sistema : `$ usermod -L usuario`
- Desbloquear usuario del sistema : `$ usermod -U usuario`
- Borrar usuario del sistema : `$ deluser usuario`

.---1---.

# Shell

El comando `echo «expresión»` permite mostrar en pantalla el valor de «expresión».

Siempre que se pulsa *enter* en el *shell* se realizá una serie de procesos que son:



## Expansión

El *shell* sustituye *expresiones regulares* para resolver el comando:

#### Primera prueba

```
$ echo Esta es una prueba
```

Cualquier argumento pasado a `echo` será mostrado en pantalla.


```
$ cd ~
$ echo *
```

¿Qué ha pasado? El *shell* ha expandido todos los posibles valores.


```
$ mkdir Alberto
$ mkdir Arturo
$ ls A«tabulador»
$ ls A*
$ rmdir A*
```

Empleemos ahora una *expresión regular*


```
$ echo [[:upper:]]*
```

y si vamos más allá de nuestro directorio de usuario ($HOME) encontramos:


```
$ echo /usr/*/share
```

### Expansión de archivos ocultos

Ya sabemos que podemos mostrar todos los direcorios con `echo *` pero ahora podemos ver los archivos ocultos con:


```
$ echo .*
```

Podemos emplear *expresiones regulares* más complejas como:


```
$ mkdir Alberto
$ mkdir Alba
$ mkdir Arturo
$ echo A*
$ echo A[^l]&#42;
```

Este patrón muestra todos los archivos y directorios que comienzan por *A* mayúscula pero que no continuan a continuación con la letra *l*.

### Expansión Tilde ~ 

Recordemos que el símbolo tilde ~ (Virgulilla en español) se expande como el directorio de usuario `/home/alumno`.

### Expansión aritmética

```
echo $((2 + 2))
```

Se permiten las operaciones: +, -, *, /, %, &#42;&#42;

Calcula estas operaciones:

- Suma el número dos un total de siete veces
- Resta 931 menos 123
- Calcula cuatro elevado a 2

### Expansión de llaves


```
$ echo {A,B,C}
$ echo Mart{a,ín,e,ínez}
$ echo Número {1..10}
$ echo Número{1..10}
$ echo {01..05}
$ echo {a..z}
$ echo a{A{1,2},B{3,4}}b
```

Ahora supongamos que un fotógrafo ha recopilado una 

```
$ mkdir infomes-mensuales
$ cd informes-mensuales
$ touch {2020..2025}-{01..12}.txt
$ ls
```

- ¿Cómo borramos ahora el directorio *informes-mensuales*?
- ¿Cómo creamos un directorio por cada mes para todos los años comprendidos entre 2020 y 2025?

### Expansión de variables de entorno

Existen variables de entorno que contienen valores del sistema:


```
$ echo $USER
$ echo $HOME
```

Podemos ver una lista de todas las variables de entorno con la orden:


```
$ printenv | less
```

Como habrás comprobado, en caso de no escribir correctamente el patrón, el *shell* no puede realizar la sustitución:


```
$ echo $SUER
```

### Sustitución de comandos


```
$ echo $(ls)
```

## Dobles comillas

- Todos los patrones que se escriban dentro de dobles comillas " perderán su significado (con la excepción de $, \ y &#96;
- Por ejemplo, el carácter espacio perderá su significado


```
$ ls -l dos palabras.txt
$ ls -l "dos palabras.txt"
```

Recuerda que el carácter $ no pierde su función de patrón dentro de las dobles comillas:


```
$ echo "$USER $((2+2)) $(cal)"
```


## Compillas simples

Las comillas simples ' suprimen todas las expansiones sin excepciones.


```
$ echo '$USER $((2+2)) $(cal)'
```


## Escapar un carácter


```
$ echo $USER \$USER
```

## Carácteres de control


```
$ echo -e "Hola"
$ echo -e "\t Hola"
```


