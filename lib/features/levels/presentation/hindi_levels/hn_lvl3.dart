import 'dart:math';

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
    return Center(child: QuestionCard(initialScore: 5));
  }
}

class QuestionCard extends StatefulWidget {
  final int initialScore;

  const QuestionCard({super.key, required this.initialScore});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>
    with SingleTickerProviderStateMixin {
  late List<Question> allQuestions;
  late Question currentQuestion;
  late AnimationController _controller;
  late Animation<double> _animation;
  int score = 0;

  @override
  void initState() {
    super.initState();
    score = widget.initialScore;
    allQuestions = questions;
    currentQuestion = allQuestions[Random().nextInt(allQuestions.length)];
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void loadRandomQuestion() {
    final random = Random();
    Question newQuestion;
    do {
      newQuestion = allQuestions[random.nextInt(allQuestions.length)];
    } while (newQuestion.questionText == currentQuestion.questionText);
    setState(() {
      currentQuestion = newQuestion;
      _controller.reset();
      _controller.forward();
    });
  }

  void checkAnswer(String selectedOption) {
    if (selectedOption == currentQuestion.correctAnswer) {
      setState(() {
        score += 10;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Correct! +10 points'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          duration: Duration(milliseconds: 1000),
        ),
      );
    } else {
      setState(() {
        score -= 5;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect! -5 points'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          duration: Duration(milliseconds: 1000),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      shadowColor: Colors.black.withOpacity(0.25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        width: 350,
        height: 650, // Kept at 650
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.primary.withOpacity(0.2),
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ],
              stops: [0.0, 0.7, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
                blurRadius: 25,
                spreadRadius: 5,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: // Inside the SizedBox, replace SingleChildScrollView with:
              Padding(
            padding: const EdgeInsets.all(24.0), // Reduced from 32.0
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ), // Reduced padding
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.6),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Score: $score',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 20, // Reduced from 24
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Reduced from 30
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    currentQuestion.questionText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w900,
                      fontSize: 28, // Reduced from 32
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.4),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20), // Reduced from 40
                ...currentQuestion.options
                    .map(
                      (option) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ), // Reduced from 10
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                            foregroundColor:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ), // Reduced padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 6,
                          ),
                          onPressed: () => checkAnswer(option),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ), // Reduced from 18
                          ),
                        ),
                      ),
                    )
                    .toList(),
                SizedBox(height: 20), // Reduced from 30
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 40,
                    ), // Reduced padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 12,
                    shadowColor: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.5),
                  ),
                  onPressed: loadRandomQuestion,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20, // Reduced from 22
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(width: 10), // Reduced from 12
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 22,
                        color: Colors.white, // Reduced from 24
                      ),
                    ],
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

// Question model and sample data (unchanged)
class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}

final List<Question> questions = [
  Question(
    questionText: "What is the capital of France?",
    options: ["Paris", "London", "Berlin", "Madrid"],
    correctAnswer: "Paris",
  ),
  Question(
    questionText: "Which planet is known as the Red Planet?",
    options: ["Venus", "Mars", "Jupiter", "Saturn"],
    correctAnswer: "Mars",
  ),
  Question(
    questionText: "What is 2 + 2?",
    options: ["3", "4", "5", "6"],
    correctAnswer: "4",
  ),
];
