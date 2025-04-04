import 'package:flutter/material.dart';

abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LevelSelected extends LanguageState {
  final String selectedLevel;
  final Widget lvlPage;

  LevelSelected({required this.selectedLevel, required this.lvlPage});
}

class LevelListUpdated extends LanguageState {
  final Map<String, Widget> levelPages;
  final String? lastVisitedLevel;
  LevelListUpdated({this.lastVisitedLevel, required this.levelPages});
}
