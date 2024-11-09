#include <WiFi.h>
#include <HTTPClient.h>

// Wi-Fi credentials
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
  Serial.begin(9600);
  WiFi.begin(ssid, password);


  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");
  Serial.print("ESP32 IP Address: ");
  Serial.println(WiFi.localIP());
  sendSensorData(1);
}


void loop()
{
  
}