import 'package:flutter/material.dart';

abstract class HindiState {}

class HindiInitial extends HindiState {}

class LevelSelected extends HindiState {
  final String selectedLevel;
  final Widget lvlPage;

  LevelSelected({required this.selectedLevel, required this.lvlPage});
}

class LevelListUpdated extends HindiState {
  final Map<String, Widget> levelPages;
  LevelListUpdated({required this.levelPages});
}
