import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project1/features/levels/components/pronunciation_checker.dart';

class JpLvl6 extends StatefulWidget {
  const JpLvl6({super.key});

  @override
  State<JpLvl6> createState() => _JpLvl6State();
}

class _JpLvl6State extends State<JpLvl6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PronunciationChecker(correctWord: "konnichiwa")),
    );
  }
}
