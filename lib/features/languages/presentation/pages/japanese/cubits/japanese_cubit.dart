import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/languages/presentation/pages/japanese/cubits/japanese_state.dart';

import '../../../../../levels/presentation/hindi_levels/hn_lvl1.dart';
import '../../../../../levels/presentation/hindi_levels/hn_lvl2.dart';
import '../../../../../levels/presentation/japanese_levels/jp_lvl1.dart';
import '../../../../../levels/presentation/japanese_levels/jp_lvl2.dart';
import '../../../../../levels/presentation/marathi_levels/mr_lvl1.dart';
import '../../../../../levels/presentation/marathi_levels/mr_lvl2.dart';

class JapaneseCubit extends Cubit<JapaneseState> {
  JapaneseCubit() : super(JapaneseInitial()) {
    initializeEnLevels();
  }
  Map<String, Widget> _levelPages = {};

  void initializeEnLevels() {
    if (_levelPages.isNotEmpty) return;
    _levelPages = {
      'JpLvl1': const JpLvl1(),
      'JpLvl2': const JpLvl2(),
      'JpLvl3': const JpLvl1(),
      'JpLvl4': const JpLvl2(),
      'JpLvl5': const MrLvl1(),
      'JpLvl6': const MrLvl2(),
      'JpLvl7': const HnLvl1(),
      'JpLvl8': const HnLvl1(),
      'JpLvl9': const HnLvl1(),
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
