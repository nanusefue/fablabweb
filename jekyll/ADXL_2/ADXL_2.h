struct AccelerometerRaw
{
  int XAxis;
  int YAxis;
  int ZAxis;
};

byte buffer[6];
#define ADXL_ADDR   0x53              // 7 bit I2C address for DS1621 temperature sensor
int data;


