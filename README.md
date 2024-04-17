Levantar docker-compose: docker-compose up -d
Cerrar docker-compose: docker-compose down

Para entrar en cada uno de los contenedores, usamos el comando: docker-compose exec 'nombre del servicio' bash.
Si es MySQL mysql -u user -p

En el contenedor de Tomcat, la ruta que carga los archivos en la app web es, /usr/local/tomcat/webapps/ROOT

He usado este generador de datos para mi base de datos https://www.mockaroo.com/
