import 'package:flutter/material.dart';

import 'constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/space_car.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Vikas Assudani',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'UI/UX Designer',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            InfoBox(
              label: 'Your Email',
              value: 'vikasassudani909@gmail.com',
              icon: Icons.email,
            ),
            InfoBox(
              label: 'Phone Number',
              value: '+91 9876543210',
              icon: Icons.phone,
            ),
            InfoBox(
              label: 'Achievements',
              value: 'Reduced carbon footprint by 20%',
              icon: Icons.star,
            ),
            InfoBox(
              label: 'My Goals',
              value: 'Reduce electricity usage by 10%',
              icon: Icons.flag,
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
        const SizedBox(height: 2),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF81A97D), Color(0xFFADCA90)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
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
