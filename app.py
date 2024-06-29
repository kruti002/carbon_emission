from flask import Flask, render_template, request

app = Flask(__name__)

# Define emission factors (example values, replace with accurate data)
EMISSION_FACTORS = {
    "India": {
        "Transportation": 0.14,  # kgCO2/km
        "Electricity": 0.82,  # kgCO2/kWh
        "Diet": 1.25,  # kgCO2/meal
        "Waste": 0.1  # kgCO2/kg
    }
}

@app.route('/', methods=['GET','POST'])
def index():
    if request.method == 'POST':
        # Get user inputs
        country = request.form.get('country')
        distance = float(request.form.get('distance'))
        electricity = float(request.form.get('electricity'))
        waste = float(request.form.get('waste'))
        meals = int(request.form.get('meals'))

        # Normalize inputs
        if distance > 0:
            distance = distance * 365  # Convert daily distance to yearly
        if electricity > 0:
            electricity = electricity * 12  # Convert monthly electricity to yearly
        if meals > 0:
            meals = meals * 365  # Convert daily meals to yearly
        if waste > 0:
            waste = waste * 52  # Convert weekly waste to yearly

        # Calculate carbon emissions
        transportation_emissions = EMISSION_FACTORS[country]["Transportation"] * distance
        electricity_emissions = EMISSION_FACTORS[country]["Electricity"] * electricity
        diet_emissions = EMISSION_FACTORS[country]["Diet"] * meals
        waste_emissions = EMISSION_FACTORS[country]["Waste"] * waste

        # Convert emissions to tonnes and round off to 2 decimal points
        transportation_emissions = round(transportation_emissions / 1000, 2)
        electricity_emissions = round(electricity_emissions / 1000, 2)
        diet_emissions = round(diet_emissions / 1000, 2)
        waste_emissions = round(waste_emissions / 1000, 2)

        # Calculate total emissions
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
