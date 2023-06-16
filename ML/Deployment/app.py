from flask import Flask, render_template, request, jsonify
import tensorflow as tf
import numpy as np
import cv2

app = Flask(__name__)

# Load model
model = tf.keras.models.load_model('model_inceptionV3_epoch5.h5')

# Define label names
category = {
    0: 'apple', 1: 'banana', 2: 'beetroot', 3: 'bell pepper', 4: 'cabbage', 5: 'capsicum',
    6: 'carrot', 7: 'cauliflower', 8: 'chilli pepper', 9: 'corn', 10: 'cucumber', 11: 'eggplant',
    12: 'garlic', 13: 'ginger', 14: 'grapes', 15: 'jalapeno', 16: 'kiwi', 17: 'lemon', 18: 'lettuce',
    19: 'mango', 20: 'onion', 21: 'orange', 22: 'paprika', 23: 'pear', 24: 'peas', 25: 'pineapple',
    26: 'pomegranate', 27: 'potato', 28: 'radish', 29: 'soy beans', 30: 'spinach', 31: 'sweetcorn',
    32: 'sweetpotato', 33: 'tomato', 34: 'turnip', 35: 'watermelon'
}

# Load label names
label_names = [category[i] for i in range(len(category))]


# Preprocess image
def preprocess_image(image):
    image = cv2.resize(image, (150, 150))
    image = image / 255.0
    image = np.expand_dims(image, axis=0)
    return image


# Perform object detection
def detect_objects(image):
    preprocessed_image = preprocess_image(image)
    predictions = model.predict(preprocessed_image)
    top_predictions = np.argsort(predictions[0])[::-1][:5]
    results = []
    for idx in top_predictions:
        label = label_names[idx]
        confidence = predictions[0][idx]
        results.append({'label': label, 'confidence': float(confidence)})
    return results


# Flask routes
@app.route('/')
def index():
    return render_template('index.html')


@app.route('/predict', methods=['POST'])
def predict():
    if 'image' not in request.files:
        return jsonify({'error': 'No image found'})
    file = request.files['image']
    image = cv2.imdecode(np.frombuffer(file.read(), np.uint8), cv2.IMREAD_COLOR)
    results = detect_objects(image)
    return jsonify({'results': results})


@app.route('/get_solution', methods=['POST'])
def get_solution():
    selected_fruit = request.json['fruit']
    fruit_solution = get_fruit_solution(selected_fruit)
    return jsonify({'solution': fruit_solution})


# Fungsi untuk mendapatkan teks cara penyimpanan berdasarkan nama buah
def get_fruit_solution(fruit_name):
    fruit_solutions = {
        'apple': 'Simpan apel di dalam kulkas pada suhu 4-6 derajat Celsius.',
        'banana': 'Simpan pisang di suhu ruangan pada tempat yang kering dan tidak terkena sinar matahari langsung.',
        'beetroot': 'Simpan bit di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'bell pepper': 'Simpan paprika di dalam kulkas pada suhu 4-6 derajat Celsius dalam wadah kedap udara.',
        'cabbage': 'Simpan kubis di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'capsicum': 'Simpan paprika di dalam kulkas pada suhu 4-6 derajat Celsius dalam wadah kedap udara.',
        'carrot': 'Simpan wortel di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'cauliflower': 'Simpan kembang kol di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'chilli pepper': 'Simpan cabai di dalam kulkas pada suhu 8-10 derajat Celsius dalam wadah kedap udara.',
        'corn': 'Simpan jagung di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'cucumber': 'Simpan mentimun di dalam kulkas pada suhu 8-10 derajat Celsius dalam wadah kedap udara.',
        'eggplant': 'Simpan terong di dalam kulkas pada suhu 8-10 derajat Celsius dalam wadah kedap udara.',
        'garlic': 'Simpan bawang putih di tempat yang kering dan sejuk.',
        'ginger': 'Simpan jahe di tempat yang kering dan sejuk.',
        'grapes': 'Simpan anggur di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'jalapeno': 'Simpan cabai jalapeno di dalam kulkas pada suhu 8-10 derajat Celsius dalam wadah kedap udara.',
        'kiwi': 'Simpan kiwi di dalam kulkas pada suhu 0-4 derajat Celsius.',
        'lemon': 'Simpan lemon di suhu ruangan pada tempat yang kering dan tidak terkena sinar matahari langsung.',
        'lettuce': 'Simpan selada di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'mango': 'Simpan mangga di suhu ruangan hingga matang, kemudian simpan di dalam kulkas pada suhu 8-10 derajat Celsius.',
        'onion': 'Simpan bawang merah dan bawang putih di tempat yang kering dan berventilasi terpisah dari buah-buahan lain.',
        'orange': 'Simpan jeruk di dalam kulkas pada suhu 8-10 derajat Celsius.',
        'paprika': 'Simpan paprika di dalam kulkas pada suhu 4-6 derajat Celsius dalam wadah kedap udara.',
        'pear': 'Simpan pir di dalam kulkas pada suhu 2-4 derajat Celsius.',
        'peas': 'Simpan kacang polong di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'pineapple': 'Simpan nanas di dalam kulkas pada suhu 2-4 derajat Celsius.',
        'pomegranate': 'Simpan delima di dalam kulkas pada suhu 5-7 derajat Celsius.',
        'potato': 'Simpan kentang di tempat yang sejuk, kering, dan gelap pada suhu 7-10 derajat Celsius.',
        'radish': 'Simpan lobak di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'soy beans': 'Simpan kacang kedelai di tempat yang sejuk, kering, dan gelap pada suhu 10-15 derajat Celsius.',
        'spinach': 'Simpan bayam di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'sweetcorn': 'Simpan jagung manis di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'sweetpotato': 'Simpan ubi jalar di tempat yang sejuk, kering, dan gelap pada suhu 13-16 derajat Celsius.',
        'tomato': 'Simpan tomat di suhu ruangan pada tempat yang kering dan tidak terkena sinar matahari langsung.',
        'turnip': 'Simpan lobak di dalam kulkas pada suhu 0-4 derajat Celsius dalam wadah kedap udara.',
        'watermelon': 'Simpan semangka di suhu ruangan pada tempat yang kering dan tidak terkena sinar matahari langsung.',
    }
    return fruit_solutions.get(fruit_name, 'Cara penyimpanan untuk buah ini tidak tersedia.')


if __name__ == '__main__':
    app.run()
