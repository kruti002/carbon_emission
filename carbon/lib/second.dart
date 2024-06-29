import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F5E9),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Text(
                'Rohit Patel',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Today\'s overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildOverviewCard('CO2', '0', Colors.orange),
                    SizedBox(width: 10),
                    _buildOverviewCard('Food', '0.7', Colors.green),
                    SizedBox(width: 10),
                    _buildOverviewCard('Fuel', '5', Colors.orange),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildActivityItem(Icons.directions_walk, '10567', 'steps'),
              SizedBox(height: 10),
              _buildActivityItem(Icons.directions_bike, '4667', 'm'),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(icon: Icon(Icons.home), onPressed: () {}),
                  IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {}),
                  IconButton(icon: Icon(Icons.access_time), onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewCard(String title, String value, Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          Text('CO2', style: TextStyle(color: color)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(IconData icon, String value, String unit) {
    return Row(
      children: [
        Icon(icon, size: 30),
        SizedBox(width: 10),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Text(unit),
        Spacer(),
        Icon(Icons.arrow_forward_ios, size: 16),
      ],
    );
  }
}