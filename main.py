from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/", methods=['GET'])
def get_ip_json():
    ip = request.headers.get("X-Forwarded-For", request.remote_addr)

    if ip and "," in ip:
        ip = ip.split(",")[0].strip()

    return jsonify({"ip": ip})

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000)