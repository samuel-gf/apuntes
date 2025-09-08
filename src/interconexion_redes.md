---
title : Interconexión de redes locales</h1>
toc : true
logo : true
---



# Adaptadores para red cableada


<figure>
<img src="img/tarjeta-red.webp" alt="Tarjeta de red">
<figcaption>Tarjeta de red</figcaption>
</figure>

- Los adaptadores de red, también conocidos como tarjetas de red o NIC (network interface card) son los 
  responsables de enviar y recibir datos a través de la red.
- La tarjeta de red pertenece al nivel físico del modelo *OSI*

## Componentes de una tarjeta de red

- Indicadores de actividad o leds : son luces que lleva la tarjeta. Indican si la tarjeta está funcionando 
correctamente.
  El significado de cada luz depende de las indicaciones del fabricante.
- Conexión para cable de red : Sirve para conectar el cable de red al ordenador. Hay tarjetas que además incluyen un 
puerto 
  para cable coaxial, una antena o múltiple puertos.
- Conexión de la placa base :  Son pines (o conectores) que sirven para unir la tarjeta a la placa base.

Cada tarjeta de red tiene un indicador único llamado <mark>dirección física</mark> (o <i>MAC</i>). Está formada por 
48 bits.
	Por ejemplo: 00:1B:41:9F:1A:07.

Es frecuente que la tarjeta de red sea inhálambrica.

<!-- ------------------------------------------------------>

## Instalación y configuración del adaptador de red

Como la mayoría de los equipos traen el adaptador de red integrado en la placa base los controladores suelen funcionar
mediante el método <i>plug and play</i> por lo que no requieren instalación ninguna.

En el caso de una tarjeta que se conecta a la placa base suele ser suficiente con esperar a que el sistema operativo
la detecte y la configure de manera automática.

<!-- ------------------------------------------------------>
## Investiga sobre adaptadores de red

+ Investiga que tarjeta de red tiene el ordenador que estás empleando: Fabricante, modelo, pasos para ver la 
configuración.
+ Obten la MAC de tu adaptador de red.
+ Averigua lo que debes escribir en el terminal para obtener la información sobre tu tarjeta de red.
+ ¿Cuál es tu número de *IP*?
+ Averigua si dos equipos pueden tener la misma dirección *MAC* o la misma *IP*. Razona las respuestas.

<!-- ------------------------------------------------------>
# Dispositivos de interconexión de redes

## Repetidor, concentrador o hub

Se encargan de regenerar la señal. Todas las señales pierden intensidad a medida que viajan por el medio (atenuación)
por lo que volver a dotar a la señal de intensidad le permite alcanzar mayores distancias e impedir que las señal 
llegue
deteriorada. Cuando un repetidor recibe una trama se limita a repetirla.

### Funcionamiento del repetidor

- Operan a nivel física (nivel 1 de OSI).
- Son apilables o escalables, pero no se recomienda conectar más de dos seguidos.
- Son rápidos pero no pueden hacer nada con el contenido de la tarma.
- No necesitan un configuración especial.
- Algunos pueden conectar distintos medios, por ejemplo de Ethernet a Coaxial.

### Tipos de repetidores

Activo : Regeneran la señal. Necesitan corriente eléctrica.
Pasivo : No regeneran la señal, solo interconectan dispositivos. No necesitan corriente eléctrica.


## Conmutador o switch

Reparte el ancho de banda del canal entre todos los equipos que forman la red. También se utiliza cuando
queremos dar acceso a Internet a varios equipos.

Los routers tienen pocos puertos así que las solución para dar acceso a Internet a varios
equipos consiste en conectar a uno de los puertos del router el switch y, posteriormente,
conectar al switch todos los equipos que deseemos.

Su **funcionamiento** se base en redireccionar cada trama que recibe por el puerto adecuado.


<figure>
<img src="img/switch.webp" alt="Switch">
<figcaption>Switch</figcaption>
</figure>

### Características de un switch

