import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:major_project1/features/languages/presentation/pages/hindi/page/hindi_page.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../components/lvl_endingWidget.dart';
import '../../components/word_card.dart';

class HnLvl5 extends StatefulWidget {
  const HnLvl5({super.key});
  @override
  State<HnLvl5> createState() => _HnLvl5State();
}

class _HnLvl5State extends State<HnLvl5> {
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
                      'Common Marathi Words',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    '${_currentPage + 1}/11',
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
                      lang: "hi-IN",

                      pronun: "namaste",
                      engWord: '"Hello"',
                      langWord: 'नमस्ते',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Dhanyavada",
                      engWord: '"Thank you"',
                      langWord: 'धन्यवाद',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Alavida",
                      engWord: '"Goodbye"',
                      langWord: 'निअलविदा',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Haan",
                      engWord: '"Yes"',
                      langWord: 'हाँ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Nahin",
                      engWord: '"No"',
                      langWord: 'नहीं',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Kruupaya",
                      engWord: '"Please"',
                      langWord: 'कृपया',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Kshama karen",
                      engWord: '"Excuse me / Sorry"',
                      langWord: 'क्षमा करें',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Mujhe maaf karen",
                      engWord: '"I\'m sorry"',
                      langWord: 'मुझे माफ़ करें',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Shubh prabhaat",
                      engWord: '"Good morning"',
                      langWord: 'शुभ प्रभात',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Shubha sandhya",
                      engWord: '"Good evening"',
                      langWord: 'शुभ संध्या',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",

                      pronun: "Shubha ratri",
                      engWord: '"Good Night"',
                      langWord: 'शुभ रात्री',
                    ),
                    Card(
                      elevation: 50,
                      shadowColor: Colors.black.withAlpha((0.2 * 255).toInt()),
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
                                color: Colors.grey.withAlpha(
                                  (0.1 * 255).toInt(),
                                ),
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
                                      Theme.of(context).colorScheme.primary
                                          .withAlpha((0.3 * 255).toInt()),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.star_rounded,
                                    size: 80,
                                    color: Theme.of(context).colorScheme.primary
                                        .withAlpha((0.8 * 255).toInt()),
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
                                      color: Colors.grey.withAlpha(
                                        (0.3 * 255).toInt(),
                                      ),
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
                                    shadowColor: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withAlpha((0.3 * 255).toInt()),
                                  ),
                                  onPressed: () async {
                                    await Navigator.of(context).push(
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
                                                            const HindiPage(),
                                                  ),
                                                  (route) => route.isFirst,
                                                );
                                              },
                                              onNextLevel: () {
                                                final languageCubit =
                                                    context
                                                        .read<LanguageCubit>();
                                                languageCubit.nextlvl();
                                                String? nextLevel =
                                                    languageCubit.currentLevel;
                                                if (nextLevel != null &&
                                                    languageCubit.levelPages
                                                        .containsKey(
                                                          nextLevel,
                                                        )) {
                                                  Navigator.of(context).pop();
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
                                                Navigator.of(
                                                  context,
                                                ).pop(); // Close the LevelEndingWidget
                                                setState(
                                                  () => _currentPage = 0,
                                                ); // Reset the current page to 0
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                      _pageController.jumpToPage(
                                                        0,
                                                      ); // Jump to the first page
                                                    });
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
                      11,
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
                          .withAlpha((0.1 * 255).toInt()),
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
                        _currentPage < 12
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
                          .withAlpha((0.1 * 255).toInt()),
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
