import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../../languages/presentation/pages/kannada/kannada_page.dart';
import '../../components/lvl_endingWidget.dart';
import '../../components/word_card.dart';

class KnLvl5 extends StatefulWidget {
  const KnLvl5({super.key});
  @override
  State<KnLvl5> createState() => _KnLvl5State();
}

class _KnLvl5State extends State<KnLvl5> {
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
      appBar: AppBar(title: Text('Level 5'), centerTitle: true),
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
                      'Common Marathi Words',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    '${_currentPage + 1}/20',
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
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Namaskara",
                      engWord: '"Hello"',
                      langWord: 'ನಮಸ್ಕಾರ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Dhanyavaada",
                      engWord: '"Thank you"',
                      langWord: 'ಧನ್ಯವಾದ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Vidaya",
                      engWord: '"Goodbye"',
                      langWord: 'ವಿದಾಯ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Haudu",
                      engWord: '"Yes"',
                      langWord: 'ಹೌದು',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Illa",
                      engWord: '"No"',
                      langWord: 'ಇಲ್ಲ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Dayavittu",
                      engWord: '"Please"',
                      langWord: 'ದಯವಿಟ್ಟು',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Kshamisi",
                      engWord: '"Excuse me / Sorry"',
                      langWord: 'ಕ್ಷಮಿಸಿ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Nanannu kshamisiri",
                      engWord: '"I\'m sorry"',
                      langWord: 'ನನ್ನನ್ನು ಕ್ಷಮಿಸಿ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Shubhodaya",
                      engWord: '"Good morning"',
                      langWord: 'ಶುಭೋದಯ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Shubha saayankaala",
                      engWord: '"Good evening"',
                      langWord: 'ಶುಭ ಸಂಜೆ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Shubha raatri",
                      engWord: '"Good night"',
                      langWord: 'ಶುಭ ರಾತ್ರೆ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Nimma hesaru yenu?",
                      engWord: '"What is your name?"',
                      langWord: 'ನಿಮ್ಮ ಹೆಸರು ಏನು?',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Ninna hegiddiya?",
                      engWord: '"How are you?"',
                      langWord: 'ನೀನು ಹೇಗಿದ್ದೀಯ?',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Swagata",
                      engWord: '"Welcome"',
                      langWord: 'ಸ್ವಾಗತ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Olleya dina",
                      engWord: '"Have a nice day"',
                      langWord: 'ಒಳ್ಳೆಯ ದಿನ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Naanu kannaDa maataDuttiddene",
                      engWord: '"I can speak Kannada"',
                      langWord: 'ನಾನು ಕನ್ನಡ ಮಾತನಾಡುತ್ತೇನೆ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Nanage artha aagilla",
                      engWord: '"I don\'t understand"',
                      langWord: 'ನನಗೆ ಅರ್ಥ ಆಗಿಲ್ಲ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Yestu?",
                      engWord: '"How much?"',
                      langWord: 'ಎಷ್ಟು?',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Onde nimisha",
                      engWord: '"One moment"',
                      langWord: 'ಒಂದು ನಿಮಿಷ',
                    ),
                    WordCard(
                      flutterTts: flutterTts,
                      lang: "kn-IN",
                      pronun: "Nanna sahaya beku",
                      engWord: '"I need help"',
                      langWord: 'ನನಗೆ ಸಹಾಯ ಬೇಕು',
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
                                              initialPercent: 0.75,
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
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      21,
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
            ),

            // Navigation buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                          _currentPage < 21
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
            ),
          ],
        ),
      ),
    );
  }
}
