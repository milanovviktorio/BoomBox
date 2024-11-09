from flask import Flask, request, jsonify

app = Flask(__name__)

# Global variable to store only the value from the most recent data
latest_data_value = None

# Route for posting data
@app.route('/post_data', methods=['POST'])
def post_data():
    global latest_data_value
    data = request.get_json()
    
    # Extract the "sensorData" value and store it
    latest_data_value = data.get('sensorData')
    
    print(f"Received data: {latest_data_value}")
    return "Data received", 200

# Route for getting the latest posted value
@app.route('/get_data', methods=['GET'])
def get_data():
    # Check if any data has been posted yet
    if latest_data_value is not None:
        data_info = {
            "value": latest_data_value
        }
    else:
        data_info = {
            "message": "No current messages"
        }
    return jsonify(data_info), 200

if __name__ == '__main__':
    # Run the app on all available IP addresses on port 5000
    app.run(host='0.0.0.0', port=5000)
