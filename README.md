# Sistema CRUD de Películas en JSP

¡Bienvenido al repositorio del Sistema CRUD de Películas en JSP! Este proyecto es una aplicación web diseñada para gestionar una base de datos de películas utilizando JavaServer Pages (JSP).

## Descripción

El Sistema CRUD de Películas en JSP es una aplicación web que ofrece funcionalidades para realizar operaciones básicas de gestión de películas, incluyendo:

- Crear nuevas películas.
- Leer información de películas existentes.
- Actualizar la información de películas.
- Eliminar películas de la base de datos.

## Requisitos

Para ejecutar la aplicación en tu entorno local, necesitarás tener instalado:

- Docker
- Docker Compose
- Un navegador web moderno

## Configuración y Ejecución con Docker

1. Clona este repositorio en tu máquina local.
2. Navega hasta el directorio del proyecto.
3. Levanta los contenedores Docker utilizando el comando:


Levantar docker-compose: 
```bash
docker-compose up -d
```
Cerrar docker-compose: 
```bash
docker-compose down
```

Para entrar en cada uno de los contenedores, usamos el comando: 
```bash
docker-compose exec 'nombre del servicio' bash.
```
Si es MySQL mysql -u user -p

En el contenedor de Tomcat, la ruta que carga los archivos en la app web es, /usr/local/tomcat/webapps/ROOT

## Base de Datos
He usado este generador de datos para mi base de datos https://www.mockaroo.com/
