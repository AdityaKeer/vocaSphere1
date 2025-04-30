import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/pages/chinese/page/chinese_page.dart';
import '../../components/letter_card.dart';
import '../../components/lvl_endingWidget.dart';

class ZhLvl2 extends StatefulWidget {
  const ZhLvl2({super.key});

  @override
  State<ZhLvl2> createState() => _ZhLvl2State();
}

class _ZhLvl2State extends State<ZhLvl2> {
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
                  Text('Chinese Finals', style: theme.textTheme.titleLarge),
                  Spacer(),
                  Text(
                    '${_currentPage + 1}/24',
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
                      letter: '阿', // ā
                      pronun: 'ā',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '哦', // ō
                      pronun: 'ō',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '鹅', // ē
                      pronun: 'ē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '衣', // ī
                      pronun: 'ī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '乌', // ū
                      pronun: 'ū',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '玉', // ǖ (closest for ü sound)
                      pronun: 'ǖ',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '爱', // āi
                      pronun: 'āi',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '诶', // ēi
                      pronun: 'ēi',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '威', // uī
                      pronun: 'uī',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '熬', // āo
                      pronun: 'āo',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '欧', // ōu
                      pronun: 'ōu',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '优', // iū
                      pronun: 'iū',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '耶', // iē
                      pronun: 'iē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '约', // üē
                      pronun: 'üē',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '儿', // ēr
                      pronun: 'ēr',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '安', // ān
                      pronun: 'ān',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '恩', // ēn
                      pronun: 'ēn',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '因', // īn
                      pronun: 'īn',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '温', // ūn
                      pronun: 'ūn',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '云', // ǖn
                      pronun: 'ǖn',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '昂', // āng
                      pronun: 'āng',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '鞥', // ēng (rare character, but fits)
                      pronun: 'ēng',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '英', // īng
                      pronun: 'īng',
                    ),

                    LetterCard(
                      flutterTts: flutterTts,
                      lang: "zh-CN",
                      letter: '翁', // ōng
                      pronun: 'ōng',
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
                                                            const ChinesePage(),
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
                    25,
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
