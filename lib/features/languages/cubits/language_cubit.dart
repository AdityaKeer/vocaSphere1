import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/levels/presentation/english_levels/en_lvl2.dart';
import 'package:major_project1/features/levels/presentation/english_levels/quiz_screen.dart';
import 'package:major_project1/features/levels/presentation/hindi_levels/hn_lvl3.dart';
import 'package:major_project1/features/levels/presentation/hindi_levels/hn_lvl4.dart';
import 'package:major_project1/features/levels/presentation/hindi_levels/hn_lvl6.dart';
import 'package:major_project1/features/levels/presentation/japanese_levels/jp_lvl3.dart';
import 'package:major_project1/features/levels/presentation/japanese_levels/jp_lvl6.dart';
import 'package:major_project1/features/levels/presentation/japanese_levels/jp_lvl7.dart';
import 'package:major_project1/features/levels/presentation/marathi_levels/mr_lvl6.dart';
import 'package:major_project1/features/levels/presentation/sanskrit_levels/sa_lvl6.dart';
import '../../authentication/data/firebase_auth_repo.dart';
import '../../levels/presentation/english_levels/en_lvl1.dart';
import '../../levels/presentation/hindi_levels/hn_lvl1.dart';
import '../../levels/presentation/hindi_levels/hn_lvl2.dart';
import '../../levels/presentation/hindi_levels/hn_lvl5.dart';
import '../../levels/presentation/japanese_levels/jp_lvl1.dart';
import '../../levels/presentation/japanese_levels/jp_lvl2.dart';
import '../../levels/presentation/japanese_levels/jp_lvl4.dart';
import '../../levels/presentation/japanese_levels/jp_lvl5.dart';
import '../../levels/presentation/marathi_levels/mr_lvl1.dart';
import '../../levels/presentation/marathi_levels/mr_lvl2.dart';
import '../../levels/presentation/marathi_levels/mr_lvl3.dart';
import '../../levels/presentation/marathi_levels/mr_lvl4.dart';
import '../../levels/presentation/marathi_levels/mr_lvl5.dart';
import '../../levels/presentation/sanskrit_levels/sa_lvl1.dart';
import '../../levels/presentation/sanskrit_levels/sa_lvl2.dart';
import '../../levels/presentation/sanskrit_levels/sa_lvl3.dart';
import '../../levels/presentation/sanskrit_levels/sa_lvl4.dart';
import '../../levels/presentation/sanskrit_levels/sa_lvl5.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final FirebaseAuthRepo authRepo;
  String language = ' ';
  List<String> completedLevels = [];
  String? currentLevel;
  Map<String, Widget> _levelPages = {};

  LanguageCubit(this.authRepo) : super(LanguageInitial());

  Map<String, Widget> get levelPages => _levelPages;

  // Initialize levels
  void initializeLevels(String newLanguage) {
    if (language == newLanguage && _levelPages.isNotEmpty) return;
    language = newLanguage;
    _levelPages.clear();

    switch (newLanguage) {
      case 'Hindi':
        _levelPages = {
          'HnLvl1': const HnLvl1(),
          'HnLvl2': const HnLvl2(),
          'HnLvl3': const HnLvl3(),
          'HnLvl4': const HnLvl4(),
          'HnLvl5': const HnLvl5(),
          'HnLvl6': const HnLvl6(),
        };
        break;
      case 'English':
        _levelPages = {'EnLvl1': const QuizScreen(), 'EnLvl2': const EnLvl2()};
        break;
      case 'Japanese':
        _levelPages = {
          'JpLvl1': const JpLvl1(),
          'JpLvl2': const JpLvl2(),
          'JpLvl3': const JpLvl3(),
          'JpLvl4': const JpLvl4(),
          'JpLvl5': const JpLvl5(),
          'JpLvl6': const JpLvl7(),
        };
        break;
      case 'Sanskrit':
        _levelPages = {
          'SaLvl1': const SaLvl1(),
          'SaLvl2': const SaLvl2(),
          'SaLvl3': const SaLvl3(),
          'SaLvl4': const SaLvl4(),
          'SaLvl5': const SaLvl5(),
          'SaLvl6': const SaLvl6(),
        };
        break;
      case 'Marathi':
        _levelPages = {
          'MrLvl1': const MrLvl1(),
          'MrLvl2': const MrLvl2(),
          'MrLvl3': const MrLvl3(),
          'MrLvl4': const MrLvl4(),
          'MrLvl5': const MrLvl5(),
          'MrLvl6': const MrLvl6(),
        };
        break;
    }

    emit(LevelListUpdated(levelPages: Map.from(_levelPages)));
  }

  void loadUserProgress() async {
    final progress = await authRepo.getUserProgress(language);

    if (progress.isNotEmpty) {
      completedLevels = List<String>.from(progress["CompletedLevels"]);
      currentLevel = progress["LastVisitedLevel"];
    } else {
      completedLevels = [];
      currentLevel = null; //  Prevents auto-opening last level
    }

    emit(
      LevelListUpdated(
        lastVisitedLevel: currentLevel,
        levelPages: Map.from(_levelPages),
      ),
    );
  }

  // Move to the next level if available
  void nextlvl() {
    if (currentLevel == null) return;
    int nextLvlIndex = _levelPages.keys.toList().indexOf(currentLevel!);
    if (nextLvlIndex + 1 < _levelPages.keys.length) {
      if (!completedLevels.contains(currentLevel!)) {
        completedLevels.add(currentLevel!);
      }
      // Move to the next level (Unlock it)
      currentLevel = _levelPages.keys.elementAt(nextLvlIndex + 1);
      authRepo.saveUserProgress(language, currentLevel!, completedLevels);
      emit(LevelListUpdated(levelPages: Map.from(_levelPages)));
    }
  }

  void retryLvl() {
    if (currentLevel == null || !_levelPages.containsKey(currentLevel)) return;
    selectLevel(currentLevel!);
    authRepo.saveUserProgress(language, currentLevel!, completedLevels);
  }

  Widget? selectLevel(String name) {
    if (_levelPages.containsKey(name)) {
      currentLevel = name;
      authRepo.saveUserProgress(language, currentLevel!, completedLevels);
      return _levelPages[name]!;
      emit(LevelSelected(selectedLevel: name, lvlPage: _levelPages[name]!));
    }
    return null;
  }

  // Set language and load progress (combines both functionalities safely)
  Future<void> setLanguageAndLoadProgress(String newLanguage) async {
    print("Switching to language: $newLanguage");
    if (language == newLanguage) {
      return;
    }
    //  Reset all values before switching
    language = newLanguage;
    completedLevels = [];
    currentLevel = null;
    _levelPages.clear();

    initializeLevels(newLanguage); //  Properly initialize the new language

    final progress = await authRepo.getUserProgress(language);

    if (progress.isNotEmpty) {
      completedLevels = List<String>.from(progress["CompletedLevels"] ?? []);
      currentLevel = progress["LastVisitedLevel"];
    } else {
      completedLevels = [];
      currentLevel = _levelPages.isNotEmpty ? _levelPages.keys.first : null;
    }

    //  Save progress again to ensure correct data
    authRepo.saveUserProgress(language, currentLevel ?? "", completedLevels);
    print(
      "Loaded Progress - Language: $language, Last Level: $currentLevel, Completed: $completedLevels",
    );

    emit(
      LevelListUpdated(
        lastVisitedLevel: currentLevel,
        levelPages: Map.from(_levelPages),
      ),
    ); // Notify UI
  }

  bool isLevelLocked(String levelName) {
    List<String> levels = _levelPages.keys.toList();
    int index = levels.indexOf(levelName);
    if (index == 0) return false;
    return !completedLevels.contains(levels[index - 1]);
  }

  void resetLevel() {
    emit(
      LevelListUpdated(levelPages: Map.from(_levelPages)),
    ); // Reset levels list to show all levels
  }

  Future<double> completionPercentage(String language) async {
    final lvlProgress = await authRepo.getUserProgress(language);
    completedLevels = List<String>.from(lvlProgress["CompletedLevels"] ?? []);
    double percentage = (completedLevels.length / 6);
    print(percentage * 100);
    return percentage;
  }
}
