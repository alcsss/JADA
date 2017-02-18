import serial

arduino = serial.Serial('/dev/ttyUSB0', 9600)

print("Starting! A (Adelante), B (Atras), C (Close), D (Adelante y atras) y R (Parar)")

#comando
while True:
      comando = raw_input('Introduce un comando: ') #Input
      arduino.write(comando) #Mandar un comando hacia Arduino
      if comando == 'a':
          print('Adelante')
      elif comando == 'b':
          print('Atras')
      elif comando == 'd':
          print('to locker')
      elif comando == 'c':
          print('hachaluego')
          arduino.close()
          break
      elif comando == 'x':
      	print('Yee que apsa oscio')
      elif comando == 'r':
      	print('Pues me paro')
      elif comando == 'v':
      	velocidad = raw_input('Introduce un velocidad: ')
      	arduino.write(velocidad)

#arduino.close() #Finalizamos la comunicacion
