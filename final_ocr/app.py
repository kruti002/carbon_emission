from flask import Flask, render_template, request
from PIL import Image
import google.generativeai as genai
from dotenv import load_dotenv
import os 

# Load the environment variables from the .env file
load_dotenv()
app = Flask(__name__)

# Configure the generative AI model with your API key
genai.configure(api_key=os.getenv('GENAI_API_KEY')) 
model = genai.GenerativeModel('gemini-pro-vision')
api_key = os.getenv('GENAI_API_KEY')

# Configure the generative AI model with your API key
genai.configure(api_key=api_key)
# Function to preprocess the image
def preprocess_image(image_path, max_size=(256, 256)):
    try:
        img = Image.open(image_path)
        img.thumbnail(max_size)
        return img
    except Exception as e:
        print(f"Error preprocessing image: {e}")
        return None
# Function to analyze the image and text
def analyze_image(image_path, text):
    try:
        # Preprocess the image
        img = preprocess_image(image_path)
        if img is None:
            return "Error: Failed to preprocess the image"

        # Generate content using both text prompt and image
        response = model.generate_content([text, img])
        return response.text
    except Exception as e:
        return f"An error occurred while analyzing the image: {e}"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload_file():
    if request.method == 'POST':
        file = request.files['file']
        if file:
            try:
                # Save the uploaded file
                file_path = "static/uploaded_image.png"
                file.save(file_path)

                # Analyze the image and text
                text = """
Analyze Food Order and Calculate Carbon Footprint

Instructions:

Identify Food Items:
Determine if each food item is vegetarian (veg) or non-vegetarian (non-veg) based on the bill details.
List each food item with its classification (veg/non-veg).
Calculate Carbon Emissions:
Use India-specific carbon emission factors to calculate the carbon footprint for each item.
Provide the carbon emission factors used for each category (e.g., non-vegetarian food: X kg CO2e/rupee, vegetarian food: Y kg CO2e/rupee).
Since the bill doesn't provide weights, assume standard values for calculations (e.g., 100 grams for salad ingredients, 200 grams for vegetable curry). Clearly state these assumptions.
Provide a Breakdown:
Detail the carbon emissions for each food item separately, considering quantity and emission factors.
Summarize the total carbon footprint for the entire order.
Give Healthy Alternatives:
Suggest healthier alternatives for your chosen food items.
These alternatives should have a lower estimated carbon footprint than the original order.
Provide the estimated carbon emissions for each suggested alternative.
Summarize the Results:
Briefly describe your order (type and total emissions).
Provide a breakdown of emissions by individual items (or categories if quantities are unavailable).
Additional Considerations

Acknowledge limitations (estimated weights, emission factors).
Offer resources for further information on food carbon footprint calculations (optional).
Response Format:

Please deliver the analysis in a bulleted point format for each section.
                """
                result = analyze_image(file_path, text)

                # Pass the result to the template
                return render_template('result.html', result=result, image_file='uploaded_image.png')
            except Exception as e:
                return f"An error occurred: {e}"
        else:
            return "No file uploaded"
    return "Method not allowed"

if __name__ == '__main__':
    app.run(debug=True)
