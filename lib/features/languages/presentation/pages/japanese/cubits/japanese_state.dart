import 'package:flutter/material.dart';

abstract class JapaneseState {}

class JapaneseInitial extends JapaneseState {}

class LevelSelected extends JapaneseState {
  final String selectedLevel;
  final Widget lvlPage;

  LevelSelected({required this.selectedLevel, required this.lvlPage});
}

class LevelListUpdated extends JapaneseState {
  final Map<String, Widget> levelPages;
  LevelListUpdated({required this.levelPages});
}
