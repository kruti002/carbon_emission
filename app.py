from flask import Flask, render_template, request
from flask_cors import CORS
app = Flask(__name__)


EMISSION_FACTORS = {
    "India": {
        "Transportation": 0.14,  
        "Electricity": 0.82, 
        "Diet": 1.25,  
        "Waste": 0.1  
    }
}

@app.route('/', methods=['GET','POST'])
def index():
    if request.method == 'POST':
        
        country = request.form.get('country')
        distance = float(request.form.get('distance'))
        electricity = float(request.form.get('electricity'))
        waste = float(request.form.get('waste'))
        meals = int(request.form.get('meals'))

        
        if distance > 0:
            distance = distance * 365  
        if electricity > 0:
            electricity = electricity * 12 
        if meals > 0:
            meals = meals * 365  
        if waste > 0:
            waste = waste * 52  

        # Calculating the carbon emissions
        transportation_emissions = EMISSION_FACTORS[country]["Transportation"] * distance
        electricity_emissions = EMISSION_FACTORS[country]["Electricity"] * electricity
        diet_emissions = EMISSION_FACTORS[country]["Diet"] * meals
        waste_emissions = EMISSION_FACTORS[country]["Waste"] * waste

       
        transportation_emissions = round(transportation_emissions / 1000, 2)
        electricity_emissions = round(electricity_emissions / 1000, 2)
        diet_emissions = round(diet_emissions / 1000, 2)
        waste_emissions = round(waste_emissions / 1000, 2)

        
        total_emissions = round(
            transportation_emissions + electricity_emissions + diet_emissions + waste_emissions, 2
        )

        return render_template('index.html', result=True,
                               transportation_emissions=transportation_emissions,
                               electricity_emissions=electricity_emissions,
                               diet_emissions=diet_emissions,
                               waste_emissions=waste_emissions,
                               total_emissions=total_emissions)
    return render_template('index.html', result=False)

if __name__ == '__main__':
    app.run(debug=True)
