#include <WiFi.h>
#include <HTTPClient.h>
#include "SoftwareSerial.h"
#include "DFRobotDFPlayerMini.h"

#define radioPot 2
#define volumePot 3
#define button 9

// Use pins 2 and 3 to communicate with DFPlayer Mini
static const uint8_t PIN_MP3_TX = 4; //arduino 2
static const uint8_t PIN_MP3_RX = 5; //arduino 3
SoftwareSerial softwareSerial(PIN_MP3_RX, PIN_MP3_TX);

// Create the Player object
DFRobotDFPlayerMini player;
// Wi-Fi credentials
int track = 1;
const char* ssid = "Galaxy S20 FE 5G";
const char* password = "ednodoosem";

// Target server details (where the ESP32 will send the POST request)
const char* serverAddress = "http://192.168.27.179:5000/post_data";

void sendSensorData(int data) {
  
  HTTPClient http;
  
  if (WiFi.status() == WL_CONNECTED) // Check if WiFi is connected
  {
    http.begin(serverAddress); // Your Flask server endpoint
    http.addHeader("Content-Type", "application/json"); // Specify content type
    
    String jsonData = "{\"sensorData\": " + String(data) + "}"; // Create JSON payload
    int httpResponseCode = http.POST(jsonData); // Send the POST request
    

    if (httpResponseCode > 0) // Check for errors
    {
      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);
    } else {
      Serial.print("HTTP Error: ");
      Serial.println(httpResponseCode);
    }

    http.end();
  } else {
    Serial.println("WiFi not connected. Skipping HTTP request.");
  }
}

void setup(void)
{
  WiFi.begin(ssid, password);
  pinMode(radioPot, INPUT);
  pinMode(button, INPUT_PULLUP);
  pinMode(volumePot, INPUT);
  Serial.begin(115200);
  softwareSerial.begin(9600);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");
  Serial.print("ESP32 IP Address: ");
  Serial.println(WiFi.localIP());
    if (player.begin(softwareSerial)) {
   Serial.println("OK");
    player.volume(5);
    
  } else {
    Serial.println("Connecting to DFPlayer Mini failed!");
  }
  player.play(track);
}


void loop()
{
  int potStateRadio = analogRead(radioPot);
  int potStateVolume = analogRead(volumePot);
  int buttonState = digitalRead(button);
  Serial.println(potStateVolume);
  int volumeSpeaker;
  volumeSpeaker = map(potStateVolume, 0, 4095, 0, 30);
  delay(1000);
  //Serial.println(volumeSpeaker);
  player.volume(volumeSpeaker);
  Serial.println(buttonState);
  if(buttonState == 0)
  {
    sendSensorData(1);
  }
  Serial.println(potStateRadio);
  int radio;
  radio = map(potStateRadio, 0, 4095, 0, 1023);
  delay(1000);
  if (radio >= 0 && radio < 510 && track != 1)
  {
    Serial.println("Channel 1");
    track = 1;
    player.play(track);
  }else if(radio >= 511 && radio < 1023 && track != 2)
  {
    Serial.println("Channel 2");
    track = 2;
    player.play(track);
  }
}