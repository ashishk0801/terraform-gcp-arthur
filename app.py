from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return f"""
    <h1>Hello from Cloud Run New Version - 28-05-2025 11:05!</h1>
    <p>Version: {os.environ.get('VERSION', 'latest')}</p>
    <p>Commit: {os.environ.get('COMMIT_SHA', 'unknown')}</p>
    """

@app.route('/health')
def health():
    return {'status': 'healthy'}, 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
