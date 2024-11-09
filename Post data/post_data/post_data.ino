#include <WiFi.h>
#include <HTTPClient.h>
#include <WiFiServer.h>
#include <WiFiClient.h>

// Wi-Fi credentials
const char* ssid = "Galaxy S20 FE 5G";
const char* password = "ednodoosem";

// Target server details (where the ESP32 will send the POST request)
const char* serverAddress = "http://192.168.27.179:5000/post_data";
const int serverPort = 5000; // Local port for the ESP32 server

// Initialize the Wi-Fi server
WiFiServer server(serverPort);

// Function to send sensor data (POST request to another server)
void sendSensorData(int sensorData) {
  HTTPClient http;

  // Check if Wi-Fi is connected
  if (WiFi.status() == WL_CONNECTED) {
    http.begin(serverAddress);  // Initialize HTTP client with the target server address
    http.addHeader("Content-Type", "application/json"); // Set the header for JSON payload

  String jsonData = "{\"sensorData\":\"1\"}";  // Create JSON payload with the value "1"

    int httpResponseCode = http.POST(jsonData);  // Send the POST request

    // Check the HTTP response code
    if (httpResponseCode > 0) {
      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);
    } else {
      Serial.print("HTTP Error: ");
      Serial.println(httpResponseCode);
    }

    http.end();  // End the HTTP request
  } else {
    Serial.println("WiFi not connected. Skipping HTTP request.");
  }
}

void setup() {
  Serial.begin(115200);
  delay(10);

  // Start the Wi-Fi connection
  Serial.println();
  Serial.print("Connecting to WiFi...");
  WiFi.begin(ssid, password);

  // Wait for Wi-Fi to connect
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  // Print the IP address assigned to the ESP32
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  // Start the server
  server.begin();
  Serial.println("Server started on port 5000");
  sendSensorData(1);
}

void loop() {
  WiFiClient client = server.available();  // Check for incoming clients
}
