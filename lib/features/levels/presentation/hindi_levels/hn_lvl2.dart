import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/pages/hindi/page/hindi_page.dart';
import '../../components/letter_card.dart';
import '../../components/lvl_endingWidget.dart';

class HnLvl2 extends StatefulWidget {
  const HnLvl2({super.key});
  @override
  State<HnLvl2> createState() => _HnLvl2State();
}

class _HnLvl2State extends State<HnLvl2> {
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
      appBar: AppBar(title: Text('Level 2'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Text(
                    'Hindi Consonants(व्यंजन)',
                    style: theme.textTheme.titleLarge,
                  ),
                  Spacer(),
                  Text(
                    '${_currentPage + 1}/36',
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
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'क',
                      pronun: 'Ka',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ख',
                      pronun: 'KHa',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ग',
                      pronun: 'Ga',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'घ',
                      pronun: 'GHA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ङ',
                      pronun: 'unga',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'च',
                      pronun: 'CA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'छ',
                      pronun: 'CHHA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ज',
                      pronun: 'JA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'झ',
                      pronun: 'JHA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ञ',
                      pronun: 'NYA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ट',
                      pronun: 'TA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ठ',
                      pronun: 'THH',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ड',
                      pronun: 'DA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ढ',
                      pronun: 'DHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ण',
                      pronun: 'N',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'त',
                      pronun: 'T',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'थ',
                      pronun: 'THA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'द',
                      pronun: 'D',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ध',
                      pronun: 'DHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'न',
                      pronun: 'NA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'प',
                      pronun: 'P',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'फ',
                      pronun: 'FA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ब',
                      pronun: 'B',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'भ',
                      pronun: 'BHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'म',
                      pronun: 'MA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'य',
                      pronun: 'Y',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'र',
                      pronun: 'R',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ल',
                      pronun: 'LA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'व',
                      pronun: 'V',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'श',
                      pronun: 'SHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ष',
                      pronun: 'SHHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'स',
                      pronun: 'SA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ह',
                      pronun: 'HA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'क्ष',
                      pronun: 'KSH',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'त्र',
                      pronun: 'TRA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ज्ञ',
                      pronun: 'GYA',
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
                                              initialPercent: 0.30,
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    36,
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
                        _currentPage < 36
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
