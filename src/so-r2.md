---
title : Sistemas Operativos Monopuesto
subtitle : Recuperación de la segunda evaluación. Usuarios, grupos, permisos y SSH
toc : true
logo : true
---

# Máquina virtual

Vamos a emplear una máquina virtual llamada `Recu2`

/// nota
Recuerda que los nombres de usuario y de grupo deben ser escritos en minúscula en todo el ejercicio
///

# Usuarios

En esta práctica vamos a crear los usuarios del sistema:

- Alberto
- Beatriz
- Carlos

# Grupos

Debemos crear los grupos del sistema:

- Empresa : A este grupo solo pertence Beatriz
- Ventas : Pertencen a este grupo: Alberto y Beatriz
- Compras : Pertenecen a este grupo: Beatriz y Carlos

# Directorios

Vamos a crear el siguiente árbol de directorios:

```
/home/empresa
/home/empresa/productos
/home/empresa/clientes
```

# Permisos

Los permisos de los directorios serán los siguientes:

<table>
<tr><th>Directorio</th><th>Propietario</th><th>Grupo</th><th>Permisos</th></tr>
<tr><td>/home/empresa</td><td>Beatriz</td><td>Beatriz</td><td>`rwxrwxr-x`</td></tr>
<tr><td>/home/empresa/productos</td><td>Beatriz</td><td>Ventas</td><td>`rwxrwx---`</td></tr>
<tr><td>/home/empresa/clientes</td><td>Beatriz</td><td>Compras</td><td>`rwxrwx---`</td></tr>
</table>

# Acceso SSH

## Acceso como Carlos

Accede al sistema como el usuario Carlos con SSH:

```
$ ssh carlos@ip_del_ordenador
```

- Crea el fichero vacío `/home/empresa/clientes/registro.txt`

## Acceso como Beatriz

Accedemos al sistema como usuario SSH mediante el comando:

```
$ ssh beatriz@ip_del_ordenador
```

- Crea el archivo vacío `/home/empresa/productos/listado.txt`
- Duplica (copia) el archivo del punto anterior al directorio `/home/empresa/clientes`


# Evaluación

- [ ] Comprobar que se han creado los directorios que pide el enunciado con los propietarios y permisos adecuados:

```
$ tree -pug /home/empresa
```

- [ ] Demostrar que se han creado los usuarios con:

```
$ tail -n 3 /etc/passwd
```

- [ ] Demostrar los grupos a los que pertenece Beatriz

```
$ sudo groups beatriz
```


/// nota
Para aprobar es necesario hacer los tres checks anteriores
///
