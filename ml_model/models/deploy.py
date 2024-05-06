import joblib
import pandas as pd
from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin

with open('heart_pipeline.pkl', 'rb') as f:
    heart_pipeline = joblib.load(f)


app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    return "Run Successfully.."


@app.route('/predict', methods=['POST'])
def predict():
    try:
        json_data = request.get_json()
        data = pd.DataFrame(json_data)
        data_transform = heart_pipeline.named_steps['preprocessor'].transform(
            data)
        predictions = heart_pipeline.named_steps['estimator'].predict(
            data_transform)
        return jsonify({"prediction": predictions.tolist()})
    except Exception as err:
        return jsonify({"Error": str(err)})


if __name__ == '__main__':
    app.run(debug=True)
