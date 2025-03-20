import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:flutter_quiz_matcher/models/model.dart';

import '../../../authentication/presentation/cubits/auth_cubit.dart';

class HnLvl3 extends StatefulWidget {
  const HnLvl3({super.key});

  @override
  State<HnLvl3> createState() => _HnLvl3State();
}

class _HnLvl3State extends State<HnLvl3> {
  List<String> listImagesLocations = [
    'assets/images/level1.png',
    'assets/images/level2.png',
    'assets/images/level3.png',
    'assets/images/level4.png',
  ];
  List<String> listAnswer = ['1', '2', '3', '4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LEVEL 3')),
      body: SafeArea(
        child: QuizMatcher(
          questions: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: 100,
              height: 100,
              child: Image.asset(listImagesLocations[0]),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: 100,
              height: 100,
              child: Image.asset(listImagesLocations[1]),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: 100,
              height: 100,
              child: Image.asset(listImagesLocations[2]),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: 100,
              height: 100,
              child: Image.asset(listImagesLocations[3]),
            ),
          ],
          answers: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: 100,
              height: 100,
              child: Text(listAnswer[0]),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: 100,
              height: 100,
              child: Text(listAnswer[1]),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: 100,
              height: 100,
              child: Text(listAnswer[2]),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              width: 100,
              height: 100,
              child: Text(listAnswer[3]),
            ),
          ],
          onScoreUpdated: (UserScore userAnswers) {
            if (kDebugMode) {
              print(userAnswers.questionIndex);
            }
            if (kDebugMode) {
              print(userAnswers.questionAnswer);
            }
          },
          defaultLineColor: Colors.black,
          correctLineColor: Colors.green,
          incorrectLineColor: Colors.red,
          drawingLineColor: Colors.grey,
          paddingAround: const EdgeInsets.all(8),
        ),
      ),
    );
  }
}
