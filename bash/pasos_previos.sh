# Nos situamos en la carpeta home, seguramente /home/pi
cd

# Crear archivo de configuracion con variables (nombre, tipo de arduino) 
# para que las usen otros scripts
# touch config.cfg

# Actualizar la raspberry e instalar los programas necesarios
sudo apt-get update -y
sudo apt-get install -y python-serial samba lighttpd git python3 screen php5-cgi

#Instalar platformIO
python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"

# Otorgar permisos necesarios para cargar sketch
sudo usermod -a -G dialout pi

# Descargar el repositorio desde GitHub
git clone https://github.com/alcsss/nerv

# Copiar los archivos de configuracion por defecto si fuese necesario
# -- Lighttpd --
# sudo mv /etc/lighttpd/lighttpd.conf /etc/lighttpd/lighttpd.conf.old
# cp ./nerv/bash/configs/lighttpd.conf /etc/lighttpd/lighttpd.conf
# -- Samba --
# sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.old
# cp ./nerv/bash/configs/smb.conf /etc/samba/smb.conf
#

# Cambiar configuraciones
# -- Nombre de red -- // Poner nombre segun variable
sudo echo "raspi" > /etc/hostname 

# -- Carpeta compartida -- // Compartir en red local la carpeta home
# guest account = pi
# 

# Reiniciar servicios
sudo service lighttpd restart
sudo service samba restart

# Crear los enlaces a los archivos 
ln -s ./nerv/bash/mant.sh mant.sh
ln -s ./nerv/python/prueba.py prueba.py
ls -l 

# Ejecutar script de mantenimiento
bash ./mant.sh

echo " ---------------- Instalacion realizada ---------------- "
echo "En la primera carga de sketch se instalaran archivos necesarios"
echo "Reinicie para asegurarse de que las configuraciones se cargan correctamente"