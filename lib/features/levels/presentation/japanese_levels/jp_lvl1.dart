import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../authentication/presentation/cubits/auth_cubit.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/components/levels_list.dart';
import '../../../languages/presentation/pages/japanese/page/japanese_page.dart';
import '../../components/japanese_card.dart';
import '../../components/letter_card.dart';
import '../../components/lvl_endingWidget.dart';

class JpLvl1 extends StatefulWidget {
  const JpLvl1({super.key});
  @override
  State<JpLvl1> createState() => _JpLvl1State();
}

class _JpLvl1State extends State<JpLvl1> {
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
                      'Japanese Alphabets(Hiragana)',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    '${_currentPage + 1}/35',
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
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'あ',
                      pronun: 'a',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'い',
                      pronun: 'i',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'う',
                      pronun: 'u',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'え',
                      pronun: 'e',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'お',
                      pronun: 'o',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'か',
                      pronun: 'ka',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'き',
                      pronun: 'ki',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'く',
                      pronun: 'ku',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'け',
                      pronun: 'ke',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'こ',
                      pronun: 'ko',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'さ',
                      pronun: 'sa',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'し',
                      pronun: 'shi',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'す',
                      pronun: 'su',
                    ),

                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'せ',
                      pronun: 'se',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'そ',
                      pronun: 'so',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'た',
                      pronun: 'ta',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ち',
                      pronun: 'chi',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'つ',
                      pronun: 'tsu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'て',
                      pronun: 'te',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'と',
                      pronun: 'to',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'な',
                      pronun: 'na',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'に',
                      pronun: 'ni',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぬ',
                      pronun: 'nu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ね',
                      pronun: 'ne',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'の',
                      pronun: 'no',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'は',
                      pronun: 'ha',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ひ',
                      pronun: 'hi',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ふ',
                      pronun: 'fu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'へ',
                      pronun: 'he',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ほ',
                      pronun: 'ho',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ま',
                      pronun: 'ma',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'み',
                      pronun: 'mi',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'む',
                      pronun: 'mu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'め',
                      pronun: 'me',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'も',
                      pronun: 'mo',
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
                                    Navigator.of(context).push(
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
                                                            const JapanesePage(),
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    38,
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