- Pertenecen al nivel de enlace (capa 2 OSI).
- Son siempre locales.
- Existen variedades con diferente número de puertos.
- Pueden repartir el ancho de banda, lo que significa que cuantos más equipos conectemos más despacio funcionará la 
red.
- Son fácilmente escalables, podemos ampliar la red de manera muy sencilla, pero no es adecuado conectar demasiados en 
cascada.
- Algunos se pueden conectar a buses de alta velocidad.
- PoE (Power over Ethernet): Algunos switches pueden alimentar dispositivos como cámaras IP mediante el mismo cable de 
red.

### ¿Cómo funciona un switch?

- El switch utiliza direcciones MAC (Media Access Control) para identificar los dispositivos conectados.
- Al recibir un paquete de datos, el switch mira la dirección MAC de destino y lo \ 
  envía solo al puerto correspondiente, evitando colisiones en la red y optimizando el tráfico.

Ejemplo : Si el ordenador A quiere enviar datos al ordenador B, el switch solo enviará los datos al puerto 
    donde esté conectado el ordenador B, en lugar de enviar la información a todos los dispositivos.


### Switch vs hub

- Un hub envía los datos a todos los dispositivos conectados, generando más tráfico y posibles colisiones.
- Un switch envía los datos solo al dispositivo de destino, mejorando el rendimiento de la red.

Conclusión :: Los switches son más eficientes que los hubs y son el estándar en redes modernas.


Tienen los mismos parámetros de red que un nodo cualquiera. Es decir, número de IP, máscara de red, puerta de 
enlace, etc. Para
conectar un equipo a un switch, se utiliza un *cable directo*. Para conectar dos switches entre sí se emplea
un *cable cruzado*.

### Tipos de switches


+ **Switch no gestionable**
  - No se pueden configurar</li>
  - Simples y fáciles de usar</li>
  - Ideales para redes pequeñas</li>
+ **Switch gestionable**
  - Se pueden configurar para mejorar la seguridad y el rendimiento (por ejemplo, VLANs).</li>
  - Se utilizan en redes más grandes y complejas.</li>

### VLAN y su importancia

Una VLAN permite dividir una red física en varias redes lógicas, mejorando la seguridad y segmentación.

Ejemplo :: Una empresa puede separar la red de administración y la de empleados mediante VLANs,
asegurando que no todos los empleados tengan acceso a recursos críticos.



### Preguntas de repaso sobre switch

<section class="actividades">
**Actividades**

+ ¿Cuál es la diferencia entre un switch y un hub?
+ ¿Qué función tiene la dirección MAC en un switch?
+ ¿Qué ventajas ofrece un switch gestionable frente a uno no gestionable?
+ ¿Para qué sirve una VLAN?
+ Investiga sobre switches: gestionables vs. no gestionables. ¿Cuáles son las principales diferencias y en qué casos 
se utiliza cada uno?
+ Investiga sobre protocolos de red para switches (por ejemplo, STP – Spanning Tree Protocol). ¿Qué es y por qué 
es importante?

</section>



<!-- ------------------------------------------------------>
## VLAN

Una VLAN (Virtual Local Area Network) es una tecnología que permite segmentar una red física en varias redes 
lógicas. 
Con VLANs, varios dispositivos que están físicamente en la misma red (conectados al mismo switch) pueden actuar como 
si estuvieran en redes separadas.

<figure>
<img src="svg/VLAN.svg" alt="Esquema VLAN">
<figcaption>Esquema VLAN</figcaption>
</figure>

Ejemplo :: En una empresa, puedes crear una VLAN para el departamento de 
    administración y otra para los empleados, aunque ambos estén conectados al mismo switch. Así, los datos entre
    ambas VLANs no se cruzan a menos que un router lo permita.

### ¿Por qué usar VLANs?

