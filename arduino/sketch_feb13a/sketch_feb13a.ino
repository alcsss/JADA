#include <AFMotor.h>
AF_DCMotor Motor1(1);

void setup() {
  Motor1.run(RELEASE);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available())
  {
    char c = Serial.read();
    if (c == 'A')
    {
      Motor1.setSpeed(250);
      Motor1.run(FORWARD);
      //delay (5000);
    } else if (c == 'B')
    {
      Motor1.setSpeed(250);
      Motor1.run(BACKWARD);
      //delay (5000);
    } else if (c == 'C') {
      Motor1.run(RELEASE);
    } else if (c == 'D')
    {
      Motor1.setSpeed(100);
      Motor1.run(FORWARD);
      delay(2000);
      Motor1.run(RELEASE);
      delay(2000);
      Motor1.setSpeed(100);
      Motor1.run(BACKWARD);
      delay(2000);
      Motor1.run(RELEASE);
    } else if (c == 'R')
    {
      Motor1.run(RELEASE);
    }
  }
}
