import 'constants.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'signup.dart';

Future<bool> register(String username, String password) async {
  String url = 'https://54q0p9sw-5000.inc1.devtunnels.ms/register';

  Map<String, String> payload = {
    'email': username,
    'password': password,
    'username': username,
  };

  final response = await http.post(Uri.parse(url), body: payload);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
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
              'Register',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Create your account',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30.0),
            InfoBox(
              label: 'Username',
              icon: Icons.person,
              obs: false,
              controller: usernameController,
            ),
            const SizedBox(height: 20.0),
            InfoBox(
              label: 'Email id',
              icon: Icons.person,
              obs: false,
              controller: emailController,
            ),
            const SizedBox(height: 20.0),
            InfoBox(
              label: 'Password',
              icon: Icons.lock,
              obs: true,
              controller: passwordController,
            ),
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
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent, // Light green
                  minimumSize: const Size(280, 50),
                ),
                child: const Text(
                  'Sign Up',
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
                  const Text('Already have an account ?'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      child: const Text('Login'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
