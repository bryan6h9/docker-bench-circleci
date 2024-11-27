# Usar una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualizar e instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    git \
    docker.io \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar el archivo requirements.txt al contenedor
COPY requirements.txt /app/requirements.txt

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar las dependencias de Python
RUN pip3 install --no-cache-dir -r requirements.txt

# El resto de tu configuración...
