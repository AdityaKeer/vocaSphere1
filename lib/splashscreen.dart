import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:major_project1/app.dart';
import 'package:major_project1/features/levels/presentation/english_levels/trial_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<void> _initializationFuture;
  late Future<bool> _onboardingStatusFuture;

  @override
  void initState() {
    super.initState();
    _initializationFuture = _initializeApp();
    _onboardingStatusFuture = _isOnboardingComplete();
    _navigateWhenReady();
  }

  // Simulate setup (like Firebase user check, prefs, etc.)
  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 1)); // fake work here
  }

  // Check if onboarding is completed
  Future<bool> _isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingCompleted') ?? false;
  }

  // Navigating when everything is ready (including min splash time)
  Future<void> _navigateWhenReady() async {
    final minSplashTime = Future.delayed(const Duration(seconds: 1));

    // Wait for both initialization & minimum splash time
    await Future.wait([_initializationFuture, minSplashTime]);

    final onboardingCompleted = await _onboardingStatusFuture;

    if (!mounted) return;

    // Navigate to either TrialSplash or MyApp based on onboarding status
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => onboardingCompleted ? MyApp() : const TrialSplash(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'superman',
          child: Lottie.asset(
            'assets/jsonAnimations/flyingspace.json',
            height: 200,
          ),
        ),
      ),
    );
  }
}
