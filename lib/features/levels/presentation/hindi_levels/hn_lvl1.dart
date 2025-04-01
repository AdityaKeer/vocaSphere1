import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../components/letter_card.dart';
import '../../components/lvl_endingWidget.dart';

class HnLvl1 extends StatefulWidget {
  const HnLvl1({super.key});
  @override
  State<HnLvl1> createState() => _HnLvl1State();
}

class _HnLvl1State extends State<HnLvl1> {
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
          children: [
            // Progress indicator
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Text('Hindi Vowels', style: theme.textTheme.titleLarge),
                  Spacer(),
                  Text(
                    '${_currentPage + 1}/14',
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
                      lang: "mr-IN",
                      letter: 'अ',
                      pronun: 'A',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'आ',
                      pronun: 'AA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'इ',
                      pronun: 'E',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ई',
                      pronun: 'I',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'उ',
                      pronun: 'U',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ऊ',
                      pronun: 'OO',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ए',
                      pronun: 'AE',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ऐ',
                      pronun: 'AYE',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ओ',
                      pronun: 'O',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'औ',
                      pronun: 'AO',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'अं',
                      pronun: 'UM',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'अः',
                      pronun: 'AHA',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ऋ',
                      pronun: 'RI',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "hi-IN",
                      letter: 'ॠ',
                      pronun: 'RRI',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  15,
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
                        _currentPage < 14
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
