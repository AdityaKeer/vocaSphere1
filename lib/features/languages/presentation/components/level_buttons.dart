import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/language_cubit.dart';

class LevelButton extends StatelessWidget {
  final int n;
  final double right;
  final double left;
  final VoidCallback onTap;
  final String levelName;

  const LevelButton({
    super.key,
    required this.n,
    required this.onTap,
    required this.right,
    required this.left,
    required this.levelName,
  });

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<LanguageCubit>();
    bool isLocked = languageCubit.isLevelLocked(levelName);
    bool isLastVisited = languageCubit.currentLevel == levelName;

    return GestureDetector(
      onTap: isLocked ? null : onTap, // Disable tap if locked
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: right, left: left),
            child: Opacity(
              opacity: isLocked ? 0.5 : 1.0, // Reduce opacity if locked
              child: Image.asset('assets/images/level$n.png', height: 150),
            ),
          ),
          if (isLastVisited)
            Positioned(
              right: 125,
              top: 45,
              child: Image(image: AssetImage('assets/images/lastVisitLvl.png')),
            ),
        ],
      ),
    );
  }
}
