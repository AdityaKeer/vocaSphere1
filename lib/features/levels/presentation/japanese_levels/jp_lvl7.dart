import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/pages/japanese/page/japanese_page.dart';
import '../../components/lvl_endingWidget.dart';

class JpLvl7 extends StatefulWidget {
  const JpLvl7({super.key});

  @override
  State<JpLvl7> createState() => _JpLvl7State();
}

class _JpLvl7State extends State<JpLvl7> {
  final FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  int score = 0;
  List<DocumentSnapshot> questions = [];

  Map<int, String> selectedAnswers = {};

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('japaneseQuiz').get();
    setState(() {
      questions = snapshot.docs;
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("ja-JP");
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }

  void handleAnswerTap(String option, String correctAnswer) async {
    await _speak(option);

    if (selectedAnswers[currentIndex] == null) {
      if (option == correctAnswer) {
        score++;
      }
    }

    setState(() {
      selectedAnswers[currentIndex] = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(color: Colors.deepPurple),
        ),
      );
    }

    final currentQuestion = questions[currentIndex];
    final questionText = currentQuestion['question'];
    final options = List<String>.from(currentQuestion['options']);
    final correctAnswer = currentQuestion['answer'];

    final double progress = (currentIndex + 1) / questions.length;
    final String? selectedAnswer = selectedAnswers[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Level 6'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Progress: ${(progress * 100).toInt()}%',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Score: $score',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              color: Colors.deepPurple,
              backgroundColor: Colors.grey.shade300,
              minHeight: 10,
              borderRadius: BorderRadius.circular(8),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                questionText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ...options.map((option) {
              bool isSelected = selectedAnswer == option;
              bool isCorrect = option == correctAnswer;

              Color optionColor() {
                if (selectedAnswer == null) return Colors.white;
                if (isSelected && isCorrect) return Colors.green;
                if (isSelected && !isCorrect) return Colors.red;
                return Colors.white;
              }

              return GestureDetector(
                onTap: () => handleAnswerTap(option, correctAnswer),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: optionColor(),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.circle_outlined),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: previousQuestion,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: const Text(
                    "Previous",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
                currentIndex == questions.length - 1
                    ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 10,
                        shadowColor: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.3),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder:
                                (context) => LevelEndingWidget(
                                  initialPercent: 0.25,
                                  onLevelsList: () {
                                    final languageCubit =
                                        context.read<LanguageCubit>();
                                    languageCubit.emit(
                                      LevelListUpdated(
                                        levelPages: languageCubit.levelPages,
                                      ),
                                    );
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const JapanesePage(),
                                      ),
                                      (route) => route.isFirst,
                                    );
                                  },
                                  onNextLevel: () {
                                    Navigator.of(context).pop();
                                    final languageCubit =
                                        context.read<LanguageCubit>();
                                    languageCubit.nextlvl();
                                    String? nextLevel =
                                        languageCubit.currentLevel;
                                    if (nextLevel != null &&
                                        languageCubit.levelPages.containsKey(
                                          nextLevel,
                                        )) {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  languageCubit
                                                      .levelPages[nextLevel]!,
                                        ),
                                      );
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  onRetry: () {
                                    Navigator.of(context).pop();
                                    _currentPage = 0;
                                    _pageController.animateToPage(
                                      _currentPage,
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      curve: Curves.linear,
                                    );
                                    setState(() {});
                                  },
                                ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Satisfied?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                    : ElevatedButton.icon(
                      onPressed: nextQuestion,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
