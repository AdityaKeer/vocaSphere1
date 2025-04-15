import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  bool isAnswered = false;
  String? _selectedAnswer;

  List<DocumentSnapshot> questions = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('questions').get();
    setState(() {
      questions = snapshot.docs;
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        _selectedAnswer = null;
        isAnswered = false;
      });
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Quiz Completed!'),
              content: Text('Your Score: $score / ${questions.length}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      currentIndex = 0;
                      score = 0;
                      _selectedAnswer = null;
                      isAnswered = false;
                    });
                  },
                  child: const Text('Restart'),
                ),
              ],
            ),
      );
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _selectedAnswer = null;
        isAnswered = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Level 1')),
        backgroundColor: Colors.black,
        body: const Center(
          child: CircularProgressIndicator(color: Colors.green),
        ),
      );
    }

    final currentQuestion = questions[currentIndex];
    final questionText = currentQuestion['question'];
    final options = List<String>.from(currentQuestion['options']);
    final correctOption = currentQuestion['answer'];

    return Scaffold(
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
                  colors: [Color(0xFFCCF45F), Colors.green],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Score: $score / ${questions.length}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value:
                              questions.isEmpty ? 0 : score / questions.length,
                          minHeight: 8,
                          backgroundColor: Colors.grey.shade300,
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                  ),

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
                        options.map((option) {
                          Color bgColor = Colors.white;
                          if (_selectedAnswer != null) {
                            if (option == correctOption &&
                                option == _selectedAnswer) {
                              bgColor = Colors.green;
                            } else if (option == _selectedAnswer &&
                                _selectedAnswer != correctOption) {
                              bgColor = Colors.red;
                            }
                          }

                          return OptionButton(
                            bgColor: bgColor,
                            text: option,
                            onTap: () {
                              if (!isAnswered) {
                                if (option == correctOption) {
                                  score++;
                                }
                                _selectedAnswer = option;
                                isAnswered = true;
                                setState(() {});
                              }
                            },
                          );
                        }).toList(),
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

class OptionButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color bgColor;

  const OptionButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const NavigationButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
