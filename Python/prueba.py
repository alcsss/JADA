import serial

arduino = serial.Serial('/dev/ttyUSB0', 9600)

print("Starting! A (Adelante), B (Atras), C (Close) y D (Adelante y atras")

#comando
while True:
      comando = raw_input('Introduce un comando: ') #Input
      arduino.write(comando) #Mandar un comando hacia Arduino
      if comando == 'A':
          print('Adelante')
      elif comando == 'B':
          print('Atras')
      elif comando == 'D':
          print('to locker')
      elif comando == 'C':
          print('hachaluego')
          arduino.close()
          break

#arduino.close() #Finalizamos la comunicacion
