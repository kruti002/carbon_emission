import 'package:flutter/material.dart';

class EcoTrackInsightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              SizedBox(height: 20),
              Text(
                'Insights',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildInsightsRow(),
              SizedBox(height: 30),
              Text(
                'Accomplishments',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildAccomplishmentCard('Eco champion', 'Reduce energy use by 20%!', 250, 500),
              SizedBox(height: 20),
              _buildAccomplishmentCard('Green traveler', 'Use public transport twice a week!', 1, 2),
              Spacer(),
              _buildBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with your image
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EcoTrack Insights',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '@ecotrack',
              style: TextStyle(color: Colors.grey),
            ),
          ],
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
    return Column(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAccomplishmentCard(String title, String subtitle, int progress, int total) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress / total,
                    backgroundColor: Colors.grey[700],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    minHeight: 10,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                '$progress/$total',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.search, color: Colors.grey),
        Icon(Icons.favorite, color: Colors.grey),
        Icon(Icons.person, color: Colors.grey),
      ],
    );
  }
}