import 'package:carbon/constants.dart';

import 'ecoactivities.dart';
import 'envimpactscreen.dart';
import 'package:flutter/material.dart';
import 'fonts.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome to EcoTrack", style: heading),
                Icon(
                  Icons.search,
                  size: 30,
                )
              ],
            ),
            Text("Track your daily eco habits mindfully", style: normalSize),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFF0F4F8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          "Stay serene like a sloth",
                          style: midSize,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EcoActivities(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                          textStyle: normalSize,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Text(
                          'Start',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Image.network(
                      "https://trackepr.com/wp-content/uploads/2024/02/epr-certificate.png",
                      height: 100,
                      width: 120)
                ],
              ),
            ),
            SizedBox(height: 15),
            Text("Explore eco options by mood", style: midSize),
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
        borderRadius: BorderRadius.circular(20.0),
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
