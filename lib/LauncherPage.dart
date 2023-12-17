import 'package:flutter/material.dart';
import 'package:projectmobile/Login.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  'images/Logo.png',
                ),
                const SizedBox(height: 30), // Adjusted spacing
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            Color(0xFF292B37), // Set background color to white
                        onPrimary: Color(0xFF292B37), // Set text color to white
                        elevation: 0,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 8.0,
                        ),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white, // Set text color to transparent
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
