import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../components/letter_card.dart';

class MrLvl1 extends StatefulWidget {
  const MrLvl1({super.key});
  @override
  State<MrLvl1> createState() => _MrLvl1State();
}

class _MrLvl1State extends State<MrLvl1> {
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
                  Text('Marathi Vowels', style: theme.textTheme.titleLarge),
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
                      lang: "mr-IN",
                      letter: 'इ',
                      pronun: 'E',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ई',
                      pronun: 'I',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'उ',
                      pronun: 'U',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ऊ',
                      pronun: 'OO',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ए',
                      pronun: 'AE',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ऐ',
                      pronun: 'AYE',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ओ',
                      pronun: 'O',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'औ',
                      pronun: 'AO',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'अं',
                      pronun: 'UM',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'अः',
                      pronun: 'AHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ऋ',
                      pronun: 'RI',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ॠ',
                      pronun: 'RRI',
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
                  14,
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
                        _currentPage < 13
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
