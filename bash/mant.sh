# Actualizar repositorio
cd /home/pi/nerv
sudo git pull
cd

# Cargar el sketch en el arduino
cd /home/pi/nerv/arduino
platformio run -t upload
cd 