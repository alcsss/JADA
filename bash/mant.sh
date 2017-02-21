cd /home/pi/nerv
git pull
cd /home/pi
# cargar el sketch en el arduino - Comprobar el codigo
# arduino --board arduino:avr:mega:cpu=atmega2560 --port /dev/ttyACM0 --upload /home/pi/nerv/arduino/main_sketch/main_sketch.ino

make upload