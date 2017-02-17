sudo apt-get update
sudo apt-get -y install python-serial samba lighttpd git
# copiar los archivos de configuracion por defecto si fuese necesario // cp . 


#Crear los enlaces a los archivos 
cd /home/pi/
ln -s ./nerv/bash/mant.sh mant.sh
ln -s ./nerv/python/prueba.py prueba.py