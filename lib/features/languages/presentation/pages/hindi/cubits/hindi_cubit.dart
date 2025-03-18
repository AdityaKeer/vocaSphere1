import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/languages/presentation/pages/hindi/cubits/hinidi_state.dart';
import 'package:major_project1/features/levels/presentation/hindi_levels/hn_lvl1.dart';
import 'package:major_project1/features/levels/presentation/hindi_levels/hn_lvl2.dart';
import 'package:major_project1/features/levels/presentation/japanese_levels/jp_lvl1.dart';
import 'package:major_project1/features/levels/presentation/japanese_levels/jp_lvl2.dart';
import 'package:major_project1/features/levels/presentation/marathi_levels/mr_lvl1.dart';
import 'package:major_project1/features/levels/presentation/marathi_levels/mr_lvl2.dart';

class HindiCubit extends Cubit<HindiState> {
  HindiCubit() : super(HindiInitial()) {
    initializeHnLevels();
  }

  Map<String, Widget> _levelPages = {};

  void initializeHnLevels() {
    if (_levelPages.isNotEmpty) return;
    _levelPages = {
      'HnLvl1': const HnLvl1(),
      'HnLvl2': const HnLvl2(),
      'HnLvl3': const JpLvl1(),
      'HnLvl4': const JpLvl2(),
      'HnLvl5': const MrLvl1(),
      'HnLvl6': const MrLvl2(),
      'HnLvl7': const HnLvl1(),
      'HnLvl8': const HnLvl1(),
      'HnLvl9': const HnLvl1(),
    };
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
