import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../components/letter_card.dart';

class EnLvl1 extends StatefulWidget {
  const EnLvl1({super.key});
  @override
  State<EnLvl1> createState() => _EnLvl1State();
}

class _EnLvl1State extends State<EnLvl1> {
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
                  Text('English Alphabets', style: theme.textTheme.titleLarge),
                  Spacer(),
                  Text(
                    '${_currentPage + 1}/26',
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
                      lang: "en-US",
                      letter: 'A',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'B',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'C',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'D',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'E',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'F',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'G',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'H',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'I',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'J',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'K',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'L',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'M',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'N',
                      pronun: '-',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'O',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'P',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'Q',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'R',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'S',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'T',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'U',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'V',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'W',
                      pronun: '-',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'X',
                      pronun: '-',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'Y',
                      pronun: '-',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "en-US",
                      letter: 'Z',
                      pronun: '-',
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
                    26,
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
                        _currentPage < 26
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
