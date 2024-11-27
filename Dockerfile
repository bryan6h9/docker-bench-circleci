# Usar una imagen de Python
FROM python:3.9-slim

# Actualizar apt-get e instalar dependencias necesarias para compilación
RUN apt-get update && apt-get install -y build-essential libpq-dev

# Copiar el archivo requirements.txt al contenedor
COPY requirements.txt /app/requirements.txt

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# El resto de tu configuración...
