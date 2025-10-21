---
title : Servicio de resolución de nombres
subtitle : DNS
toc : true
logo : true
---

![](https://academy.bit2me.com/wp-content/uploads/2019/05/49_DNS.png)

# Introducción

El DNS (Domain Name System) es un sistema que traduce nombres de dominio en direcciones IP.
Permite que los usuarios escriban nombres fáciles de recordar (como `www.google.com`) en lugar de direcciones numéricas (`142.250.184.68`).

## Funcionamiento básico

Cuando un equipo necesita acceder a un dominio (por ejemplo, `www.ejemplo.com`), sigue estos pasos:

+ Consulta local = El sistema operativo revisa su caché local o el archivo `/etc/hosts`.
+ Petición al servidor DNS configurado = Si no encuentra la dirección, pregunta a su servidor DNS (normalmente el del router o proveedor).
+ Resolución recursiva = El servidor DNS puede hacer el trabajo completo de buscar la IP:
  - Pregunta a los servidores raíz (root) qué servidor gestiona el dominio `.com`
  - Luego pregunta al servidor TLD (`.com`) qué servidor gestiona `ejemplo.com`.
  - Finalmente, pregunta al servidor autoritativo de ejemplo.com la IP de www.
+ Respuesta y caché = La dirección IP se devuelve al cliente y se guarda en caché por un tiempo (TTL).


## Estructura de un dominio

Un dominio se organiza de manera jerárquica, de derecha a izquierda:

`www.ejemplo.com`

<table>
<tr><th> Parte     </th><th> Significado                                                                      </th></tr>
<tr><td> `com`     </td><td> **Dominio de nivel superior (TLD)**. Indica tipo o país (.com, .org, .es, .net…) </td></tr>
<tr><td> `ejemplo` </td><td> **Segundo nivel**. Nombre elegido por el propietario                             </td></tr>
<tr><td> `www`     </td><td> **Subdominio**. Opcional; identifica un servicio o máquina dentro del dominio    </td></tr>
</table>

## Tipos de servidores DNS

<table>
<tr><th>Tipo</th><th>Función</th></tr>
<tr><td>**Raíz (root)**</td><td>Contienen información sobre los dominios de nivel superior (.com, .org, .es…)</td></tr>
<tr><td>**TLD (Top Level Domain)**</td><td>Conocen qué servidores gestionan cada dominio concreto dentro de su TLD</td></tr>
<tr><td>**Autoritativo**</td><td>Tiene la información oficial (archivos de zona) de un dominio</td></tr>
<tr><td>**Recursivo o caché**</td><td>Busca la información por el usuario y la almacena temporalmente</td></tr>
</table>


## Tipos de consultas

![Consulta recursiva](img/dns-resolution.png)

### Recursiva

El cliente (por ejemplo, tu sistema operativo o navegador) no consulta a otros servidores, solo al que tiene configurado.
El servidor DNS (si actúa como recursivo) hace lo siguiente:

+ Si tiene la respuesta en caché → la devuelve.
+ Si no la tiene:
  - Pregunta a un servidor raíz quién gestiona .com.
  - Luego pregunta al TLD .com quién gestiona openai.com.
  - Luego pregunta al servidor autoritativo de openai.com por www.
+ Devuelve al cliente la IP final.
+ Guarda la respuesta en caché para futuras consultas.

- Ventaja : el cliente obtiene una respuesta completa.
- Inconveniente : el servidor DNS hace más trabajo y consume más tiempo en la primera resolución.


### Iterativa

En una consulta iterativa, el servidor DNS no busca toda la respuesta:
devuelve la mejor información que conoce, normalmente una referencia a otro servidor que puede saber más.

Es el método que usan los servidores entre sí. Ejemplo:

+ Pregunta al servidor raíz: "¿Cuál es la IP de www.openai.com?"
+ El servidor raíz responde: "No lo sé, pero pregunta a los servidores `.com`"
+ El servidor DNS pregunta al TLD .com: "¿Y tú sabes la IP de www.openai.com?"
+ El TLD responde: "No lo sé, pero los servidores autoritativos de openai.com son estos..."
+ Finalmente, pregunta a uno de los autoritativos de openai.com, que sí responde con la IP.

El proceso es iterativo: cada servidor da un "siguiente paso" hasta llegar a la respuesta final.

- Ventaja : distribuye la carga de trabajo.
- Inconveniente : el cliente o el servidor que inicia la búsqueda debe hacer varias peticiones.



### Ejemplo de petición DNS

<table>
<tr><th> Paso </th><th>Consulta</th><th> Tipo</th><th> Respuesta</th></tr>
<tr><td>1</td><td>PC → DNS local</td><td>**Recursiva**</td><td>“No lo sé, déjame buscarlo...”</td></tr>
<tr><td>2</td><td>DNS local → Servidor raíz</td><td>**Iterativa**</td><td>“Pregunta a los servidores de `.com`”</td></tr>
<tr><td>3</td><td>DNS local → Servidor`.com`</td><td>**Iterativa**</td><td>“Pregunta a los servidores de `ejemplo.com`”</td></tr>
<tr><td>4</td><td>DNS local → Servidor autoritativo de `ejemplo.com`</td><td>**Iterativa**</td><td>“[www.ejemplo.com](http://www.ejemplo.com) = 192.168.1.10”</td></tr>
<tr><td>5</td><td>DNS local → PC</td><td>(Finaliza recursión)</td><td>“La IP es 192.168.1.10”</td></tr>
</table>


## Tipos de registros DNS

<table>
<tr><th> Registro  </th><th> Significado                                                              </th><th> Ejemplo                            </th></tr>
<tr><td> **A**     </td><td> Asocia un nombre a una dirección IPv4                                    </td><td> `www IN A 192.168.1.10`            </td></tr>
<tr><td> **AAAA**  </td><td> Asocia un nombre a una dirección IPv6                                    </td><td> `www IN AAAA 2001:db8::1`          </td></tr>
<tr><td> **CNAME** </td><td> Alias de otro nombre                                                     </td><td> `ftp IN CNAME www`                 </td></tr>
<tr><td> **MX**    </td><td> Servidor de correo del dominio                                           </td><td> `@ IN MX 10 mail.midominio.local.` </td></tr>
<tr><td> **NS**    </td><td> Servidores de nombres del dominio                                        </td><td> `@ IN NS ns1.midominio.local.`     </td></tr>
<tr><td> **PTR**   </td><td> Resolución inversa (IP → nombre)                                         </td><td> `10 IN PTR ns1.midominio.local.`   </td></tr>
<tr><td> **SOA**   </td><td> Inicio de autoridad. Contiene datos del dominio y del servidor principal </td><td>                                    </td></tr>
</table>

![](https://i.ytimg.com/vi/3Lijmp_LC0k/maxresdefault.jpg)

## Zonas DNS

Una zona es la parte del espacio de nombres de la que un servidor DNS es responsable.

Hay dos tipos:

- Zona directa = convierte nombres en IP (ej. www → 192.168.1.10)
- Zona inversa = convierte IP en nombres (ej. 192.168.1.10 → www)

Los datos se guardan en archivos de zona, que contienen los registros mencionados.

## Archivos importantes en Linux

<table>
<tr><th> Archivo            </th><th> Descripción                                  </th></tr>
<tr><td> `/etc/resolv.conf` </td><td> Define los servidores DNS que usa el sistema </td></tr>
<tr><td> `/etc/hosts`       </td><td> Mapa estático de nombres e IPs locales       </td></tr>
<tr><td> `/etc/bind/`       </td><td> Carpeta principal de configuración de BIND9  </td></tr>
</table>

# BIND9 (Berkeley Internet Name Domain)

## ¿Qué es BIND?

BIND9 es el servidor DNS más utilizado en sistemas Unix y Linux. Es un software libre desarrollado por el Internet Systems Consortium (ISC).

Permite implementar cualquier tipo de servidor DNS:

- Caché / Recursivo
- Autoritativo
- Reenviador (forwarder)
- O una combinación de ellos

## Estructura de configuración

<table>
<tr><th> Archivo                              </th><th> Función                                             </th></tr>
<tr><td> `/etc/bind/named.conf`               </td><td> Archivo principal. Incluye otros ficheros           </td></tr>
<tr><td> `/etc/bind/named.conf.options`       </td><td> Opciones globales (forwarders, seguridad, etc.)     </td></tr>
<tr><td> `/etc/bind/named.conf.local`         </td><td> Zonas definidas localmente                          </td></tr>
<tr><td> `/etc/bind/named.conf.default-zones` </td><td> Zonas predeterminadas (localhost, 127.in-addr.arpa) </td></tr>
<tr><td> `/var/cache/bind/`                   </td><td> Archivos de zona en ejecución                       </td></tr>
</table>


## Modos de funcionamiento

- Servidor caché o forwarder = Resuelve peticiones de clientes reenviándolas a DNS externos (por ejemplo, `8.8.8.8`) y \
  guarda respuestas en caché.
- Servidor autoritativo = Contiene las zonas de un dominio concreto y responde con datos oficiales.

## Comandos útiles

<table>
<tr><th> Comando                               </th><th> Función                                            </th></tr>
<tr><td> `sudo named-checkconf`                </td><td> Comprueba la sintaxis del archivo de configuración </td></tr>
<tr><td> `sudo named-checkzone dominio zona`   </td><td> Verifica un archivo de zona                        </td></tr>
<tr><td> `sudo systemctl restart bind9`        </td><td> Reinicia el servicio                               </td></tr>
<tr><td> `dig nombre` o `dig @servidor nombre` </td><td> Realiza consultas DNS manuales                     </td></tr>
</table>

## Ventajas de usar BIND9

- Estándar de facto en servidores Linux y Unix.
- Altamente configurable y estable.
- Compatible con DNSSEC (seguridad).
- Admite vistas (views), control remoto (rndc) y logs detallados.
- Código abierto y ampliamente documentado.

## Ejemplo mínimo de configuración (servidor caché local)

```
options {
    directory "/var/cache/bind";
    recursion yes;
    allow-recursion { 127.0.0.1; 192.168.1.0/24; };
    forwarders {
        1.1.1.1;
        8.8.8.8;
    };
    dnssec-validation auto;
    listen-on { any; };
};
```

# Instalar y montar un servidor DNS

## Paquetes BIND9

Primero necesitamos instalar los paquetes:

```
sudo apt update
sudo apt install bind9 bind9utils bind9-doc -y
```

## Estructura de archivos principal

<table>
<tr><th> Archivo / Directorio                 </th><th> Descripción                                              </th></tr>
<tr><td> `/etc/bind/named.conf`               </td><td> Archivo principal de configuración                       </td></tr>
<tr><td> `/etc/bind/named.conf.options`       </td><td> Opciones globales (DNS recursivo, forwarders, etc.)      </td></tr>
<tr><td> `/etc/bind/named.conf.local`         </td><td> Zonas definidas localmente                               </td></tr>
<tr><td> `/etc/bind/named.conf.default-zones` </td><td> Zonas de ejemplo (como `localhost` y `127.in-addr.arpa`) </td></tr>
<tr><td> `/var/cache/bind/`                   </td><td> Archivos de zona en ejecución                            </td></tr>
</table>

## Configuración básica del servidor

Edita `/etc/bind/named.conf.options`

```
options {
    directory "/var/cache/bind";

    recursion yes;
    allow-recursion { 127.0.0.1; 192.168.1.0/24; };
    listen-on { any; };
    listen-on-v6 { any; };

    forwarders {
        1.1.1.1;
        8.8.8.8;
    };

    dnssec-validation auto;

    auth-nxdomain no;
};
```

### Explicación del fichero principal de configuración

- `directory "/var/cache/bind";` : Indica el directorio donde BIND guardará sus archivos temporales y de caché. Por defecto es `/var/cache/bind`
- `recursion yes;` : Activa la resolución recursiva, necesaria para que el servidor actúe como DNS caché: \
  Si un cliente le pregunta por un dominio que no conoce, el servidor irá consultando otros servidores DNS hasta resolverlo.
- `allow-recursion { ... };` : Define qué clientes pueden usar la recursión. Por seguridad, deberías permitir solo tus redes locales, por ejemplo: \
  `allow-recursion { 127.0.0.1; 192.168.1.0/24; };`
- `listen-on { any; };` : Define en qué interfaces IPv4 escuchará peticiones DNS. Puedes usar any (todas) o indicar una IP concreta: \
  `listen-on { 127.0.0.1; 192.168.1.10; };`
- `forwarders { ... };` : Aquí indicas a qué servidores reenviar las consultas que tu BIND no pueda resolver por sí mismo. \
  Por ejemplo, los DNS públicos de Cloudflare y Google. Así, cuando tu servidor recibe una consulta que no tiene en caché, la reenvía a esos DNS externos. \
  Si no configuras forwarders, BIND resolverá desde la raíz (root servers), lo cual es más lento.
- `dnssec-validation auto;` : Activa la validación automática de DNSSEC (seguridad de DNS), verificando firmas digitales de los dominios. \
  Normalmente se deja en auto
- `auth-nxdomain no;` : Controla cómo responde ante nombres inexistentes. Con no, BIND cumple el estándar RFC1035 (más correcto).

## Añadir una zona directa

Edita `/etc/bind/named.conf.local`:

```
zone "midominio.local" {
    type master;
    file "/etc/bind/db.midominio.local";
};
```

Ahora crea el archivo de zona: `sudo cp /etc/bind/db.local /etc/bind/db.midominio.local` y después edita: `/etc/bind/db.midominio.local`

/// ejemplo
Este es un ejemplo de `/etc/bind/db.midominio.local`
Es un archivo de zona directa, es decir, el fichero donde BIND9 almacena los registros DNS que asocian nombres de máquinas (hostnames) con sus direcciones IP dentro de un dominio determinado.

Por ejemplo, si tu dominio es midominio.local, este archivo contiene los datos que indican qué IP corresponde a www.midominio.local, mail.midominio.local, etc.

```
$TTL    604800
@       IN      SOA     ns1.midominio.local. admin.midominio.local. (
                        2025100801 ; Serial
                        604800     ; Refresh
                        86400      ; Retry
                        2419200    ; Expire
                        604800 )   ; Negative Cache TTL
@       IN      NS      ns1.midominio.local.
ns1     IN      A       192.168.1.10
equipo1 IN      A       192.168.1.11

```
///

## Comprobar y reiniciar el servidor

```
sudo named-checkconf
sudo named-checkzone midominio.local /etc/bind/db.midominio.local
```

## Reiniciar BIND

- Inicia el servidio `sudo systemctl restart bind9`
- Activa el servicio de manera permanente cuando arranque el sistema `sudo systemctl enable bind9`

## Probar el sistema

- Desde el servidor `dig @127.0.0.1 equipo1.midominio`
- Desde un cliente `dig @192.168.1.10 equipo1.midominio`
- Desde un cliente `resolvectl status` para averiguar quien es el servidor DNS


