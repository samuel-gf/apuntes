---
title : Práctica File Server
toc : true
logo : true
---


<img src="https://media.fs.com/images/community/erp/KMTws_post701ojbgd5faw3FfGab.jpg">

# OVA

+ Importa la máquina virtual *File Server* en un *Virtual Box*
+ Clona en *Virtual Box* la OVA y crea un *cliente* al que llamaremos **cliente**
+ Personaliza el fondo de pantalla y el terminal del servidor y del cliente
+ Cambia el nombre a la *máquina virtual cliente* con el comando:
```
$ sudo hostnamectl hostname cliente
```

Nota : Después de cambiar el nombre al cliente debes cerrar y volver a abrir el terminal


# Servidor accesible

+ Configura *File Server* para que sea accesible desde un terminal de tu *máquina virtual cliente*
+ Comprueba que puedes hacer *ping* desde un terminal de tu *máquina virtual cliente*

<img src="https://concepto.de/wp-content/uploads/2019/04/servidor-web-e1555874258468.jpg">


# Servicio SSH

+ Monta en *File Server* un *servicio SSH*
+ Crea en *File Server* un usuario para que puedas acceder por *ssh* desde tu *máquina virtual cliente*
+ Conéctate **sin contraseña** desde tu *máquina virtual cliente* a *File Server*

<img src="https://dinahosting.com/blog/cont/uploads/2020/09/SSH.jpg">

# Trabaja desde tu máquina virtual cliente

Trabaja !!desde tu máquina virtual cliente!! conectado por *SSH* a *File Server*

+ Configura un servicio de *FTP* en *File Server*
+ Instala el cliente de FTP *Filezilla* en la *máquina virtual cliente*
+ Conéctate mediante el cliente FTP a *File Server*
+ Sube algún archivo a *File Server* por FTP desde tu *máquina virtual cliente*

<img src="https://www.softzone.es/app/uploads-softzone.es/2020/02/Oracle-VirtualBox-1.jpg">

# Comprobación de la práctica

Para firmar la práctica:

- [ ] Comprobamos que puedes conectarte por *SSH* desde tu *máquina virtual cliente* a *File Server* sin contraseña
- [ ] Comprobamos que puedes conectarte por FTP desde tu *máquina virtual cliente* a *File Server* con *Filezilla*
- [ ] Comprobamos que puedes subir un fichero desde tu *máquina virtual cliente* a *File Server* con *Filezilla*
- [ ] Comprobamos que puedes descargar un fichero de *File Server* a tu *máquina virtual cliente* con *Filezilla*

<img src="https://st2.depositphotos.com/1017986/8512/i/950/depositphotos_85129684-stock-photo-happy-high-school-students-in.jpg">


