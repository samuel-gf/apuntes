---
title : DIG
toc : true
logo : true
---



DIG (Domain Information Groper) Es una herramienta de línea de comandos utilizada para consultar servidores DNS y 
obtener información sobre nombres de dominio, como direcciones 
IP, registros MX, registros NS, entre otros. Aquí te dejo un tutorial básico para usar dig:



<!-- ------------------------------------------------------>
# Instalación

dig suele venir preinstalado en la mayoría de distribuciones de Linux. Sin embargo, si no lo tienes instalado, puedes instalarlo fácilmente:

```
$ sudo apt-get install dnsutils
```

Una vez instalada podemos comprobar que todo está correcto con el comando:


```
dig -v
```


# Consulta básica

Para realizar una consulta básica de un dominio, simplemente usa el siguiente comando:

```
dig [Servidor] [Nombre] [Tipo]
```

Donde:

- Servidor = es la dirección IP o el hostname a consultar. Si el argumento del servidor es  
  el hostname, dig resuelve el hostname antes de continuar con la consulta. Esto es opcional y si no proporcionas 
  un argumento de servidor, dig utiliza los nombres de servidores que figuran en `/etc/resolv.conf`
- Nombre =  El nombre del registro que se quiere consultar.
- Tipo =  El tipo de consulta solicitada por dig. Por ejemplo, puede ser un registro A, un registro MX, 
  un registro SOA o cualquier otro tipo. De forma predeterminada, dig realiza una búsqueda de un registro 
  A si no se especifica ningún argumento de tipo.



Un sencillo ejemplo podría ser:

```
dig example.com
```

Esto devuelve información como:

- La dirección IP del dominio (en el campo ANSWER SECTION).
- El servidor DNS que procesó la solicitud (en SERVER).
- El tiempo que tardó la consulta (Query time).

# Consulta de un tipo específico de registro

dig permite consultar diferentes tipos de registros DNS, como:


```
dig example.com A
```


```
dig example.com AAAA
```


```
dig example.com MX
```


```
dig example.com NS
```


```
dig example.com TXT
```

# Consultar un servidor DNS específico

Puedes especificar un servidor DNS diferente al predeterminado con la siguiente sintaxis:


```
dig @8.8.8.8 example.com
```

Esto usará el servidor DNS de Google (8.8.8.8) en lugar del servidor por defecto de tu sistema.

# Consulta inversa (de IP a dominio)

Para obtener el nombre de dominio asociado a una dirección IP, usa una consulta inversa con el registro PTR:


```
dig -x 93.184.216.34
```

Esto devuelve el nombre de dominio asociado a la dirección IP, si está disponible.

# Opciones útiles


- +short : Muestra solo el resultado directo, simplificando la salida.
- +trace :  Muestra paso a paso cómo se resuelve el nombre de dominio, empezando por la raíz DNS.
- +nocmd : Oculta la línea de comando en la salida.
- +noall : No muestra ninguna sección de la consulta excepto las que indiques específicamente.


```
dig example.com +noall +answer
```


# Interpretar la salida de dig

Al realizar una consulta, obtendrás varias secciones. Aquí te explico algunas de las más importantes:

## Header
La sección HEADER en la salida de dig resume los detalles de la consulta y la respuesta DNS. Incluye información sobre el tipo de 
consulta (por ejemplo, consulta estándar), el estado de la respuesta (por ejemplo, NOERROR para una 
respuesta exitosa) y flags que indican atributos clave como la recursión. Además, enumera las cantidades de preguntas, 
respuestas, registros autoritativos y registros adicionales en la respuesta DNS.

## OPT PSEUDOSECTION

La **OPT PSEUDOSECTION** muestra datos avanzados:

- EDNS = Sistema de extensión para DNS, si se utiliza.
- flags = Banderas especificadas. En este caso, está en blanco porque no se especificaron banderas.
- udp = Tamaño del paquete UDP.

## QUESTION SECTION

La **QUESTION SECTION** muestra los datos de la consulta que se envió:

- La primera columna es el nombre de dominio consultado.
- La segunda columna es el tipo de consulta (<b>IN</b> = Internet).
- La tercera columna especifica el registro (<b>A</b> = Dirección), a menos que se indique lo contrario.

## STATISTICS SECTION

La **STATISTICS SECTION** muestra metadatos sobre la consulta:

- Query time = La cantidad de tiempo que tomó recibir una respuesta.
- SERVER = La dirección IP y el puerto del servidor DNS que respondió.
- WHEN = El momento en que se ejecutó el comando.
- MSG SIZE rcv = El tamaño de la respuesta del servidor DNS.

## Resumen

- QUESTION SECTION = Muestra la consulta que estás haciendo (el dominio y tipo de registro).
- ANSWER SECTION = La respuesta a tu consulta, como la dirección IP o el registro solicitado.
- AUTHORITY SECTION = Los servidores DNS responsables de la zona del dominio consultado.
- ADDITIONAL SECTION = Información adicional relacionada con la consulta, como registros A o AAAA de los servidores.

# Ejemplo completo



```
dig example.com
```

Salida (simplificada):


```
; <<>> DiG 9.16.1-Ubuntu <<>> example.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 60183
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; QUESTION SECTION:
;example.com.                  IN      A

;; ANSWER SECTION:
example.com.           232     IN      A       93.184.216.34

;; Query time: 42 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Tue Oct 08 12:34:56 2024
;; MSG SIZE  rcvd: 56

```

En este ejemplo:

- QUESTION SECTION = muestra que has consultado el registro A para example.com.
- ANSWER SECTION = indica que la IP del dominio es 93.184.216.34.
- Query time = indica que la consulta tardó 42 ms.



<!-- ------------------------------------------------->
# Ejercicios


+ Búsqueda de registros A : Aprende a distinguir entre las direcciones IPv4 y IPv6 buscando los 
  registros A (IPv4) y AAAA (IPv6) de los dominios *google.es* y *wikipedia.org*
+ Buscar registros MX (Mail Exchange) : Investiga la IP de los servidores de correo de *gmail.com*, *hotmail.es* y *educa.madrid.org*
+ Buscar registros NS (Name Server) : Investigar las IPs de los servidores *NS* de *yahoo.com* y de *forocoches.com*.
+ Consultar registros SOA (Start of Authority) : Buscar los registros SOA para ver quién es la autoridad principal de un 
  dominio para *example.com*. ¿Qué significa el campo *SOA*?
+ Consulta registros TXT : Busca registros TXT de *yahoo.com* y *forocoches.com*, que suelen contener información 
  sobre configuraciones SPF o verificaciones de dominio. El objetivo es ver cómo se usa el DNS para verificar 
  propiedades de dominio o configurar políticas de correo
+ Pruebas de búsqueda inversa (PTR records) : Realiza bśuqueda inversa para el servidor *8.8.8.8* y para el principal servidor DNS de *Movistar.es*.
+ Usar servidores DNS específicos : Consulta la IPv4 de tres de los dominios anteriores (los tres que quieras) mediante el 
  servidor de nombres de *Google* y el de *Cloudflare*.
+ Medir tiempos de respuesta : Mide el tiempo que tarda un servidor DNS en responder y compararlo entre diferentes servidores DNS usando *grep* de 
  esta manera:


```
dig google.com | grep "Query time"
```

Ahora aplícalo a dos dominios que quieras.

- [Avanzado] Simulación de fallo de DNS : Configurar manualmente un dominio para que apunte a un servidor DNS inexistente y hacer que intenten resolverlo.


