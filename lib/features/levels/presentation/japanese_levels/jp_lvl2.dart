import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/components/levels_list.dart';
import '../../../languages/presentation/pages/japanese/page/japanese_page.dart';
import '../../components/japanese_card.dart';
import '../../components/letter_card.dart';
import '../../components/lvl_endingWidget.dart';

class JpLvl2 extends StatefulWidget {
  const JpLvl2({super.key});
  @override
  State<JpLvl2> createState() => _JpLvl2State();
}

class _JpLvl2State extends State<JpLvl2> {
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
                    '${_currentPage + 1}/40',
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
                      letter: 'や',
                      pronun: 'ya',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ゆ',
                      pronun: 'yu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'よ',
                      pronun: 'yo',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ら',
                      pronun: 'ra',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'り',
                      pronun: 'ri',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'る',
                      pronun: 'ru',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'れ',
                      pronun: 're',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ろ',
                      pronun: 'ro',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ゔ',
                      pronun: 'v',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ん',
                      pronun: 'n',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'わ',
                      pronun: 'wa',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ゐ',
                      pronun: 'wi',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ゑ',
                      pronun: 'we',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'を',
                      pronun: 'wo',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'が',
                      pronun: 'ga',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぎ',
                      pronun: 'gi',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぐ',
                      pronun: 'gu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'げ',
                      pronun: 'ge',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ご',
                      pronun: 'ge',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ざ',
                      pronun: 'za',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'じ',
                      pronun: 'ji',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ず',
                      pronun: 'zu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぜ',
                      pronun: 'ze',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぞ',
                      pronun: 'zo',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'だ',
                      pronun: 'da',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぢ',
                      pronun: 'dji',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'づ',
                      pronun: 'dzu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'で',
                      pronun: 'de',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ど',
                      pronun: 'do',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ば',
                      pronun: 'ba',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'び',
                      pronun: 'bi',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぶ',
                      pronun: 'bu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'べ',
                      pronun: 'be',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぼ',
                      pronun: 'bo',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぱ',
                      pronun: 'pa',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぴ',
                      pronun: 'pi',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぷ',
                      pronun: 'pu',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぺ',
                      pronun: 'pe',
                    ),
                    JapaneseCard(
                      flutterTts: flutterTts,
                      lang: "ja-JP",
                      letter: 'ぽ',
                      pronun: 'po',
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
                                                            const JapanesePage(),
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
                        _currentPage < 40
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
