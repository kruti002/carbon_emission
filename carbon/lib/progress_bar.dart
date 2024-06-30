// import 'package:flutter/material.dart';
// class EmissionTrackerScreen extends StatefulWidget {
//   @override
//   _EmissionTrackerScreenState createState() => _EmissionTrackerScreenState();
// }

// class _EmissionTrackerScreenState extends State<EmissionTrackerScreen>
//     with SingleTickerProviderStateMixin {
//   double _progress = 0.0;
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     _animation = Tween<double>(begin: 0, end: _progress).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _updateProgress(double newProgress) {
//     setState(() {
//       _progress = newProgress.clamp(0.0, 1.0);
//       _animation = Tween<double>(begin: _animation.value, end: _progress)
//           .animate(CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ));
//       _animationController.forward(from: 0);
//     });
//   }

//   Future<void> _showInputDialog() async {
//     String? input = await showDialog<String>(
//       context: context,
//       builder: (BuildContext context) {
//         String inputValue = '';
//         return AlertDialog(
//           title: Text('Update CO2 Emission'),
//           content: TextField(
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               hintText: 'Enter percentage (0-100)',
//             ),
//             onChanged: (value) {
//               inputValue = value;
//             },
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             TextButton(
//               child: Text('Update'),
//               onPressed: () => Navigator.of(context).pop(inputValue),
//             ),
//           ],
//         );
//       },
//     );

//     if (input != null && input.isNotEmpty) {
//       double newProgress = double.parse(input) / 100;
//       _updateProgress(newProgress);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CO2 Emission Tracker'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Current CO2 Emission Reduction',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Column(
//                   children: [
//                     Container(
//                       width: 300,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: FractionallySizedBox(
//                         alignment: Alignment.centerLeft,
//                         widthFactor: _animation.value,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Colors.green.shade300, Colors.green.shade600],
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       '${(_animation.value * 100).toStringAsFixed(1)}%',
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showInputDialog,
//         tooltip: 'Update Progress',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CO2 Emission Tracker',
      theme: ThemeData(primarySwatch: Colors.green),
      home: EmissionTrackerScreen(),
    );
  }
}

class EmissionTrackerScreen extends StatefulWidget {
  @override
  _EmissionTrackerScreenState createState() => _EmissionTrackerScreenState();
}

class _EmissionTrackerScreenState extends State<EmissionTrackerScreen>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _progressAnimation = Tween<double>(begin: 0, end: _progress).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateProgress(double newValue) {
    setState(() {
      _progress = (_progress + newValue / 100).clamp(0.0, 1.0);
      _progressAnimation = Tween<double>(begin: _progressAnimation.value, end: _progress)
          .animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ));
      _animationController.forward(from: 0);
    });
  }

  Future<void> _showInputDialog() async {
    String? input = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String inputValue = '';
        return AlertDialog(
          title: const Text('Add CO2 Emission Reduction'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter percentage to add (0-100)',
            ),
            onChanged: (value) {
              inputValue = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () => Navigator.of(context).pop(inputValue),
            ),
          ],
        );
      },
    );

    if (input != null && input.isNotEmpty) {
      double newValue = double.parse(input);
      _updateProgress(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CO2 Emission Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current CO2 Emission Reduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Column(
                  children: [
                    Container(
                      width: 300,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: _progressAnimation.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.green.shade300, Colors.green.shade600],
                                  ),
                                ),
                              ),
                            ),
                            FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: _progressAnimation.value,
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.white.withOpacity(0.5), Colors.white.withOpacity(0.2)],
                                    stops: [
                                      0.0,
                                      0.5 + 0.5 * math.sin(_animationController.value * 2 * math.pi)
                                    ],
                                  ).createShader(rect);
                                },
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(_progressAnimation.value * 100).toStringAsFixed(1)}%',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showInputDialog,
        tooltip: 'Add Progress',
        child: const Icon(Icons.add),
      ),
    );
  }
}