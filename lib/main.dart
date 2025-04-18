import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:major_project1/firebase_options.dart';
import 'package:major_project1/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'features/levels/presentation/english_levels/trial_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //   runApp(MyApp());
  // }

  runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // only this needed
    );
  }
}

//   runApp(const EntryPoint());
// }
//
// class EntryPoint extends StatelessWidget {
//   const EntryPoint({super.key});
//
//   Future<bool> checkOnboardingStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('onboardingCompleted') ?? false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: checkOnboardingStatus(),
//       builder: (context, snapshot) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home:
//               snapshot.connectionState == ConnectionState.waiting
//                   ? const SplashScreen()
//                   : snapshot.data == true
//                   ? MyApp()
//                   : const TrialSplash(),
//         );
//       },
//     );
//   }
// }
