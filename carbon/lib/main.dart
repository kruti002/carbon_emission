import 'package:flutter/material.dart';
import 'home.dart';
import 'input_fields.dart';
import 'insightstips.dart';
import 'leader.dart';
import 'login.dart';
import 'new_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoTrack',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: _selectedIndex == 0
                  ? const HomeScreen()
                  : _selectedIndex == 1
                      ? LeaderboardScreen()
                      : _selectedIndex == 2
                          ? const ManualEntryScreen()
                          : ProfileScreen()),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 7,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.values[0],
              iconSize: 20,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.leaderboard,
                  ),
                  label: 'Leaderboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                  label: 'OCR',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
