# Usa una imagen base (por ejemplo, una imagen de Ubuntu o Alpine)
FROM ubuntu:20.04

# Instalar dependencias (si es necesario)
RUN apt-get update && apt-get install -y \
    curl \
    git \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

# Copiar tus archivos del repositorio al contenedor
COPY . /app

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar las dependencias necesarias para tu aplicación
RUN pip install -r requirements.txt  # O los comandos que correspondan

# Ejecutar el comando que desees cuando el contenedor inicie
CMD ["python", "app.py"]
