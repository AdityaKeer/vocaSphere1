import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import '../../../authentication/data/firebase_auth_repo.dart';
import '../../../languages/presentation/pages/english/page/english_page.dart';
import '../../../languages/presentation/pages/hindi/page/hindi_page.dart';
import '../../../languages/presentation/pages/japanese/page/japanese_page.dart';
import '../../../languages/presentation/pages/marathi/page/marathi_page.dart';
import '../../../languages/presentation/pages/sanskrit/page/sanskrit_page.dart';
import 'home_state.dart';

class LangProgress {
  String langName;
  double completed;

  LangProgress(this.langName, this.completed);
}

class HomeCubit extends Cubit<HomeState> {
  final FirebaseAuthRepo authRepo;
  HomeCubit(this.authRepo) : super(HomeInitial());
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

  Future<void> getUserName(List<String> langList) async {
    try {
      // emit(HomeLoading());
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final doc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        final name = doc["name"];

        List<dynamic> langDataList = [];
        // List<double> percentList = [];
        // var percentArray = [];

        List<LangProgress> listOfLevels = List.empty(growable: true);

        for (int i = 0; i < langList.length; i++) {
          var usersLvlProgress = await authRepo.getUserProgress(langList[i]);
          // for (int j = 0; j <= i; j++) {
          //   var levelsCompleted = List<String>.from(
          //     usersLvlProgress["CompletedLevels"] ?? [],
          //   );
          //   double percent = levelsCompleted.length / 6;
          //   listOfLevels.add(LangProgress(langList[i], percent));
          // }

          var levelsCompleted = List<String>.from(
            usersLvlProgress["CompletedLevels"] ?? [],
          );
          double percent = levelsCompleted.length / 6;
          listOfLevels.add(LangProgress(langList[i], percent));

          // double percent = levelsCompleted.length / 6;
          // listOfLevels.add(LangProgress(langList[i], percent));
        }

        // for (int j = 0; j < langDataList.length; j++) {
        //   percentArray.add(
        //     List<String>.from(langDataList[j]["CompletedLevels"] ?? []).length,
        //   );
        //   print(percentArray[j]);
        // }
        // print(percentArray);
        //
        //
        // for (int k = 0; k < percentArray.length; k++) {
        //   percentList.add(percentArray[k] / 6);
        // }
        // print(percentList);

        emit(UserNameFetched(userName: name, listOfLaves: listOfLevels));
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
