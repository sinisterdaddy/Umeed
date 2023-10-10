from flask import Flask, jsonify
from twilio.rest import Client
from flask_cors import CORS
import os
from geopy.geocoders import Nominatim
import geocoder as gc

g= str (gc.ip('me'))       #COMPUTING LOCATION FROM CURRENT IP-ADDRESS  
app = Flask(__name__)
CORS(app)
location = 'ALERT! Your friends last known location:'+g
# Twilio Account SID and Auth Token
account_sid = 'ACb07fab9320e23a1207e0e3fe49e56695'
auth_token = '7370b78fcebf351441ddc409ae2aabf6'
client = Client(account_sid, auth_token)
recipient_number = '+919267913652'

@app.route('/send_alert', methods=['POST'])
def send_alert():
    try:
        message = client.messages.create(
            from_='+16629857249',
            body=location,
            to=recipient_number
        )

        return jsonify({'message_sid': message.sid}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/make_call', methods=['POST'])
def make_call():
    try:
        # Make a call using Twilio to the specified phone number
        call = client.calls.create(
            url='http://demo.twilio.com/docs/voice.xml',
            to=recipient_number,
            from_='+16629857249'
        )

        # Return the SID of the created call
        return jsonify({'call_sid': call.sid}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
