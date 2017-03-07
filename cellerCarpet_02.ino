#include <SoftwareSerial.h>
int sensorReading= 0;
const int knockSensor = A0;
const int llindar= 150;
const int margeTemps= 500;
char sensorActual= '0';
char sensorAnterior= '0';
long int tempsAra= 0;
long int ultimaVegada= 0;

char dadaEnviar = '1';

void setup()
   {         
     delay (3000);  // Espera inicial
     Serial.begin(9600);
   }

void loop()
   {  

  if (analogRead(A0) >= llindar) {
    sensorActual='1';
    tempsAra= millis();
  }
  else if (analogRead(A1) >= llindar) {

    sensorActual='2';
    tempsAra= millis();

  }
  else if (analogRead(A2) >= llindar) {
    sensorActual ='3';
    tempsAra= millis();

  }
  else if (analogRead(A3) >= llindar) {
    sensorActual='4';
    tempsAra= millis();

  }
    else if (analogRead(A4) >= llindar) {
    sensorActual='5';
    tempsAra= millis();
  }

  if((sensorActual!=sensorAnterior) || (sensorActual==sensorAnterior && (tempsAra > (ultimaVegada + margeTemps)))){
    Serial.print(sensorActual);
    ultimaVegada = tempsAra;
    sensorAnterior= sensorActual;  
  }      

}


