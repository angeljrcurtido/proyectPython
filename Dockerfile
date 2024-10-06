# Usa una imagen base de Python 3.9 slim
FROM python:3.9-slim

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar el archivo de dependencias
COPY requirements.txt /app/requirements.txt

# Instalar las dependencias
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copiar el código de la aplicación
COPY . /app

# Exponer el puerto 5000
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]
