import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:simple_shadow/simple_shadow.dart';

class LevelEndingWidget extends StatefulWidget {
  final double initialPercent;
  final VoidCallback? onLevelsList;
  final VoidCallback? onRetry;
  final VoidCallback? onNextLevel;

  const LevelEndingWidget({
    super.key,
    this.initialPercent = 0.10,
    this.onLevelsList,
    this.onRetry,
    this.onNextLevel,
  });

  @override
  State<LevelEndingWidget> createState() => _LevelEndingWidgetState();
}

class _LevelEndingWidgetState extends State<LevelEndingWidget>
    with SingleTickerProviderStateMixin {
  late double percent;
  late Color progressColor;
  late double progress;
  late AnimationController _animationController;
  late Animation<double> _percentAnimation;

  @override
  void initState() {
    super.initState();
    percent = widget.initialPercent;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _percentAnimation = Tween<double>(begin: 0.0, end: percent).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
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
      appBar: AppBar(centerTitle: true, title: Text('Level Completed')),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    percent: _percentAnimation.value,
                    backgroundColor: Colors.black12,
                    progressColor: progressColor,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: false,
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
                                  ..color = Colors.black,
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
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.onLevelsList != null)
                      GestureDetector(
                        onTap: widget.onLevelsList,
                        child: SimpleShadow(
                          opacity: 0.5,
                          offset: const Offset(5, 5),
                          sigma: 7,
                          child: Image.asset(
                            'assets/images/progLevelsListIcon.png',
                          ),
                        ),
                      ),
                    if (widget.onLevelsList != null) const SizedBox(width: 20),
                    if (widget.onRetry != null)
                      GestureDetector(
                        onTap: widget.onRetry,
                        child: SimpleShadow(
                          opacity: 0.5,
                          offset: const Offset(5, 5),
                          sigma: 7,
                          child: Image.asset(
                            'assets/images/progLevelRetryIcon.png',
                          ),
                        ),
                      ),
                    if (widget.onRetry != null) const SizedBox(width: 20),
                    if (widget.onNextLevel != null)
                      GestureDetector(
                        onTap: widget.onNextLevel,
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
