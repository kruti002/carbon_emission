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
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.eco),
                    color: Colors.green,
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  Text(
                    "Eco activities",
                    style: heading,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    'Track Progress',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            radius: 20,
          ),
          SizedBox(width: 10.0),
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
    );
  }
}
