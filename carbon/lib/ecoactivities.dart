import 'package:flutter/material.dart';

import 'fonts.dart';

class EcoActivities extends StatelessWidget {
  const EcoActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
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
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            currentIndex: 0,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            onTap: (index) {},
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
      color: const Color(0xFFD3E4CD),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200?random=4'),
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
            color: Colors.green[300],
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
