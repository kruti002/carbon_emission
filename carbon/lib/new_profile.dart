import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'My Insights',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildInsightsRow(),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Text(
                    'Accomplishments',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildAccomplishmentCard(
                  'Eco champion', 'Reduce energy use by 20%!', 250, 500),
              const SizedBox(height: 20),
              _buildAccomplishmentCard(
                  'Green traveler', 'Use public transport twice a week!', 1, 2),
              const Spacer(),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildProfileHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
              AssetImage('assets/space_car.png'), // Replace with your image
        ),
        Text(
          'EcoTrack Insights',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '@ecotrack',
          style: TextStyle(color: const Color(0xFFD3E4CD)),
        ),
      ],
    );
  }

  Widget _buildInsightsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInsightItem('50 kWh', 'Energy\nconsumed', Icons.flash_on),
        _buildInsightItem('5 tons', 'Carbon\nfootprint', Icons.eco),
        _buildInsightItem('10', 'Eco points\ncollected', Icons.star),
      ],
    );
  }

  Widget _buildInsightItem(String value, String label, IconData icon) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFD3E4CD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 4),
          Icon(icon, color: Colors.black),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAccomplishmentCard(
      String title, String subtitle, int progress, int total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD3E4CD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.black45),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress / total,
                    backgroundColor: Colors.grey[700],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                    minHeight: 10,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '$progress/$total',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
