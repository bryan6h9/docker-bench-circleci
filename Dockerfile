# Usar una imagen base de Ubuntu
FROM ubuntu:latest

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y curl git

# Configurar el directorio de trabajo
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . /app

# Comando para ejecutar el contenedor (esto depende de lo que quieras hacer)
CMD ["bash"]
