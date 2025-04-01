import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../languages/cubits/language_cubit.dart';
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
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'あ',
                      pronun: 'a',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'い',
                      pronun: 'i',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'う',
                      pronun: 'u',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'え',
                      pronun: 'e',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'お',
                      pronun: 'o',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'か',
                      pronun: 'ka',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'き',
                      pronun: 'ki',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'く',
                      pronun: 'ku',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'け',
                      pronun: 'ke',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'こ',
                      pronun: 'ko',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'さ',
                      pronun: 'sa',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'し',
                      pronun: 'shi',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'す',
                      pronun: 'su',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'せ',
                      pronun: 'se',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'そ',
                      pronun: 'so',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'た',
                      pronun: 'ta',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ち',
                      pronun: 'chi',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'つ',
                      pronun: 'tsu',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'て',
                      pronun: 'te',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'と',
                      pronun: 'to',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'な',
                      pronun: 'na',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'に',
                      pronun: 'ni',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぬ',
                      pronun: 'nu',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ね',
                      pronun: 'ne',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'の',
                      pronun: 'no',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'は',
                      pronun: 'ha',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ひ',
                      pronun: 'hi',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ふ',
                      pronun: 'fu',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'へ',
                      pronun: 'he',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ほ',
                      pronun: 'ho',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ま',
                      pronun: 'ma',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'み',
                      pronun: 'mi',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'む',
                      pronun: 'mu',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'め',
                      pronun: 'me',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'も',
                      pronun: 'mo',
                    ),
                    Card(
                      elevation: 50,
                      shadowColor: Colors.black.withOpacity(0.2),
                      color:
                          Colors
                              .transparent, // Made transparent to show container decoration
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
                              // Decorative element with animation potential
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
                              SizedBox(height: 30),
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
                              SizedBox(height: 50),
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
                                                context
                                                    .read<LanguageCubit>()
                                                    .initializeLevels();
                                                Navigator.of(context).pop();
                                              },
                                              onNextLevel: () {
                                                context
                                                    .read<LanguageCubit>()
                                                    .nextlvl();
                                                Navigator.of(context).pop();
                                              },
                                              onRetry: () {
                                                context
                                                    .read<LanguageCubit>()
                                                    .retryLvl();
                                                Navigator.of(context).pop();
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
