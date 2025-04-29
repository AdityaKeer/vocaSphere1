import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:major_project1/features/languages/presentation/pages/hindi/page/hindi_page.dart';
import 'package:major_project1/features/levels/components/number_card.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/pages/japanese/page/japanese_page.dart';
import '../../../languages/presentation/pages/kannada/kannada_page.dart';
import '../../../languages/presentation/pages/marathi/page/marathi_page.dart';
import '../../../languages/presentation/pages/telugu/page/telugu_page.dart';
import '../../components/letter_card.dart';
import '../../components/lvl_endingWidget.dart';
import '../../components/word_card.dart';

class TeLvl5 extends StatefulWidget {
  const TeLvl5({super.key});
  @override
  State<TeLvl5> createState() => _TeLvl5State();
}

class _TeLvl5State extends State<TeLvl5> {
  final FlutterTts flutterTts = FlutterTts();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Level 5'), centerTitle: true),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress indicator
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Common Telugu Words',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    '${_currentPage + 1}/20',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Main card container
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Namaskaaram",
                      engWord: '"Hello"',
                      langWord: 'నమస్కారం',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Dhanyavaadamulu",
                      engWord: '"Thank you"',
                      langWord: 'ధన్యవాదాలు',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Velosthanu",
                      engWord: '"Goodbye"',
                      langWord: 'వెళ్తున్నాను',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Avunu",
                      engWord: '"Yes"',
                      langWord: 'అవును',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Kaadu",
                      engWord: '"No"',
                      langWord: 'కాదు',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Dayachesi",
                      engWord: '"Please"',
                      langWord: 'దయచేసి',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Kshaminchandi",
                      engWord: '"Sorry / Excuse me"',
                      langWord: 'క్షమించండి',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Naaku teliyadu",
                      engWord: '"I don’t know"',
                      langWord: 'నాకు తెలియదు',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Meeru ela unnaaru?",
                      engWord: '"How are you?"',
                      langWord: 'మీరు ఎలా ఉన్నారు?',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Nenu baagunnaanu",
                      engWord: '"I am fine"',
                      langWord: 'నేను బాగున్నాను',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Mee peru emiti?",
                      engWord: '"What is your name?"',
                      langWord: 'మీ పేరు ఏమిటి?',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Na peru Rahul",
                      engWord: '"My name is Rahul"',
                      langWord: 'నా పేరు రాహుల్',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Swagatham",
                      engWord: '"Welcome"',
                      langWord: 'స్వాగతం',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Shubhodhayam",
                      engWord: '"Good morning"',
                      langWord: 'శుభోదయం',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Shubha saayantram",
                      engWord: '"Good evening"',
                      langWord: 'శుభ సాయంత్రం',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Shubha raatri",
                      engWord: '"Good night"',
                      langWord: 'శుభ రాత్రి',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Nenu Telugu maatladagalanu",
                      engWord: '"I can speak Telugu"',
                      langWord: 'నేను తెలుగు మాట్లాడగలను',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Ardham kaaledu",
                      engWord: '"I don’t understand"',
                      langWord: 'అర్ధం కాలేదు',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Idi enta?",
                      engWord: '"How much is this?"',
                      langWord: 'ఇది ఎంత?',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "te-IN",
                      pronun: "Naaku sahayam kaavali",
                      engWord: '"I need help"',
                      langWord: 'నాకు సహాయం కావాలి',
                    ),

                    Card(
                      elevation: 50,
                      shadowColor: Colors.black.withOpacity(0.2),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SizedBox(
                        width: 350,
                        height: 550,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.blue[50]!,
                                Colors.purple[50]!,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      Theme.of(
                                        context,
                                      ).colorScheme.primary.withOpacity(0.3),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.star_rounded,
                                    size: 80,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.8),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Well Done',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey[900],
                                  letterSpacing: 1.5,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: Offset(2, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Great Achievement!',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    foregroundColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
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
                                              initialPercent: 0.75,
                                              onLevelsList: () {
                                                final languageCubit =
                                                    context
                                                        .read<LanguageCubit>();
                                                languageCubit.emit(
                                                  LevelListUpdated(
                                                    levelPages:
                                                        languageCubit
                                                            .levelPages,
                                                  ),
                                                );

                                                Navigator.of(
                                                  context,
                                                ).pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            const TeluguPage(),
                                                  ),
                                                  (route) =>
                                                      route
                                                          .isFirst, // Keep only the home page in the stack
                                                );
                                              },
                                              onNextLevel: () {
                                                final languageCubit =
                                                    context
                                                        .read<LanguageCubit>();

                                                languageCubit
                                                    .nextlvl(); // Save progress & move to next level

                                                String? nextLevel =
                                                    languageCubit.currentLevel;

                                                if (nextLevel != null &&
                                                    languageCubit.levelPages
                                                        .containsKey(
                                                          nextLevel,
                                                        )) {
                                                  Navigator.of(
                                                    context,
                                                  ).pushReplacement(
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
                                                  duration: Duration(
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
                                  child: Row(
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Navigation dots
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      21,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 10,
                        width: _currentPage == index ? 20 : 10,
                        decoration: BoxDecoration(
                          color:
                              _currentPage == index
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Navigation buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed:
                        _currentPage > 0
                            ? () {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      foregroundColor: theme.colorScheme.onSecondaryContainer,
                      disabledBackgroundColor: theme.colorScheme.secondary
                          .withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_rounded, size: 20),
                        SizedBox(width: 8),
                        Text('Previous'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        _currentPage < 21
                            ? () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      disabledBackgroundColor: theme.colorScheme.primary
                          .withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Next'),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
