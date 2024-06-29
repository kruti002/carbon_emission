import 'package:carbon/envimpactscreen.dart';
import 'package:flutter/material.dart';
// import 'eco_friendly_square.dart';
// import 'environmental_impact_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Explore eco options by mood"),
            SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  EcoFriendlySquare(icon: Icons.eco, text: 'Eco-friendly'),
                  EcoFriendlySquare(icon: Icons.nature, text: 'Sustainable'),
                  EcoFriendlySquare(icon: Icons.grass, text: 'Green Living'),
                  EcoFriendlySquare(icon: Icons.local_florist, text: 'Eco Conscious'),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnvironmentalImpactScreen(),
                    ),
                  );
                },
                child: Text('Go to Environmental Impact Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class EcoFriendlySquare extends StatelessWidget {
  final IconData icon;
  final String text;

  EcoFriendlySquare({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD3E4CD),
        // borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40.0,
            color: Colors.black,
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


