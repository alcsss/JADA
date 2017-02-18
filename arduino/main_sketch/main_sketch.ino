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
        ordenMotores(FORWARD);
        delay(5000);
        ordenMotores(RELEASE);
        delay(2000);
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
         marcha = Serial.read();
         velocidad = seleccionarMarcha(marcha);
         velocidadMotores(velocidad);
      default:
        break;
    }
    
  }
}
