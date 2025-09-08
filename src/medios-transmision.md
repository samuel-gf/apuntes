---
title : Medios de transmisión
toc : true
logo : true
---



# Introducción
Los medios de transmisión en redes de comunicaciones son los canales a través de los cuales viajan los datos de un dispositivo a otro. Estos medios se dividen en dos tipos principales: **medios guiados**, que transmiten datos a través de un conductor físico, y **medios no guiados**, que utilizan ondas electromagnéticas en el aire.


# Medios Guiados

## Cable de Par Trenzado (UTP/STP)

Contienen en su interior parejas de hilos de cobre. Están trenzados o unidos de dos en dos dentro del cable. Hay **tres tipos de cables**:

- UTP : Cable de par trenzado no apantallado, común en redes de área local (LAN).
- STP : Par trenzado apantallado, ideal para entornos con interferencias electromagnéticas. Cada
  par de hilos tienen su propio apantallamiento.
- FTP : Tiene un apantallamiento global que abarca todos los pares de hilos.

Cada uno de estos tiene sus propias *ventajas* e *inconvenientes*. Mientras que los *UTP* son cables más flexibles, su manejo
es más sencillo. Los cables *STP* y los *FTP* presentan un mejor aislamiento de las interferencias electromagnéticas pero a cambio
son menos flexibles y por lo tanto es más difícil trabajar con ellos.

.---.

Para cada cable existen dos conectores: *macho* y *hembra*. El *macho* es el que se utiliza en los cables y el *hembra* el que se
encastra en las paredes o en las canaletas.

Se pueden catalogar en **dos tipos**:

- Por categorías : Indican las características eléctricas que tienen los cables (atenuación, impedancia, capacidad de transmisión, etc).
  El cable de *categoría 1* se emplea en telefonía, solo es capaz de transmitir voz. Para redes de datos se emplean *categoría 5* o *6*.
  El mejor cable para datos es el de *categoría 8*. Los cables de *cateogría 5e, 6a* y *7a* con como las cateogrías que indican su número
  pero con algunas mejoras añadidas.
- Por clases : Indican las *distancias* que pueden cubrir dichos cables. Pueden ser *clase A, clase B, clase C, clase D, clase E* o *clase F*.

## Cable Coaxial

- Compuesto de un conductor central, aislamiento, pantalla metálica y una cubierta externa.
- Es más resistente a interferencias, y se usaba para redes Ethernet en el pasado.

## Fibra Óptica
- Utiliza fibras de vidrio o plástico para transmitir datos como pulsos de luz.
- Ventajas: Mayor velocidad, capacidad y resistencia a interferencias electromagnéticas.
- Tipos: **Monomodo** (para largas distancias) y **Multimodo** (para distancias cortas).

## Herramientas para Trabajar con Cableado y Conectores

- Crimpadora = Utilizada para conectar conectores RJ45 en cables UTP.
- Tester de Cableado = Verifica la continuidad, la conexión correcta y la calidad del cableado.
- Pelacables = Facilita el pelado del aislamiento de cables sin dañar los conductores internos.
- Punzón (o Impact Tool) = Inserta cables en paneles de parcheo o tomas con bloques tipo 110.




# Conexión de Tomas y Paneles de Parcheo

## Tomas de Red
- **Tomas de Pared**: Permiten conectar dispositivos a la red a través de un punto de acceso físico.
- **Conexión RJ45**: Es el conector estándar para cables Ethernet, que se utiliza en tomas de red y dispositivos de red.

## Paneles de Parcheo
- **Paneles de Parcheo**: Centralizan el cableado en un solo lugar y permiten una fácil organización de las conexiones.
- **Función**: Facilitan la gestión y organización de conexiones en un rack o bastidor de red.

## Recomendaciones para la Conexión
- Etiquetar los cables y las conexiones para facilitar el mantenimiento.
- Mantener los cables bien organizados y amarrados para evitar enredos.
- Evitar ángulos de 90 grados en cables de par trenzado para no dañar la transmisión de la señal.




# Recomendaciones en la Instalación del Cableado

- Planificación : Identificar puntos de conexión necesarios y diseñar una ruta lógica y ordenada.
- Separación de Cableado : Mantener separados los cables de red de otros cables eléctricos para reducir interferencias.
- Estructura Modular : Usar paneles de parcheo y canaletas para una estructura más limpia y ordenada.
- Longitud : No exceder la longitud recomendada para cables Ethernet (100 metros para Cat 5e o Cat 6).
- Organización : Mantener los cables organizados y bien identificados con etiquetas.


# Medios de Transmisión No Guiados

## Tipos de Medios No Guiados

### Microondas Terrestres

- Se utilizan en redes de larga distancia, como redes de área metropolitana (MAN).
- Requieren líneas de visión directa entre las antenas de transmisión y recepción.

### Microondas Satelitales

- Los datos se transmiten a través de un satélite que refleja la señal entre dos puntos distantes.
- Común en redes globales y transmisión de datos a lugares remotos.

### Wi-Fi (Redes Inalámbricas)

- Usa ondas de radiofrecuencia en el espectro de 2,4 GHz y 5 GHz para redes locales.
- Ideal para conexiones dentro de un mismo edificio sin necesidad de cables físicos.

### Bluetooth

- Tecnología de radiofrecuencia de corto alcance (hasta 10 metros aproximadamente).
- Utilizado para comunicación entre dispositivos personales, como auriculares, teclados y móviles.

## Ventajas y Desventajas de los Medios No Guiados

### Ventajas

- Movilidad y facilidad de instalación.
- No requieren infraestructura física extensa.

### Desventajas

- Sujeto a interferencias por obstáculos físicos y otros dispositivos.
- Menor seguridad en comparación con los medios guiados, debido a la propagación de señales en el aire.


