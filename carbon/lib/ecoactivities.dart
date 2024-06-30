import 'package:flutter/material.dart';
import 'package:carbon/fonts.dart';

class EcoActivities extends StatelessWidget {
  const EcoActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.eco),
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
              const SizedBox(height: 10.0),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              EcoFriendlyWidget("Track your eco-friendly habits daily"),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
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
      color: const Color(0xFFF0F4F8),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            radius: 20,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              value,
              style: minSize,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.directions_bike),
            color: Colors.green,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.eco),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
