#include <AFMotor.h>
AF_DCMotor MotorDI(1);
AF_DCMotor MotorDD(2);
AF_DCMotor MotorTI(3);
AF_DCMotor MotorTD(4);

void ordenMotores(uint8_t orden)
{
  MotorDI.run(orden);
  MotorDD.run(orden);
  MotorTI.run(orden);
  MotorTD.run(orden);
}

void velocidadMotores(int velocidad)
{
  MotorDI.setSpeed(velocidad);
  MotorDD.setSpeed(velocidad);
  MotorTI.setSpeed(velocidad);
  MotorTD.setSpeed(velocidad);
}

int seleccionarMarcha(char marcha)
{
  int v = 0;
  switch(marcha)
  {
    case '0':
        v = 0;
        break;
    case '1':
        v = 50;
        break;        
    case '2':
        v = 100;
        break;        
    case '3':
        v = 150;
        break;        
    case '4':
        v = 200;
        break;        
    case '5':
        v = 250;
        break;
    default:
      break;
  }
}

void setup() {
  ordenMotores(RELEASE);
  Serial.begin(9600);
}

void loop() {
  int velocidad = 127;
  char marcha = 1;
  int v2 = 0;

  velocidadMotores(velocidad);
  
  if (Serial.available())
  {
    char c = Serial.read();
    switch(c)
    {
      case 'a':
        ordenMotores(FORWARD);
        break;
      case 'b':
        ordenMotores(BACKWARD);
        break;
      case 'c':
        ordenMotores(RELEASE);
        break;
      case 'd':
        velocidadMotores(100);
        ordenMotores(FORWARD);
        delay(5000);
        ordenMotores(RELEASE);
        delay(2000);
        velocidadMotores(255);
        ordenMotores(BACKWARD);
        delay(5000);
        ordenMotores(RELEASE);
        break;
      case 'r':
        ordenMotores(RELEASE);
        break;
      case 'v':
      /*
        velocidad = (int)Serial.read();
        velocidadMotores(velocidad);
        */
        /*
         marcha = Serial.read(); //@FIXME consigo que leea otra vez el dato para cambiar de marcha, no se si es por culpa del python o del sketch
         velocidad = seleccionarMarcha(marcha);
         velocidadMotores(velocidad);
         */
         if((v2 + 10) <= 255)
         {
          v2 = v2 + 10;
         }
         
         velocidadMotores(v2);
         break;
       case 'w':
         if((v2 - 10) >= 0)
         {
          v2 = v2 - 10;
         }
         velocidadMotores(v2);
         break;
         
      default:
        break;
    }
    
  }
}
