import 'insights.dart';
import 'overallprogress.dart';
import 'tips.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class InsightsAndTips extends StatelessWidget {
  const InsightsAndTips({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Insights(),
              SizedBox(height: 20),
              TipsToReduce(),
              SizedBox(height: 20),
              OverallProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
