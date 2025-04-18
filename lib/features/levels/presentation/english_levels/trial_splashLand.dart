import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app.dart'; // Adjust path if needed

class TrialSplashLand extends StatefulWidget {
  const TrialSplashLand({super.key});

  @override
  State<TrialSplashLand> createState() => _TrialSplashLandState();
}

class _TrialSplashLandState extends State<TrialSplashLand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/beachBg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Positioned Hero as per your padding
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 10),
            child: Center(
              child: Hero(
                tag: 'superman',
                child: Lottie.asset(
                  'assets/jsonAnimations/flyingspace.json',
                  height: 300,
                ),
              ),
            ),
          ),

          // Bottom-right "Get Started" Button
          Positioned(
            bottom: 35,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onboardingCompleted', true);

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => MyApp()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
