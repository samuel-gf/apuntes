---
title : Open VPN
toc : true
logo : true
---


# Instalación de OpenVPN y Easy-RSA

Ejecuta este comando para la instalación

```
$ sudo apt update && sudo apt install openvpn easy-rsa -y
```

# Configuración del Servidor OpenVPN

Copia los archivos de configuración:

```
$ sudo cp -r /usr/share/easy-rsa /etc/openvpn/
$ cd /etc/openvpn/easy-rsa
$ sudo chmod +x easyrsa
```

Inicia la configuración de la Autoridad Certificadora (CA):

```
$ ./easyrsa init-pki
$ ./easyrsa build-ca nopass
```

Genera la clave y certificado del servidor:

```
$ ./easyrsa gen-req server nopass
$ ./easyrsa sign-req server server
```

Crea la clave Diffie-Hellman para el cifrado:

```
$ ./easyrsa gen-dh
```

Genera un archivo HMAC para seguridad adicional:

```
$ openvpn --genkey --secret /etc/openvpn/ta.key
```

Copia los archivos generados a /etc/openvpn:

```
$ sudo cp pki/ca.crt pki/issued/server.crt pki/private/server.key /etc/openvpn/
$ sudo cp pki/dh.pem /etc/openvpn/dh2048.pem
```

# Configuración del Servidor OpenVPN

Crea el archivo de configuración del servidor:

```
$ sudo nano /etc/openvpn/server.conf
```

Añade lo siguiente:

```
port 1194
proto udp
dev tun
ca /etc/openvpn/ca.crt
cert /etc/openvpn/server.crt
key /etc/openvpn/server.key
dh /etc/openvpn/dh2048.pem
tls-auth /etc/openvpn/ta.key 0
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
keepalive 10 120
cipher AES-256-CBC
persist-key
persist-tun
status openvpn-status.log
verb 3
```

Guarda el archivo y regresa al prompt del sistema. Inicializa el servicio:

```
$ sudo systemctl enable openvpn@server
$ sudo systemctl start openvpn@server
```

# Crear Clientes VPN

Genera certificados para un cliente:

```
$ cd /etc/openvpn/easy-rsa
$ ./easyrsa gen-req cliente1 nopass
$ ./easyrsa sign-req client cliente1
```

Copia los archivos al cliente:

```
$ scp pki/ca.crt pki/issued/cliente1.crt pki/private/cliente1.key usuario@cliente:/home/usuario/
```

# Configurar el Cliente OpenVPN

En el cliente, instala OpenVPN:

```
$ sudo apt install openvpn -y
```

Crea el archivo de configuración del cliente:

```
$ nano cliente1.ovpn
```

Añade lo siguiente:

```
client
dev tun
proto udp
remote TU_IP_PUBLICA 1194
resolv-retry infinite
nobind
persist-key
persist-tun
ca ca.crt
cert cliente1.crt
key cliente1.key
cipher AES-256-CBC
verb 3
```

Finalemnte conéctate a la VPN con `$ sudo openvpn --config cliente1.ovpn` y si todo está bien, el cliente
tendrá acceso a la red VPN.

# Redirigir el tráfico a través de la VPN

Para que los clientes usen el servidor OpenVPN como gateway, habilita el reenvío de paquetes en el servidor:

```
$ sudo nano /etc/sysctl.conf
```

Busca esta línea y descoméntala:

```
net.ipv4.ip_forward=1
```

Aplica los cambios:

```
$ sudo sysctl -p
```

Configura reglas de iptables para permitir tráfico VPN:

```
$ sudo iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
```

Guarda las reglas iptables:

```
$ sudo iptables-save > /etc/iptables.rules
```








