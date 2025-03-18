import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/levels/presentation/english_levels/en_lvl2.dart';
import '../../levels/presentation/english_levels/en_lvl1.dart';
import '../../levels/presentation/hindi_levels/hn_lvl1.dart';
import '../../levels/presentation/hindi_levels/hn_lvl2.dart';
import '../../levels/presentation/japanese_levels/jp_lvl1.dart';
import '../../levels/presentation/japanese_levels/jp_lvl2.dart';
import '../../levels/presentation/marathi_levels/mr_lvl1.dart';
import '../../levels/presentation/marathi_levels/mr_lvl2.dart';
import '../../levels/presentation/sanskrit_levels/sa_lvl1.dart';
import '../../levels/presentation/sanskrit_levels/sa_lvl2.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final String language;
  LanguageCubit({required this.language}) : super(LanguageInitial()) {
    initializeLevels();
  }

  Map<String, Widget> _levelPages = {};

  void initializeLevels() {
    if (_levelPages.isNotEmpty) return;

    switch (language) {
      case 'Hindi':
        _levelPages = {'HnLvl1': const HnLvl1(), 'HnLvl2': const HnLvl2()};
        break;
      case 'English':
        _levelPages = {'EnLvl1': const EnLvl1(), 'EnLvl2': const EnLvl2()};
        break;
      case 'Japanese':
        _levelPages = {'JpLvl1': const JpLvl1(), 'JpLvl2': const JpLvl2()};
        break;
      case 'Sanskrit':
        _levelPages = {'SaLvl1': const SaLvl1(), 'SaLvl2': const SaLvl2()};
        break;
      case 'Marathi':
        _levelPages = {'MrLvl1': const MrLvl1(), 'MrLvl2': const MrLvl2()};
        break;
    }

    emit(LevelListUpdated(levelPages: Map.from(_levelPages)));
  }

  void selectLevel(String name, BuildContext context) {
    if (_levelPages.containsKey(name)) {
      emit(LevelSelected(selectedLevel: name, lvlPage: _levelPages[name]!));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _levelPages[name]!),
      ).then((_) {
        emit(LevelListUpdated(levelPages: Map.from(_levelPages)));
      });
    }
  }
}
