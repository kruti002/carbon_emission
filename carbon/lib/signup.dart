import 'main.dart';
import 'package:http/http.dart' as http;
import 'register.dart';
import 'constants.dart';
import 'package:flutter/material.dart';

Future<bool> login(String username, String password) async {
  String url = 'https://54q0p9sw-5000.inc1.devtunnels.ms/login';

  Map<String, String> payload = {
    'email': username,
    'password': password,
  };

  final response = await http.post(Uri.parse(url), body: payload);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Image.asset(
              'assets/signup.png',
              height: 200.0,
              width: 200.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30.0),
            InfoBox(
              controller: usernameController,
              label: 'Username',
              icon: Icons.person,
              obs: false,
            ),
            const SizedBox(height: 20.0),
            InfoBox(
                controller: passwordController,
                label: 'Password',
                icon: Icons.lock,
                obs: true),
            const SizedBox(height: 40.0),
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
                onPressed: () async {
                  {
                    bool a = await login(
                        usernameController.text, passwordController.text);
                    print('IT NEEDS TO WORKS');
                    a
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyHomePage()))
                        : print('error');
                  }
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
            const SizedBox(height: 20.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Don\'t have account ?'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                      child: const Text('sign up'))
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
  final TextEditingController controller;
  const InfoBox(
      {super.key, required this.label,
      required this.icon,
      required this.obs,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF81A97D), Color(0xFFADCA90)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                obscureText: obs,
                controller: controller,
                decoration: InputDecoration(
                  hintText: label,
                  hintStyle: const TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
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
