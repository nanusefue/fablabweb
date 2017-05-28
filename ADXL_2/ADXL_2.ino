#include "ADXL_2.h"  /* Ne pas oublier d'inclure la librairie <TinyPinChange> qui est utilisee par la librairie <RcSeq> */
#include <TinyWireM.h>                  // I2C Master lib for ATTinys which use USI
#include <SoftSerial.h>     /* Allows Pin Change Interrupt Vector Sharing */
#include <TinyPinChange.h>  /* Ne pas oublier d'inclure la librairie <TinyPinChange> qui est utilisee par la librairie <RcSeq> */


SoftSerial mySerial(9, 8); // RX, TX
void setup(){
 
   CLKPR = (1 << CLKPCE);
   CLKPR = (0 << CLKPS3) | (0 << CLKPS2) | (0 << CLKPS1) | (0 << CLKPS0);
 
  mySerial.begin(19200);
  TinyWireM.begin();                    // initialize I2C lib
  uint8_t data = Read(ADXL_ADDR,0x00, 1,buffer)[0];
  mySerial.print(data,HEX); 
  if(data == 0xE5)
  mySerial.print("Connected!!!");
  else
  mySerial.print("No Conected!!!");
 
  Write(0x2D, 0x08);
  Write(0x31, 0x08);

}

void loop(){
  uint8_t data = Read(ADXL_ADDR,0x00, 1,buffer)[0];
  Acc_get();
delay(200);
}


AccelerometerRaw ReadRawAxis()
{

  Write(0x32,0x01);
  Read(ADXL_ADDR,0x32,6,buffer);
  AccelerometerRaw raw = AccelerometerRaw();
  raw.XAxis = ((int)buffer[1] << 8) | buffer[0];
  raw.YAxis = ((int)buffer[3] << 8) | buffer[2];
  raw.ZAxis = ((int)buffer[5] << 8) | buffer[4];
  return raw;
}


void Acc_get(){  // Get the temperature from a DS1621
  
  AccelerometerRaw raw = ReadRawAxis();
  mySerial.print("X: ");
  mySerial.println(raw.XAxis);
  mySerial.print("Y: ");
  mySerial.println(raw.YAxis);
  mySerial.print("Z: ");
  mySerial.println(raw.ZAxis);
  delay(100);

}

void Write(int address, int data)
{
  TinyWireM.beginTransmission(ADXL_ADDR);
  TinyWireM.send(address);
  TinyWireM.send(data);
  TinyWireM.endTransmission();
}


uint8_t* Read(int m_Address,int address, int length,byte buffer[])
{
  TinyWireM.beginTransmission(m_Address);
  TinyWireM.send(address);
  TinyWireM.endTransmission();
  
  TinyWireM.beginTransmission(m_Address);
  TinyWireM.requestFrom(m_Address, length);

  if(TinyWireM.available() == length)
  {
    for(uint8_t i = 0; i < length; i++)
    {
      buffer[i] = TinyWireM.receive();
    }
  }
  TinyWireM.endTransmission();

  return buffer;
}





