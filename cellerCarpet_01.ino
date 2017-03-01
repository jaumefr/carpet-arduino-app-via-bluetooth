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

SoftwareSerial BT1(10, 11); // RX | TX
void setup()
   { pinMode(8, OUTPUT);        // Al poner en HIGH forzaremos el modo AT
     pinMode(9, OUTPUT);        // cuando se alimente de aqui
     digitalWrite(9, HIGH);
     delay (500) ;              // Espera antes de encender el modulo
     Serial.begin(9600);
     Serial.println("Levantando el modulo HC-06");
     digitalWrite (8, HIGH);    //Enciende el modulo
     Serial.println("Esperando comandos AT:");
     BT1.begin(9600); 
     delay(5000);
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
    //Serial.print("Knocki"); Serial.println(sensorActual);
    Serial.println(sensorActual);
    //Serial.println("tempsAra"); Serial.println(sensorActual);
    
    BT1.write(sensorActual);
    
    ultimaVegada = tempsAra;
    sensorAnterior= sensorActual;
    
  }      

  }

      

