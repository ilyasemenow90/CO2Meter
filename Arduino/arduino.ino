#include <SoftwareSerial.h>

SoftwareSerial mySerial(A0, A1); // RX, TX соответственно
  
byte cmd[9] = {0xFF,0x01,0x86,0x00,0x00,0x00,0x00,0x00,0x79}; 
char response[9]; 
String ppmString = " ";
int number = 0;

void setup() {
  // Запускаем serial для подключения к компьютеру
  Serial.begin(9600);
  // Запускаем serial для подключения к MH-Z14
  mySerial.begin(9600);
}

void loop() 
{
  //Пингуем CO2, читаем ответ и переводим в PPM
  mySerial.write(cmd,9);
  mySerial.readBytes(response, 9);
  int responseHigh = (int) response[2];
  int responseLow = (int) response[3];
  int ppm = (256*responseHigh)+responseLow;
  ppmString = String(ppm); //int to string
  // Выводим на экран
  Serial.print(String(number)+") PPM ");
  Serial.println(ppm);
  // Пауза 10 секунд
  delay(1000);
}
