import 'package:flutter/material.dart';
import 'package:carbon/fonts.dart';

class Insights extends StatelessWidget {
  const Insights({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Insights", style: heading),
        Container(
          color: Color(0xFFF0F4F8),
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Transportation: 40%", style: normalSize),
              SizedBox(height: 10),
              Text("Home Energy: 40%", style: normalSize),
              SizedBox(height: 10),
              Text("Food: 40%", style: normalSize),
              SizedBox(height: 10),
              Text("Other: 40%", style: normalSize),
              SizedBox(height: 10),
            ],
          ),
        )
      ],
    );
  }
}
