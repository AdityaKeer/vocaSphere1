import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../components/letter_card.dart';

class SaLvl2 extends StatefulWidget {
  const SaLvl2({super.key});
  @override
  State<SaLvl2> createState() => _SaLvl2State();
}

class _SaLvl2State extends State<SaLvl2> {
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
                  Text(
                    'Sanskrit Consonants(व्यंजन)',
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
                      lang: "mr-IN",
                      letter: 'क',
                      pronun: 'Ka',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ख',
                      pronun: 'KHa',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ग',
                      pronun: 'Ga',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'घ',
                      pronun: 'GHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ङ',
                      pronun: 'unga',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'च',
                      pronun: 'CA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'छ',
                      pronun: 'CHHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ज',
                      pronun: 'JA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'झ',
                      pronun: 'JHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ञ',
                      pronun: 'NYA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ट',
                      pronun: 'TA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ठ',
                      pronun: 'THH',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ड',
                      pronun: 'DA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ढ',
                      pronun: 'DHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ण',
                      pronun: 'N',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'त',
                      pronun: 'T',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'थ',
                      pronun: 'THA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'द',
                      pronun: 'D',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ध',
                      pronun: 'DHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'न',
                      pronun: 'NA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'प',
                      pronun: 'P',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'फ',
                      pronun: 'FA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ब',
                      pronun: 'B',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'भ',
                      pronun: 'BHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'म',
                      pronun: 'MA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'य',
                      pronun: 'Y',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'र',
                      pronun: 'R',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ल',
                      pronun: 'LA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'व',
                      pronun: 'V',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'श',
                      pronun: 'SHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ष',
                      pronun: 'SHHA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'स',
                      pronun: 'SA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ह',
                      pronun: 'HA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'क्ष',
                      pronun: 'KSH',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'त्र',
                      pronun: 'TRA',
                    ),
                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "mr-IN",
                      letter: 'ज्ञ',
                      pronun: 'GYA',
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