- Seguridad : Los dispositivos de una VLAN no pueden comunicarse con dispositivos en otra VLAN a menos que se configure 
un enrutamiento entre ellas.
- Segmentación : Se pueden separar diferentes tipos de tráfico (como el de voz y el de datos).
- Eficiencia : Reduce el tráfico en la red, ya que solo los dispositivos dentro de una VLAN reciben los datos 
relevantes.
- Flexibilidad : No es necesario reorganizar físicamente los dispositivos para cambiar su pertenencia a una red. Basta 
con modificar la configuración del switch.

### Tipos de VLAN

- VLAN de datos : Para separar diferentes tipos de tráfico de datos. Por ejemplo VLAN para usuarios de oficina, otra 
VLAN para desarrollo.
- VLAN de voz : Reservada para el tráfico de voz, por ejemplo, de teléfonos IP
- VLAN nativa : Utilizada por el switch para etiquetar tráfico no asignado a ninguna VLAN específica.
- VLAN de gestión : Para acceder a la configuración del switch de forma segura.


### Funcionamiento de una VLAN

Un switch con soporte para VLAN etiqueta los paquetes con un identificador VLAN (ID VLAN). Esta etiqueta indica 
a qué VLAN pertenece el paquete. Los dispositivos que no están en la misma VLAN no recibirán ese tráfico.

- Trunk = Es un enlace entre switches que permite el paso de tráfico de varias VLANs. 
- Los trunks etiquetan los paquetes para que el otro switch sepa a qué VLAN pertenecen.


<!-- ------------------------------------------------------>





## Encaminador o router

- Dispositivo encargado de decidir la ruta más adecuada para entregar un paquete.
- Opera a nivel 3 (nivel de red).

### Funcionamiento de un router

- Proporciona acceso a Internet.
- Funciona con medios guiados o no no guiados.
- Cuando a un router le llega un paquete mira en su tabla de rutas si lo puede enviar a su destino. 
  Si lo tiene lo envía y si no, se lo envía a otro router para que lo resuelva.

### Características de un router


- Tiene bastante inteligencia como para decidir el mejor camino para que el paquete llegue al destino.
- Manejan diferentes protocolos.
- Pueden realizar filtrado.
  - Lista blanca
  - Lista negra
- Disminuye la congestión de la red
- Su rendimiento es inferior al de los switch.


### Tipos de routers

+ Según su **ubicación en la red**
  - Router de frontera : Conectan interior con exterior.
  - Router de interior : Dentro de la red local, conecta segmentos.
  - Router exterior : fuera de la red local, en Internet.
+ Según el **algoritmo de encaminamiento**
  - Encaminamiento estático : Su tabla de encaminamiento está programada por el administrador de red.
  - Encaminamiento dinámico : El router va aprendiendo las rutas a base de hacer pruebas.



### Tabla de encaminamiento de router

<table class="tabla-de-verdad">
<tr><th>Red destino</th><th>Máscara de red</th><th>Gateway</th><th>Interfaz</th><th>Métrica</th></tr>
<tr><td>10.10.20.0</td><td>255.255.255.224</td><td>10.1.2.3  </td><td>LAN1</td><td>1 </td></tr>
<tr><td>10.10.30.0</td><td>255.255.255.128</td><td>10.1.2.4  </td><td>LAN2</td><td>1 </td></tr>
<tr><td>10.1.2.0  </td><td>255.255.255.224</td><td>0.0.0.0   </td><td>WAN </td><td>2 </td></tr>
<tr><td>10.1.2.160</td><td>255.255.255.224</td><td>0.0.0.0   </td><td>WAN </td><td>2 </td></tr>
<tr><td>0.0.0.0    </td><td>0.0.0.0       </td><td>10.1.2.5  </td><td>WAN </td><td>10</td></tr>
</table>

<b>Preguntas:</b>

- ¿A qué IP será entregado un paquete con destino 10.10.20.36?
- ¿A que IP será entregado un paquete con destino 10.10.20.9?
- ¿A que IP será entregado un paquete con destino 10.1.2.3?
- ¿A que IP será entregado un paquete con destino 10.10.30.126?



### Actividades sobre router


/// actividades 

+ Investiga los principales fabricantes de routers. Cita al menos 3 marcas populares y dos modelos de cada uno.  
   DETALLA: Velocidad, precio y número de puertos ethernet.
