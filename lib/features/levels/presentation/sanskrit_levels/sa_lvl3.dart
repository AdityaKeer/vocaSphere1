import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/languages/presentation/pages/marathi/page/marathi_page.dart';
import 'package:major_project1/features/languages/presentation/pages/sanskrit/page/sanskrit_page.dart';
import 'package:major_project1/features/levels/components/lvl_endingWidget.dart';
import '../../../languages/cubits/language_cubit.dart';
import '../../../languages/cubits/language_state.dart';
import '../../Models/item_model.dart';
import '../../utilities/constants.dart';

class SaLvl3 extends StatefulWidget {
  const SaLvl3({super.key});

  @override
  State<SaLvl3> createState() => _SaLvl3State();
}

class _SaLvl3State extends State<SaLvl3> with SingleTickerProviderStateMixin {
  late List<ItemModel> dataSource;
  late List<ItemModel> letters;
  late List<ItemModel> pronunciation;
  late int score;
  late bool gameOver;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    initGame();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initGame() {
    score = 0;
    gameOver = false;
    dataSource = kHnAlphabets;

    letters = List.generate(
      6,
      (index) => dataSource[Random().nextInt(dataSource.length - 1)],
    );
    pronunciation = List<ItemModel>.from(letters);

    letters.shuffle();
    pronunciation.shuffle();

    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (letters.isEmpty) {
      gameOver = true;
      if (!_controller.isAnimating) {
        _controller.forward();
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Reduced padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Score card with constrained height
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.stars_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Score: ",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "$score",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Game content with scrollable columns
                Expanded(
                  child:
                      !gameOver
                          ? FadeTransition(
                            opacity: _animation,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Letters column
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children:
                                          letters.map((item) {
                                            return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                  ),
                                              child: Draggable<ItemModel>(
                                                data: item,
                                                childWhenDragging: Card(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primaryContainer
                                                      .withOpacity(0.5),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          16.0,
                                                        ),
                                                    child: Center(
                                                      child: Text(
                                                        item.letter,
                                                        style: TextStyle(
                                                          color: Theme.of(
                                                                context,
                                                              )
                                                              .colorScheme
                                                              .onPrimaryContainer
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 28.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                feedback: Material(
                                                  color: Colors.transparent,
                                                  child: Card(
                                                    color:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primaryContainer,
                                                    elevation: 8,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            16.0,
                                                          ),
                                                      child: Text(
                                                        item.letter,
                                                        style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onPrimaryContainer,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 28.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                child: Card(
                                                  color:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primaryContainer,
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          16.0,
                                                        ),
                                                    child: Center(
                                                      child: Text(
                                                        item.letter,
                                                        style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onPrimaryContainer,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 28.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                // Pronunciation column
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children:
                                          pronunciation.map((item) {
                                            return DragTarget<ItemModel>(
                                              onAccept: (receivedItem) {
                                                if (item.value ==
                                                    receivedItem.value) {
                                                  setState(() {
                                                    letters.remove(
                                                      receivedItem,
                                                    );
                                                    pronunciation.remove(item);
                                                    score += 10;
                                                    item.accepting = false;
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Correct match! +10 points',
                                                        ),
                                                        backgroundColor:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .secondary,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                        duration:
                                                            const Duration(
                                                              milliseconds: 800,
                                                            ),
                                                      ),
                                                    );
                                                  });
                                                } else {
                                                  setState(() {
                                                    score -= 5;
                                                    item.accepting = false;
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Wrong match! -5 points',
                                                        ),
                                                        backgroundColor:
                                                            Colors.redAccent,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                        duration:
                                                            const Duration(
                                                              milliseconds: 800,
                                                            ),
                                                      ),
                                                    );
                                                  });
                                                }
                                              },
                                              onLeave: (receivedItem) {
                                                setState(
                                                  () => item.accepting = false,
                                                );
                                              },
                                              onWillAccept: (receivedItem) {
                                                setState(
                                                  () => item.accepting = true,
                                                );
                                                return true;
                                              },
                                              builder:
                                                  (
                                                    context,
                                                    candidateData,
                                                    rejectedData,
                                                  ) => Container(
                                                    margin:
                                                        const EdgeInsets.symmetric(
                                                          vertical: 8.0,
                                                        ),
                                                    child: Card(
                                                      color:
                                                          item.accepting
                                                              ? Theme.of(
                                                                    context,
                                                                  )
                                                                  .colorScheme
                                                                  .secondaryContainer
                                                              : Theme.of(
                                                                    context,
                                                                  )
                                                                  .colorScheme
                                                                  .surface,
                                                      elevation: 4,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                        side:
                                                            item.accepting
                                                                ? BorderSide(
                                                                  color:
                                                                      Theme.of(
                                                                        context,
                                                                      ).colorScheme.secondary,
                                                                  width: 2.0,
                                                                )
                                                                : BorderSide
                                                                    .none,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              16.0,
                                                            ),
                                                        child: Center(
                                                          child: Text(
                                                            item.pnoun,
                                                            style: TextStyle(
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .secondary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 28.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            );
                                          }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : ScaleTransition(
                            scale: _animation,
                            child: Center(
                              child: Card(
                                elevation: 16,
                                shadowColor: Colors.black.withOpacity(0.25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: SizedBox(
                                  width: 350,
                                  height: 650, // Kept at 650
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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.15),
                                          blurRadius: 25,
                                          spreadRadius: 5,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        32.0,
                                      ), // Increased padding for luxury feel
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Top Decorative Element
                                          Column(
                                            children: [
                                              SizedBox(height: 20),
                                              Container(
                                                width: 140,
                                                height: 140,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary
                                                          .withOpacity(0.2),
                                                      blurRadius: 15,
                                                      spreadRadius: 2,
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.emoji_events_rounded,
                                                    size: 100,
                                                    color:
                                                        Theme.of(
                                                          context,
                                                        ).colorScheme.tertiary,
                                                    shadows: [
                                                      Shadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        blurRadius: 12,
                                                        offset: Offset(0, 7),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Center Content
                                          Column(
                                            children: [
                                              Text(
                                                'Well Done!',
                                                style: TextStyle(
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.onSurface,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 40,
                                                  letterSpacing: 2.0,
                                                  shadows: [
                                                    Shadow(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary
                                                          .withOpacity(0.4),
                                                      blurRadius: 10,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 20),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 14,
                                                    ),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .secondary
                                                          .withOpacity(0.2),
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .secondary
                                                          .withOpacity(0.1),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                        .withOpacity(0.6),
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Final Score: $score',
                                                  style: TextStyle(
                                                    // color:
                                                    //     Theme.of(
                                                    //       context,
                                                    //     ).colorScheme.secondary,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 30,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                          // Bottom Button
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 20,
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                                foregroundColor:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.onPrimary,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 48,
                                                      vertical: 18,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                elevation: 12,
                                                shadowColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withOpacity(0.5),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder:
                                                        (
                                                          context,
                                                        ) => LevelEndingWidget(
                                                          initialPercent: 0.25,
                                                          onLevelsList: () {
                                                            final languageCubit =
                                                                context
                                                                    .read<
                                                                      LanguageCubit
                                                                    >();
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
                                                                        const SanskritPage(),
                                                              ),
                                                              (route) =>
                                                                  route
                                                                      .isFirst, // Keep only the home page in the stack
                                                            );
                                                          },
                                                          onNextLevel: () {
                                                            final languageCubit =
                                                                context
                                                                    .read<
                                                                      LanguageCubit
                                                                    >();

                                                            languageCubit
                                                                .nextlvl(); // Save progress & move to next level

                                                            String? nextLevel =
                                                                languageCubit
                                                                    .currentLevel;

                                                            if (nextLevel !=
                                                                    null &&
                                                                languageCubit
                                                                    .levelPages
                                                                    .containsKey(
                                                                      nextLevel,
                                                                    )) {
                                                              Navigator.of(
                                                                context,
                                                              ).pushReplacement(
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (
                                                                        context,
                                                                      ) =>
                                                                          languageCubit
                                                                              .levelPages[nextLevel]!,
                                                                ),
                                                              );
                                                            } else {
                                                              Navigator.of(
                                                                context,
                                                              ).pop();
                                                            }
                                                          },
                                                          onRetry: () {
                                                            initGame();
                                                            setState(() {});
                                                            Navigator.of(
                                                              context,
                                                            ).pop();
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
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1.2,
                                                    ),
                                                  ),
                                                  SizedBox(width: 12),
                                                  Icon(
                                                    Icons.arrow_forward_rounded,
                                                    size: 24,
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
                              ),
                            ),
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
