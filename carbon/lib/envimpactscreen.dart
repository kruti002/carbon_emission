import 'package:flutter/material.dart';

class EnvironmentalImpactScreen extends StatefulWidget {
  @override
  _EnvironmentalImpactScreenState createState() => _EnvironmentalImpactScreenState();
}

class _EnvironmentalImpactScreenState extends State<EnvironmentalImpactScreen> {
  double _distanceTravelled = 0;
  double _electricityConsumption = 0;
  double _wasteGeneration = 0;
  double _numberOfMeals = 0;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hello"),
          content: Text("This is a simple dialog box."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Environmental Impact'),
      ),
      body: Container(
        color: Color(0xFFF6E9B2),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _showDialog();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Text('Distance Traveled'),
            ),
          ),
        ),
      ),
    );
  }
}