+ Investiga como enruta mediante una <i>tabla de encaminamiento</i> (busca al menos un ejemplo de tabla).
+ Investiga sobre vulnerabilidades en el router de casa: Ataques de fuerza bruta, firmware desactualizado. Sugiere 
medidas de seguridad.
+ Firewall (cortafuegos) Investiga que es y si un router puede actuar como cortafuegos. También investiga sobre las 
reglas que permiten filtrar paquetes.

<p>!!Dada la tabla de enrutamiento:!!</p>


<table class="tabla-de-verdad">
<tr><th>Red destino</th><th>Máscara de red</th><th>Gateway</th><th>Interfaz</th><th>Métrica</th></tr>
<tr><td>192.168.10.0</td><td>255.255.255.128/25</td><td>192.168.10.1</td><td>eth0</td><td>2</td></tr>
<tr><td>192.168.20.0</td><td>255.255.255.192/26</td><td>192.168.20.1</td><td>eth1</td><td>2</td></tr>
<tr><td>10.10.0.0</td><td>255.255.240.0/20</td><td>10.10.0.1</td><td>eth2</td><td>3</td></tr>
<tr><td>172.16.0.0</td><td>255.255.248.0/21</td><td>172.16.0.1</td><td>eth3</td><td>3</td></tr>
<tr><td>192.168.1.0</td><td>255.255.255.0/24</td><td>192.168.1.1</td><td>eth4</td><td>3</td></tr>
<tr><td>0.0.0.0</td><td>	0.0.0.0/0</td><td>10.0.0.254</td><td>wan</td><td>10</td></tr>
</table>



+  ¿A qué interfaz se enviará el paquete destinado a la IP 192.168.10.64?
+  ¿Qué gateway se usará para enviar un paquete con destino a la IP 192.168.20.95?
+  Si se desea enviar un paquete con la dirección IP 10.10.15.200, ¿a qué interfaz se enviará?
+  ¿A dónde se enviará un paquete destinado a la IP 172.16.3.255?
+  Si un paquete tiene como destino la IP 192.168.1.150, ¿qué interfaz será utilizada?
+  ¿Qué interfaz o gateway se usará para enviar un paquete a la IP 192.168.10.129?
+  ¿Cuál es la ruta para un paquete con destino a la IP 10.0.5.5?
+  Si un paquete está destinado a la dirección IP 192.168.30.25, ¿qué ocurrirá con el paquete?
+  ¿A qué interfaz se enviará un paquete con destino a la IP 172.16.7.10?
10. ¿Qué gateway o interfaz se usará para un paquete cuyo destino es 11.11.11.11?

///


<!-- ------------------------------------------------------>




## Puente o bridge

- Un !!bridge o puente!! es un dispositivo de capa 2 del modelo OSI que se utiliza para dividir una red de 
  área local (LAN) en segmentos más pequeños. Cada segmento se conecta al bridge, que permite la comunicación entre 
ellos.
- Se usa para reducir el tráfico en una red, mejorando la eficiencia y el rendimiento.
- Un bridge filtra y reenvía el tráfico entre los segmentos de red según la dirección MAC (Media Access Control) de 
cada dispositivo.
- Cuando un paquete llega al bridge, este inspecciona la dirección MAC de destino y decide si reenvi
- segmento correspondiente o descartar el paquete si ya está en el segmento correcto.

### Tabla de direcciones MAC

- Los bridges mantienen una tabla de direcciones MAC que asocia cada dirección MAC con un puerto específico.
- Esta tabla se actualiza constantemente: cuando el bridge recibe un paquete, registra la dirección MAC de origen y el 
puerto desde 
  el se recibió. Esto le permite saber en qué segmento de la red está cada dispositivo y hacer el reenvío de manera 
más eficiente.


### Tipos de bridges

- Bridge Transparente = También conocido como bridge Ethernet, que funciona de manera transparente para los 
dispositivos. 
  Solo reenvía el tráfico entre segmentos de red sin que los dispositivos sepan de su existencia.
