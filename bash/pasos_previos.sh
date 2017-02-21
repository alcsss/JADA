# Nos situamos en la carpeta del usuario pi
cd /home/pi/

# Crear archivo de configuracion con variables
touch config.cfg
#nombre, tipo de arduino,  


# Actualizar la raspberry e instalar los programas necesarios
sudo apt-get update -y
sudo apt-get install -y python-serial samba lighttpd git python3 arduino-core arduino-mk

# Otorgar permisos necesarios para cargar sketch
sudo usermod -a -G dialout pi

# copiar los archivos de configuracion por defecto si fuese necesario // cp . 
# 

# Crear los enlaces a los archivos 
# cd /home/pi/
ln -s ./nerv/bash/mant.sh mant.sh
ln -s ./nerv/python/prueba.py prueba.py
ls -l 

echo "Instalacion realizada"
echo "Reinicie para asegurarse de que las configuraciones se cargan correctamente"