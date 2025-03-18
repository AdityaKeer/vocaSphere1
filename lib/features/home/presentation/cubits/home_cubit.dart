import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../languages/presentation/pages/english/page/english_page.dart';
import '../../../languages/presentation/pages/hindi/page/hindi_page.dart';
import '../../../languages/presentation/pages/japanese/page/japanese_page.dart';
import '../../../languages/presentation/pages/marathi/page/marathi_page.dart';
import '../../../languages/presentation/pages/sanskrit/page/sanskrit_page.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Map<String, Widget> _languagePages = {};
  void initializeLanguages() {
    _languagePages = {
      'English': const EnglishPage(),
      'Hindi': const HindiPage(),
      'Marathi': const MarathiPage(),
      'Sanskrit': const SanskritPage(),
      'Japanese': const JapanesePage(),
    };
    emit(LanguageListUpdated(languagePages: Map.from(_languagePages)));
  }

  void selectLanguage(String name) {
    if (_languagePages.containsKey(name)) {
      emit(LangSelected(selectedLanguage: name, page: _languagePages[name]!));
    }
  }

  String? selectedLngCode;
  void setSelectedLan(String name) {
    selectedLngCode = name;
  }
}