- Bridge de Aprendizaje o Autoaprendizaje = Aprende automáticamente las direcciones MAC de los dispositivos conectados 
  y usa esta información para decidir dónde reenviar el tráfico.
- Bridge de Encaminamiento (Routing Bridge) = Utiliza una combinación de funciones de bridge y de router, operan 
  en capas 2 y 3 del modelo OSI para reenviar paquetes entre diferentes segmentos o subredes.

### Ventajas de los puentes

- Reducción de Colisiones : Al dividir la red en segmentos, los bridges ayudan a reducir el dominio de colisión, 
mejorando la eficiencia.
- Aumento de la Seguridad : Los bridges pueden filtrar tráfico, permitiendo o bloqueando ciertos paquetes según la 
dirección MAC.
- Escalabilidad : Facilita la expansión de la red, permitiendo añadir más segmentos sin congestionar el tráfico.

### Diferencias con otros dispositivos de red

- A diferencia de los switches, que también trabajan en la capa 2 y realizan funciones similares, los bridges son 
menos eficientes en  
  redes más grandes, ya que suelen procesar el tráfico más lentamente.
- A diferencia de los routers, que operan en la capa 3 y encaminan paquetes basados en direcciones IP, los bridges solo 
se ocupan 
  de direcciones MAC y no pueden conectar redes con distintas subredes IP.

### Ejemplos prácticos y usos en redes locales


- En redes LAN pequeñas, los bridges se usan para dividir la red y evitar congestión.
- También se usan en entornos donde se quiere conectar redes de diferentes velocidades (por ejemplo, 10 Mbps 
  con 100 Mbps) sin un cambio importante en la infraestructura.



## Dispositivos PoE

## Diferencias entre trama y paquete

### Trama (frame)

- Se refiere a la unidad de datos en la Capa de Enlace de Datos (Capa 2 del modelo OSI).
- Las tramas son la forma en que los datos se encapsulan para ser transmitidos a través de un medio físico (por 
ejemplo, cables Ethernet o Wi-Fi).
- Las tramas incluyen encabezados que contienen direcciones MAC (la dirección física de los dispositivos), así como 
información de control de errores.
- Ejemplos: Tramas Ethernet, Tramas 802.11 (Wi-Fi).


### Paquete (packet)

- Se refiere a la unidad de datos en la Capa de Red (Capa 3 del modelo OSI).
- Los paquetes contienen direcciones IP (Internet Protocol) que permiten que los datos se enruten a través de 
diferentes redes hasta llegar al destino final.
- Un paquete puede estar contenido dentro de una trama. Por ejemplo, en una red Ethernet, el paquete IP se encapsula 
dentro de una trama Ethernet.
- Ejemplos: Paquetes IP (IPv4 o IPv6).



<!-- ------------------------------------------------------>
# Adaptadores para redes inalábricas

Es un dispositivo de hardware que permite a los equipos conectarse a redes inalámbricas. 
La tarjeta de red WiFi convierte los datos digitales de la computadora en señales de radio que son enviadas y 
recibidas por un router o punto de acceso.

## Tarjeta de red wifi

- Internas = Suelen estar integradas en la placa base (especialmente en laptops), o conectadas en un puerto PCI/PCIe  
  en desktops. Son ideales porque quedan protegidas dentro del equipo y suelen tener mejor rendimiento.
- Externas = Se conectan a través de puertos USB. Aunque no son tan rápidas como las internas, ofrecen flexibilidad  
  y facilidad de instalación y son una solución popular para equipos sin WiFi integrado.

## Normas wifi y su evolución

Las tarjetas de red WiFi suelen funcionar bajo las normas 802.11 establecidas por el IEEE, que se 
han actualizado con los años para mejorar velocidad, alcance y eficiencia:

