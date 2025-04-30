import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/pages/hindi/page/hindi_page.dart';
import '../../../languages/presentation/pages/kannada/kannada_page.dart';
import '../../components/letter_card.dart';
import '../../components/lvl_endingWidget.dart';

class KnLvl2 extends StatefulWidget {
  const KnLvl2({super.key});
  @override
  State<KnLvl2> createState() => _KnLvl2State();
}

class _KnLvl2State extends State<KnLvl2> {
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
                  Text('Kannada Constants', style: theme.textTheme.titleLarge),
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
                      lang: "kn-IN",
                      letter: 'ಕ',
                      pronun: 'KA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಖ',
                      pronun: 'KHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಗ',
                      pronun: 'GA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಘ',
                      pronun: 'GHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಙ',
                      pronun: 'NGA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಚ',
                      pronun: 'CHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಛ',
                      pronun: 'CHHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಜ',
                      pronun: 'JA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಝ',
                      pronun: 'JHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಞ',
                      pronun: 'NYA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಟ',
                      pronun: 'TTA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಠ',
                      pronun: 'TTHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಡ',
                      pronun: 'DDA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಢ',
                      pronun: 'DDHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಣ',
                      pronun: 'NNA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ತ',
                      pronun: 'TA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಥ',
                      pronun: 'THA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ದ',
                      pronun: 'DA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಧ',
                      pronun: 'DHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ನ',
                      pronun: 'NA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಪ',
                      pronun: 'PA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಫ',
                      pronun: 'PHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಬ',
                      pronun: 'BA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಭ',
                      pronun: 'BHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಮ',
                      pronun: 'MA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಯ',
                      pronun: 'YA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ರ',
                      pronun: 'RA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಲ',
                      pronun: 'LA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ವ',
                      pronun: 'VA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಶ',
                      pronun: 'SHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಷ',
                      pronun: 'SSHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಸ',
                      pronun: 'SA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಹ',
                      pronun: 'HA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಳ',
                      pronun: 'LLA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಕ್ಷ',
                      pronun: 'KSH',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      letter: 'ಜ್ಞ',
                      pronun: 'GYA',
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
                                  onPressed: () async {
                                    final result = await Navigator.of(
                                      context,
                                    ).push(
                                      MaterialPageRoute(
                                        builder:
                                            (context) => LevelEndingWidget(
                                              initialPercent: 0.25,
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
                                                            const KannadaPage(),
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
                    37,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      height: 10,
                      width: _currentPage == index ? 24 : 10,
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
                        _currentPage < 37
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
