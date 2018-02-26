//const int xaxis = A0;
//const int yaxis = A1;
int xval;
int yval;
int RedBtnState;
int BlueBtnState;
int GreenBtnState;

//const int XPin = A0;
//const int YPin = A1;
const int RedBtnPin = 2;
const int GreenBtnPin = 3;
const int BlueBtnPin = 4;

void setup()
{
  pinMode(RedBtnPin, INPUT);
  pinMode(GreenBtnPin, INPUT);
  pinMode(BlueBtnPin, INPUT);
  pinMode(A0, INPUT),
  pinMode(A1, INPUT),
  Serial.begin(9600);
}

void loop()
{
  xval = map(analogRead(A0),0,1023,-100,100);
  yval = map(analogRead(A1),0,1023,-100,100);
  /*
  RedBtnState = digitalRead(RedBtnPin);
  GreenBtnState = digitalRead(GreenBtnPin);
  BlueBtnState = digitalRead(BlueBtnPin);
   */
  
  Serial.print(xval);
  Serial.print("\t");
  Serial.print(yval);
  Serial.print("\t");
  /*
  Serial.print(RedBtnState);
  Serial.print("\t");
  Serial.print(GreenBtnState);
  Serial.print("\t");
  Serial.print(BlueBtnState);
  */
  Serial.print("\n");
  delay(100);
}