- 802.11b = hasta 11 Mbps, primera norma ampliamente usada.
- 802.11g = hasta 54 Mbps.
- 802.11n = hasta 600 Mbps, usa bandas de 2.4 GHz y 5 GHz.
- 802.11ac = hasta 1 Gbps y usa principalmente 5 GHz.
- 802.11ax (WiFi 6) = mejora la capacidad de dispositivos conectados y optimiza la velocidad en entornos densamente 
poblados.

## Funcionalidades clave de wifi

- Doble banda : Permiten trabajar en dos frecuencias (2.4 GHz y 5 GHz), evitando congestión en redes y optimizando 
velocidad y alcance.
- MIMO (Multiple Input, Multiple Output) : Permite la transmisión simultánea de datos por varias antenas, mejorando 
la velocidad y cobertura.
- Compatibilidad con WPS (WiFi Protected Setup) : Facilita la conexión segura con el router sin necesidad de 
introducir contraseñas largas.

## Seguridad en wifi

Las tarjetas WiFi deben ser compatibles con protocolos de seguridad para proteger la red y los datos:

- WEP (Wired Equivalent Privacy) : Antiguo y menos seguro.
- WPA (WiFi Protected Access) y WPA2 : Más seguros que WEP.
- WPA3 : Último estándar de seguridad WiFi, ofrece una protección mejorada contra ataques y encriptación de última 
generación.

## Actividades wifi

<p>!!Diseña las siguientes redes en función de cada caso:!!</p>

### Caso 1: Oficina pequeña con varios dispositivos conectados

Una pequeña empresa tiene una oficina donde trabajan 10 empleados. Cada empleado tiene un 
PC de escritorio sin tarjeta WiFi y deben conectarse de manera inalámbrica al router de la oficina. La oficina 
necesita una conexión estable, con buena cobertura en una zona de 50 metros cuadrados, ya que no hay 
puntos de acceso adicionales.


/// actividades

+ Diseña la red.
+ ¿Qué velocidad y estándar WiFi debería tener la tarjeta para cubrir las necesidades de todos los empleados?
+ ¿Es mejor una tarjeta interna o externa para este caso?
+ ¿Qué aspectos de seguridad deben considerar al elegir la tarjeta?
+ Prepara un presupuesto para esta red.

///

### Caso 2: Usuario de gaming en casa

Un gamer quiere mejorar la velocidad y estabilidad de su conexión 
a Internet en casa. Juega principalmente en un PC de sobremesa que está ubicada en la planta superior de 
su casa, a unos 15 metros del router, con varias paredes de por medio. La casa tiene 
varios dispositivos conectados a la red (smart TV, smartphones, etc.), y el usuario también suele transmitir en 
plataformas en vivo.


/// actividades

+ Diseña la red.
+ ¿Qué características especiales debe buscar el usuario en una tarjeta WiFi para gaming?
+ ¿Es necesario que la tarjeta tenga soporte para doble banda o incluso WiFi 6?
+ ¿Sería conveniente usar una tarjeta con antenas externas para mejorar la recepción?
+ Prepara un presupuesto para esta red.

///

### Caso 3: Espacio de coworking con alta densidad de dispositivos

Un espacio de coworking tiene capacidad para 10 personas, cada una con al menos dos dispositivos conectados. El 
lugar ya cuenta con puntos de acceso WiFi en cada esquina del espacio, pero un usuario necesita una tarjeta 
WiFi para su laptop que le permita conectarse de forma eficiente y sin interferencias, especialmente en las horas de 
mayor tráfico.

/// actividades

+ Diseña la red.
+ ¿Qué norma WiFi sería más adecuada para minimizar interferencias y optimizar el rendimiento en un entorno de alta 
densidad?
+ ¿Qué papel juega la tecnología MIMO en este caso y cómo ayuda a mejorar la conectividad?
+ ¿Debería priorizar una tarjeta compatible con WPA3 por cuestiones de seguridad en un lugar con muchos dispositivos?
+ Prepara un presupuesto para esta red.

///

# Recursos

<p><a href="https://www.netacad.com/es/courses/getting-started-cisco-packet-tracer?courseLang=es-XL">Packet 
Tracer</a></p>

