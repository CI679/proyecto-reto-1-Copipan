FROM debian:latest

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos de la aplicación
COPY . /app/
RUN ls -l /app

# Cambiar permisos para que los archivos puedan ser modificados
RUN chmod -R 777 /app

# Usar ENTRYPOINT para recibir parámetros dinámicos
ENTRYPOINT ["/app/app"]