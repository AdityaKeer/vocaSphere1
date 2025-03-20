import 'package:flutter/material.dart';
import 'package:major_project1/features/levels/presentation/hindi_levels/hn_lvl4.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LvlEndingPage extends StatefulWidget {
  const LvlEndingPage({super.key});

  @override
  State<LvlEndingPage> createState() => _LvlEndingPageState();
}

class _LvlEndingPageState extends State<LvlEndingPage> {
  double percent = 0.10;
  late Color color;
  late double progress;
  @override
  Widget build(BuildContext context) {
    progress = (percent * 100);
    if (progress < 20.0) {
      color = Colors.red as Color;
    } else if (progress < 40.0) {
      color = Colors.orange as Color;
    } else if (progress < 60.0) {
      color = Colors.yellow as Color;
    } else if (progress < 80.0) {
      color = Colors.lightGreenAccent as Color;
    } else if (progress <= 100.0) {
      color = Colors.green as Color;
    }
    return Scaffold(
      appBar: AppBar(title: Text('Level Completed'), centerTitle: true),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.42,
            image: AssetImage('assets/images/bg1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                SimpleShadow(
                  opacity: 0.5,
                  offset: Offset(5, 5), // Default: Offset(2, 2)
                  sigma: 7,
                  child: Image(image: AssetImage('assets/images/levelUp.png')),
                ),
                SizedBox(height: 30),
                SimpleShadow(
                  opacity: 0.5,
                  offset: Offset(5, 5), // Default: Offset(2, 2)
                  sigma: 7,
                  child: CircularPercentIndicator(
                    // progressBorderColor: Colors.black,
                    animation: true,
                    animationDuration: 1000,
                    radius: 170,
                    lineWidth: 30,
                    progressColor: color,
                    backgroundColor: Colors.black12,
                    percent: percent,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Stack(
                      children: [
                        Text(
                          '$progress %',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            foreground:
                                Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.white,
                          ),
                        ),
                        Text(
                          '$progress %',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, BtnAction.backToLvls);
                      },
                      child: SimpleShadow(
                        opacity: 0.5,
                        offset: Offset(5, 5),
                        sigma: 7,
                        child: Image(
                          image: AssetImage(
                            'assets/images/progLevelsListIcon.png',
                          ),
                        ),
                      ),
                    ),

                    SimpleShadow(
                      opacity: 0.5,
                      offset: Offset(5, 5), // Default: Offset(2, 2)
                      sigma: 7,
                      child: Image(
                        image: AssetImage(
                          'assets/images/progLevelRetryIcon.png',
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, BtnAction.nextLvl);
                      },
                      child: SimpleShadow(
                        opacity: 0.5,
                        offset: Offset(5, 5), // Default: Offset(2, 2)
                        sigma: 7,
                        child: Image(
                          image: AssetImage(
                            'assets/images/progLevelNextIcon.png',
                          ),
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

// Text(
// textAlign: TextAlign.center,
// '$progress %',
// style: TextStyle(
// fontStyle: FontStyle.italic,
// fontSize: 60,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
