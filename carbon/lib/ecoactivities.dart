import 'package:flutter/material.dart';
import 'package:carbon/fonts.dart';

class EcoActivities extends StatelessWidget {
  const EcoActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Eco activities"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily")

            ]
          )
        )
      ),
      
    );
  }
}

class EcoFriendlyWidget extends StatelessWidget {
  final String value;
  EcoFriendlyWidget(this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0F4F8),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 12.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              radius: 20,
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: Text(
                value,
                style: minSize,
              ),
            ),
            IconButton(
              icon: Icon(Icons.directions_bike),
              color: Colors.green,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.eco),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  InfoBox({required this.label, required this.value, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        SizedBox(height: 2),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF81A97D), Color(0xFFADCA90)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


