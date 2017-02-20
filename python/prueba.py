import serial

arduino = serial.Serial('/dev/ttyUSB0', 9600)
i = 0

print("Starting!")
print("a (Adelante)")
print("b (Atras)")
print("d (Locker (Adelante y atras))")
print("c (Close)")
print("x (Solo es un mensaje)")
print("r (Parar)")
print("v (Subir marcha")
print("w (Bajar marcha")

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
      	#velocidad = raw_input('Introduce un velocidad: ')
      	#arduino.write(velocidad)
      	if (i + 10) <= 255:
      		i = i + 10
      		print('Marcha : %d' % i)
      	else:
      		print('Marcha : %d' % i)
      		print('No tira mas locker')
      elif comando == 'w':
      	if (i - 10) >= 0:
      		i = i - 10
      		print('Marcha : %d' % i)
      	else:
      		print('Mu baja siberet')

#arduino.close() #Finalizamos la comunicacion
