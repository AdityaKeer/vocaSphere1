import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../components/quizNavBtn.dart';
import '../../components/quizOptionBtn.dart';

class MrLvl6 extends StatefulWidget {
  const MrLvl6({super.key});

  @override
  State<MrLvl6> createState() => _MrLvl6State();
}

class _MrLvl6State extends State<MrLvl6> {
  final FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  List<DocumentSnapshot> questions = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('marathiQuiz').get();
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

  String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('level 7')),
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.green)),
      );
    }
    final currentQuestion = questions[currentIndex];
    final questionText = currentQuestion['question'];
    final options = List<String>.from(currentQuestion['options']);
    var correctOption = currentQuestion['answer'];

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('level 7')),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Main Card
            Container(
              height: 420,
              width: 550,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEFF45F), Colors.amber],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // Question Box
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 66, top: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      questionText,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Options Grid
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.5,
                    children:
                        options
                            .map(
                              (option) => OptionButton(
                                bgColor:
                                    (option == _selectedAnswer &&
                                            _selectedAnswer == correctOption)
                                        ? Colors.lightGreenAccent
                                        : ((option == _selectedAnswer &&
                                                _selectedAnswer !=
                                                    correctOption)
                                            ? Colors.red
                                            : Colors.white),
                                text: option,
                                onTap: () async {
                                  await flutterTts.setLanguage("mr-IN");
                                  await flutterTts.setSpeechRate(0.20);
                                  await flutterTts.speak(option.toString());
                                  _selectedAnswer = option;
                                  setState(() {});
                                  if (option.toString() == correctOption) {
                                    print("correct");
                                  } else {
                                    print("incorrect");
                                  }
                                },
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavigationButton(
                  label: 'Previous',
                  onPressed: previousQuestion,
                ),
                const SizedBox(width: 16),
                NavigationButton(label: 'Next', onPressed: nextQuestion),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
