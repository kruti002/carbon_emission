import 'package:flutter/material.dart';
import 'package:carbon/constants.dart';

class EnvironmentalImpactScreen extends StatefulWidget {
  @override
  _EnvironmentalImpactScreenState createState() => _EnvironmentalImpactScreenState();
}

class _EnvironmentalImpactScreenState extends State<EnvironmentalImpactScreen> {
  double _distanceTravelled = 0;
  double _electricityConsumption = 0;
  double _wasteGeneration = 0;
  int _numberOfMeals = 0;

  void openDialog(String title, double currentValue, ValueChanged<double> onChanged) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double localValue = currentValue;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF81A97D), Color(0xFFADCA90)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Slider(
                            value: localValue,
                            min: 0,
                            max: 100,
                            divisions: title == 'Number of Meals' ? 100 : null,
                            onChanged: (newValue) {
                              setState(() {
                                localValue = newValue;
                              });
                            },
                            activeColor: Color(0xFF277548),
                            inactiveColor: Color(0xFF899D4D),
                          ),
                          Text(
                            title == 'Number of Meals' 
                              ? localValue.toInt().toString() 
                              : localValue.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          "OK",
                          style: TextStyle(
                            color: Color(0xFF277548), // Green color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (title == 'Number of Meals') {
                              onChanged(localValue.toInt().toDouble());
                            } else {
                              onChanged(localValue);
                            }
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter details',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            buildRow('Distance Travelled', _distanceTravelled, (newValue) => setState(() => _distanceTravelled = newValue)),
            buildRow('Energy Consumption', _electricityConsumption, (newValue) => setState(() => _electricityConsumption = newValue)),
            buildRow('Waste Generated', _wasteGeneration, (newValue) => setState(() => _wasteGeneration = newValue)),
            buildRow('Number of Meals', _numberOfMeals.toDouble(), (newValue) => setState(() => _numberOfMeals = newValue.toInt())),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String title, double value, ValueChanged<double> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildButton(title, value, onChanged),
        buildDisplayContainer(title, value),
      ],
    );
  }

  Widget buildButton(String title, double currentValue, ValueChanged<double> onChanged) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: btnBorder),
        ),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [startBtn, midBtn, endBtn],
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: () {
          openDialog(title, currentValue, onChanged);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent, // Light green
          minimumSize: const Size(220, 40),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildDisplayContainer(String title, double value) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        title == 'Number of Meals' 
          ? value.toInt().toString() 
          : value.toStringAsFixed(2),
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
