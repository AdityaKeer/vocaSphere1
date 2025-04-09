import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    print(" Languages Initialized: ${_languagePages.keys.toList()}");

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

  void resetLanguages() {
    initializeLanguages();
  }

  Future<void> getUserName() async {
    try {
      // emit(HomeLoading());
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final doc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        final name = doc["name"];
        emit(UserNameFetched(userName: name));
        await Future.delayed(const Duration(milliseconds: 200));
        emit(LanguageListUpdated(languagePages: Map.from(_languagePages)));
      } else {
        emit(HomeError("User not logged in"));
      }
    } catch (e) {
      emit(HomeError("Failed to fetch username: $e"));
    }
  }
}
