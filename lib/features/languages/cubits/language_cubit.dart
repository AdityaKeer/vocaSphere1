import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:major_project1/features/levels/components/lvl_endingPage.dart';
import 'package:major_project1/features/levels/presentation/english_levels/en_lvl2.dart';
import 'package:major_project1/features/levels/presentation/hindi_levels/hn_lvl3.dart';
import 'package:major_project1/features/levels/presentation/hindi_levels/hn_lvl4.dart';
import 'package:major_project1/features/levels/presentation/japanese_levels/jp_lvl4.dart';
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
  late String language;
  LanguageCubit() : super(LanguageInitial());

  Map<String, Widget> _levelPages = {};

  void initializeLevels() {
    switch (language) {
      case 'Hindi':
        _levelPages = {
          'HnLvl1': const HnLvl1(),
          'HnLvl2': const HnLvl2(),
          'HnLvl3': const LvlEndingPage(),
          'HnLvl4': const HnLvl4(),
        };
        break;
      case 'English':
        _levelPages = {'EnLvl1': const EnLvl1(), 'EnLvl2': const EnLvl2()};
        break;
      case 'Japanese':
        _levelPages = {
          'JpLvl1': const JpLvl1(),
          'JpLvl2': const JpLvl2(),
          'JpLvl4': const JpLvl4(),
        };
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
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => _levelPages[name]!),
      // ).then((action) {
      //   if (action is BtnAction) {
      //     if (action == BtnAction.nextLvl) {
      //       int nextLvlIndex = _levelPages.keys.toList().indexOf(name);
      //       selectLevel(_levelPages.keys.elementAt(nextLvlIndex + 1), context);
      //     } else if (action == BtnAction.backToLvls) {
      //       Navigator.pop(context);
      //     } else {
      //       emit(LevelListUpdated(levelPages: Map.from(_levelPages)));
      //     }
      //   }
      // });
    }
  }
}
