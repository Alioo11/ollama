from flask import Flask, request, jsonify
import subprocess
import json

app = Flask(__name__)

@app.route('/generate', methods=['POST'])
def generate():
    # Get the input text from the request
    data = request.json
    prompt = data.get('prompt', '')
    
    # Use Ollama to run inference on the model
    result = subprocess.run(
        ["ollama", "generate", "llama2", "--prompt", prompt],
        capture_output=True, text=True
    )
    
    # Parse the output from Ollama
    response = result.stdout.strip()
    
    return jsonify({"generated_text": response})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)