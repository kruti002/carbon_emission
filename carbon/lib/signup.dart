import 'package:carbon/constants.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Image.asset(
              'assets/signup.png',
              height: 200.0,
              width: 200.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 30.0),
            InfoBox(
              label: 'Username',
              icon: Icons.person,
              obs: false,
            ),
            SizedBox(height: 20.0),
            InfoBox(label: 'Password', icon: Icons.lock, obs: true),
            SizedBox(height: 40.0),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: btnBorder),
                ),
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [startBtn, midBtn, endBtn]),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent, // Light green
                  minimumSize: const Size(280, 50),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Don\'t have account ?'),
                  TextButton(onPressed: () {}, child: Text('sign up'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obs;

  InfoBox({required this.label, required this.icon, required this.obs});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF81A97D), Color(0xFFADCA90)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                obscureText: obs,
                controller: controller,
                decoration: InputDecoration(
                  hintText: label,
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
