# Nos situamos en la carpeta del usuario pi
cd

# Crear archivo de configuracion con variables (nombre, tipo de arduino) para que las usen otros scripts
# touch config.cfg  

# Actualizar la raspberry e instalar los programas necesarios
sudo apt-get update -y
sudo apt-get install -y python-serial samba lighttpd git python3 screen

#Instalar platformIO
python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"

# Otorgar permisos necesarios para cargar sketch
sudo usermod -a -G dialout pi

# copiar los archivos de configuracion por defecto si fuese necesario // cp .
# lighttpd


# Descargar el repositorio desde GitHub
git clone https://github.com/alcsss/nerv

# Crear los enlaces a los archivos 
ln -s ./nerv/bash/mant.sh mant.sh
ln -s ./nerv/python/prueba.py prueba.py
ls -l 

# Ejecutar script de mantenimiento
sudo bash ./mant.sh

echo "---------------- Instalacion realizada ----------------"
echo "En la primera carga de sketch se instalaran archivos necesarios"
echo "Reinicie para asegurarse de que las configuraciones se cargan correctamente"