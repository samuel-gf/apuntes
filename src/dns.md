---
title : DNS
toc : true
logo : true
---






<!-- ------------------------------------------------------>
# Ejemplo de registro

```
midominio.com. IN A 192.168.1.100
midominio.com. IN AAAA 2001:0db8:85a3:0000:0000:8a2e:0370:7334
www.midominio.com. IN CNAME midominio.com.
midominio.com. IN MX 10 mail.midominio.com.
midominio.com. IN TXT "v=spf1 ip4:192.168.1.100 -all"
midominio.com. IN NS ns1.proveedor.com.
100.1.168.192.in-addr.arpa. IN PTR midominio.com.
```

- Cuando alguien escribe midominio.com en su navegador, el DNS le dirá que debe conectarse a la dirección IP 192.168.1.100.
- Igual que el registro A, pero usando direcciones IPv6.
- Si alguien hace una consulta inversa sobre la IP 192.168.1.100, recibirá midominio.com como respuesta.
- Este registro define una política SPF para evitar que otros envíen correos en nombre del dominio.
- Si se intenta acceder a www.midominio.com, el DNS lo redirige a midominio.com.
- El correo enviado a usuario@midominio.com será gestionado por mail.midominio.com. El 10 es la prioridad (menor número = mayor prioridad)
- Los servidores de nombres (como ns1.proveedor.com) gestionan las consultas DNS para midominio.com.




