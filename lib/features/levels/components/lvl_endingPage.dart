import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../languages/cubits/language_cubit.dart';

class LvlEndingPage extends StatefulWidget {
  const LvlEndingPage({super.key});

  @override
  State<LvlEndingPage> createState() => _LvlEndingPageState();
}

class _LvlEndingPageState extends State<LvlEndingPage>
    with SingleTickerProviderStateMixin {
  double percent = 0.10; // Starting percentage
  late Color progressColor;
  late double progress;
  late AnimationController _animationController;
  late Animation<double> _percentAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // Smoother duration
    );
    _percentAnimation = Tween<double>(begin: 0.0, end: percent).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // Smooth easing for approachability
      ),
    )..addListener(() {
      setState(() {}); // Update UI during animation
    });
    _animationController.forward(); // Start animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getProgressColor(double progress) {
    if (progress < 20.0) return Colors.red;
    if (progress < 40.0) return Colors.orange;
    if (progress < 60.0) return Colors.yellow;
    if (progress < 80.0) return Colors.lightGreenAccent;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    progress = _percentAnimation.value * 100; // Animated progress
    progressColor = _getProgressColor(progress);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.42,
            image: AssetImage('assets/images/bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                SimpleShadow(
                  opacity: 0.5,
                  offset: const Offset(5, 5),
                  sigma: 7,
                  child: Image.asset('assets/images/levelUp.png'),
                ),
                const SizedBox(height: 30),
                SimpleShadow(
                  opacity: 0.5,
                  offset: const Offset(5, 5),
                  sigma: 7,
                  child: CircularPercentIndicator(
                    radius: 170,
                    lineWidth: 30,
                    percent: _percentAnimation.value, // Animated value
                    backgroundColor: Colors.black12,
                    progressColor: progressColor,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: false, // Controlled by our AnimationController
                    center: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          '${progress.toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            foreground:
                                Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color =
                                      Colors
                                          .black, // Changed to black for contrast
                          ),
                        ),
                        Text(
                          '${progress.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50), // Replaced Padding with SizedBox
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context.read<LanguageCubit>(),
                      child: SimpleShadow(
                        opacity: 0.5,
                        offset: const Offset(5, 5),
                        sigma: 7,
                        child: Image.asset(
                          'assets/images/progLevelsListIcon.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => context.read<LanguageCubit>(),
                      child: SimpleShadow(
                        opacity: 0.5,
                        offset: const Offset(5, 5),
                        sigma: 7,
                        child: Image.asset(
                          'assets/images/progLevelRetryIcon.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => context.read<LanguageCubit>().nextlvl(),
                      child: SimpleShadow(
                        opacity: 0.5,
                        offset: const Offset(5, 5),
                        sigma: 7,
                        child: Image.asset(
                          'assets/images/progLevelNextIcon.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
