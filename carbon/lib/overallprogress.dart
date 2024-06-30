import 'package:flutter/material.dart';
import 'fonts.dart';

class OverallProgress extends StatelessWidget {
  const OverallProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Overall Progress", style: heading),
        Container(
          color: const Color(0xFFF0F4F8),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("This month", style: midSize),
              const SizedBox(height: 10),
              Text("You’ve reduced your carbon footprint by 15% compared to last month!", style: normalSize),
            ]
          ),
        )
      ],
    );
  }
}