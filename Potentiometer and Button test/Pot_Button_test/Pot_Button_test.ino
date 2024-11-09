#define radioPot A0
#define volumePot A1
#define button 8

void setup() {
  // put your setup code here, to run once:
  pinMode(radioPot, INPUT);
  pinMode(button, INPUT_PULLUP);
  pinMode(volumePot, INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  //Serial.println(analogRead(A0));
  int potStateRadio = analogRead(radioPot);
  int potStateVolume = analogRead(volumePot);
  int volume = map(potStateVolume, 0, 1023, 0, 30);
  int buttonState;
   Serial.println(volume);
  //Serial.println(buttonState);
  if(digitalRead(8) == 0)
  {
    buttonState = 1;
    Serial.println("Pressed the button!");
  }else{
        buttonState = 0;
  }
  if (potStateRadio >= 0 && potStateRadio < 205)
  {
    Serial.println("Channel 1");
  }else if(potStateRadio >= 205 && potStateRadio < 410)
  {
    Serial.println("Channel 2");
  }else if(potStateRadio >= 410 && potStateRadio < 615)
  {
    Serial.println("Channel 3");
  }else if(potStateRadio >= 615 && potStateRadio < 820)
  {
    Serial.println("Channel 4");
  }else if(potStateRadio >= 820 && potStateRadio < 1023)
  {
    Serial.println("Channel 5");
  }
}
