# Actualizar repositorio // añadir opcion "hard reset" para forzar la actualizacion
cd /home/pi/nerv
git pull
cd

# Copiar web en directorio web // Revisar permisos
sudo rm -r /var/www/html/*
sudo cp -r /home/pi/nerv/web/* /var/www/html/
sudo chown -R pi:www-data /var/www/html/*
sudo find /var/www/html/ -type f -exec chmod 644 {} \; && sudo find /var/www/html/ -type d -exec chmod 755 {} \;

# Reiniciar servicios
sudo service lighttpd restart

# Cargar el sketch en el arduino // Usar variable $1 para cargarlo
if [ $1 = "a" ];
	then
		sudo platformio run -t upload -d ./nerv/arduino/
fi

echo " -- Mantenimiento finalizado -- "