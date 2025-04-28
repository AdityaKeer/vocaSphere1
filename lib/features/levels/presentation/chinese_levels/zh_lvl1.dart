import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/pages/chinese/page/chinese_page.dart';
import '../../../languages/presentation/pages/hindi/page/hindi_page.dart';
import '../../components/letter_card.dart';
import '../../components/lvl_endingWidget.dart';

class ZhLvl1 extends StatefulWidget {
  const ZhLvl1({super.key});

  @override
  State<ZhLvl1> createState() => _ZhLvl1State();
}

class _ZhLvl1State extends State<ZhLvl1> {
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
      appBar: AppBar(title: Text('Level 1'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Text('Chinese Initials', style: theme.textTheme.titleLarge),
                  Spacer(),
                  Text(
                    '${_currentPage + 1}/21',
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
                      lang: "zh-CN",
                      letter: 'b',
                      pronun: 'bō',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: 'p',
                      pronun: 'pō',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: 'm',
                      pronun: 'mō',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '佛', // fō
                      pronun: 'fō',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '德', // dē
                      pronun: 'dē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '特', // tē
                      pronun: 'tē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '呢', // nē
                      pronun: 'nē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '勒', // lē
                      pronun: 'lē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '哥', // gē
                      pronun: 'gē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '科', // kē
                      pronun: 'kē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '喝', // hē
                      pronun: 'hē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '机', // jī
                      pronun: 'jī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '七', // qī
                      pronun: 'qī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '西', // xī
                      pronun: 'xī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '知', // zhī
                      pronun: 'zhī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '吃', // chī
                      pronun: 'chī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '诗', // shī
                      pronun: 'shī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '日', // rī
                      pronun: 'rī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '资', // zī
                      pronun: 'zī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '刺', // cī
                      pronun: 'cī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '思', // sī
                      pronun: 'sī',
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
                                    Navigator.of(context).pushReplacement(
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
                                                            const ChinesePage(),
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
                    22,
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
                        _currentPage < 23
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
