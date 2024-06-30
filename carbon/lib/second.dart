import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const Text(
                'Rohit Patel',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Today\'s overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildOverviewCard('CO2', '0', Colors.orange),
                    const SizedBox(width: 10),
                    _buildOverviewCard('Food', '0.7', Colors.green),
                    const SizedBox(width: 10),
                    _buildOverviewCard('Fuel', '5', Colors.orange),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildActivityItem(Icons.directions_walk, '10567', 'steps'),
              const SizedBox(height: 10),
              _buildActivityItem(Icons.directions_bike, '4667', 'm'),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.access_time), onPressed: () {}),
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
        const SizedBox(width: 10),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(width: 5),
        Text(unit),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    );
  }
}