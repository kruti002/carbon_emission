import 'package:carbon/insights.dart';
import 'package:carbon/overallprogress.dart';
import 'package:carbon/tips.dart';
import 'package:flutter/material.dart';
import 'package:carbon/fonts.dart';

import 'constants.dart';

class InsightsAndTips extends StatelessWidget {
  const InsightsAndTips({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView( // Add SingleChildScrollView here
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
