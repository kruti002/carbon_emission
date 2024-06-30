import 'package:flutter/material.dart';
import 'package:carbon/fonts.dart';

class TipsToReduce extends StatelessWidget {
  const TipsToReduce({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tips to Reduce Impact", style: heading),
        Container(
          color: const Color(0xFFF0F4F8),
          padding: const EdgeInsets.all(15.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TipsBox("Transportation", "Consider biking or using public transport to reduce your carbon footprint."),
              const TipsBox("Home Energy", "Switch to energy-efficient appliances and use smart thermostats."),
              TipsBox("Food", "Opt for locally sourced and seasonal produce to lower transportation emissions."),
            ],
          ),
        )
      ],
    );
  }
}

class TipsBox extends StatelessWidget {
  final String value1, value2;
  const TipsBox(this.value1, this.value2, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value1, style: midSize),
          const SizedBox(height: 10),
          Text(value2, style: normalSize),
        ],
      )
    );
  }
}