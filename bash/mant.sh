# Actualizar repositorio
cd /home/pi/nerv
git pull
cd

# Copiar web en directorio web
sudo rm -r /var/www/html/*
sudo cp -r /home/pi/nerv/web/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/*

# Cargar el sketch en el arduino
sudo platformio run -t upload -d ./nerv/arduino/