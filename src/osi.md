---
title : Estándar OSI
toc : true
logo : true
---



El modelo OSI es una herramienta conceptual que facilita la comprensión de los distintos procesos que ocurren en la comunicación de redes. 
Aunque no todos los protocolos actuales cumplen exactamente con este modelo, OSI sigue siendo un estándar esencial para el desarrollo y aprendizaje de redes.



# Introducción

El modelo OSI (Open Systems Interconnection) es una referencia creada por la Organización Internacional de Normalización (ISO) para entender y estandarizar las funciones de un sistema de comunicación en una red. Este modelo divide el proceso de comunicación en **siete capas** interdependientes, donde cada una define funciones específicas. Así, permite la interoperabilidad entre diferentes sistemas de redes y equipos.

.---1---.


<figure>
<img src="img/osi-cabeceras.png" alt="Cabeceras de OSI" style="width:75%">
<figcaption>Cabeceras en OSI</figcaption>
</figure>

# Capas del Modelo OSI

## Capa Física
Esta capa se encarga de la transmisión de datos en bruto a través del medio físico de la red (como cables, fibra óptica o radiofrecuencia). Define aspectos técnicos como la señalización, el voltaje, las frecuencias, la modulación y el ancho de banda.

- Ejemplos : Cables Ethernet, conectores RJ45, señal de radio, Bluetooth.

## Capa de Enlace de Datos
Proporciona medios para transferir datos entre dispositivos conectados en una misma red, garantizando la detección y corrección de errores en el nivel de enlace. Se divide en dos subcapas:
- LLC (Logical Link Control) = Maneja el control de flujo y errores.
- MAC (Media Access Control) = Gestiona el acceso al medio y las direcciones físicas (MAC).

- Ejemplos : Switches, protocolos Ethernet y Wi-Fi.

## Capa de Red
Gestiona el direccionamiento lógico y la toma de decisiones para la mejor ruta de los datos a través de la red. Utiliza direcciones IP para identificar dispositivos y permite que los paquetes lleguen a su destino.

- Ejemplos : Routers, protocolo IP, ICMP.

## Capa de Transporte
Garantiza la entrega confiable de datos entre dispositivos, proporcionando mecanismos de control de errores, secuenciación y corrección. Esta capa puede establecer conexiones orientadas o no orientadas (TCP y UDP).

- Ejemplos : Protocolos TCP, UDP.

## Capa de Sesión
Controla las sesiones de comunicación entre dos dispositivos. Permite establecer, mantener y sincronizar interacciones, así como gestionar la recuperación en caso de interrupciones.

- Ejemplos : Protocolo NetBIOS, RPC (Remote Procedure Call).

## Capa de Presentación
Se encarga de la traducción y formateo de datos para que sean interpretables por la capa de aplicación. Aquí se realiza la *codificación*, *cifrado* y *compresión* de los datos.

- Ejemplos : Protocolos de cifrado como SSL/TLS, formatos de datos como JPEG, MPEG, ASCII.

## Capa de Aplicación
Es la capa más cercana al usuario y proporciona interfaces para que las aplicaciones puedan acceder a los servicios de red. Define protocolos para la comunicación directa de aplicaciones y su acceso a recursos de red.

- Ejemplos : HTTP (navegación web), FTP (transferencia de archivos), SMTP (correo electrónico), DNS (resolución de nombres).

.---1---.


<figure>
<img src="img/osi-transferencia.png" alt="Transferencia de paquete de datos en OSI" style="width:75%">
<figcaption>Transferencia de paquetes de datos en OSI</figcaption>
</figure>


# Ejemplos de Comunicación

## Descarga de archivo

Usaremos el protocolo *HTTP*

+ Un usuario solicita un archivo mediante una aplicación en la capa de aplicación (HTTP).
+ Los datos se procesan y se cifran en la capa de presentación (SSL/TLS si es una conexión segura).
+ Se establece la sesión entre el cliente y el servidor.
+ TCP maneja la conexión y transmisión en la capa de transporte.
+ Las direcciones IP en la capa de red identifican los dispositivos en internet.
+ Los switches en la capa de enlace de datos gestionan la transmisión de los datos entre redes locales.
+ Finalmente, los bits se transmiten físicamente a través de cables y routers en la capa física.

## Envio de un correo electrónico

Usaremos el protocolo *SMTP*

+ La aplicación de correo usa SMTP para enviar el mensaje en la capa de aplicación.
+ Los datos son cifrados en la capa de presentación.
+ La sesión SMTP se establece y sincroniza en la capa de sesión.
+ TCP maneja la fiabilidad de la conexión.
+ El mensaje pasa por diferentes routers usando direcciones IP en la capa de red.
+ La capa de enlace de datos controla los errores en cada salto de red.
+ La capa física transfiere los bits.







