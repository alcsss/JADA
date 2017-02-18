import serial

arduino = serial.Serial('/dev/ttyUSB0', 9600)

print("Starting! a (Adelante), b (Atras), c (Close), d (Adelante y atras), r (Parar) y v (Marcha: 0, 1, 2, 3, 4, 5)")

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
