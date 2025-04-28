import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import '../../../authentication/data/firebase_auth_repo.dart';
import '../../../languages/presentation/pages/chinese/page/chinese_page.dart';
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
      'Chinese': const ChinesePage(),
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

        List<LangProgress> listOfLevels = List.empty(growable: true);

        for (int i = 0; i < langList.length; i++) {
          var usersLvlProgress = await authRepo.getUserProgress(langList[i]);

          var levelsCompleted = List<String>.from(
            usersLvlProgress["CompletedLevels"] ?? [],
          );
          double percent = levelsCompleted.length / 6;
          listOfLevels.add(LangProgress(langList[i], percent));
        }

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

  Future<void> uploadBulkData() async {
    try {
      // Step 1: Load the JSON data from the assets
      String jsonString = await rootBundle.loadString(
        'assets/jsonWords/saWords.json',
      );

      // Step 2: Decode the JSON string into a Dart object (List of Maps)
      List<dynamic> wordsData = jsonDecode(jsonString);

      // Step 3: Get a reference to the Firestore collection
      CollectionReference wordsCollection = FirebaseFirestore.instance
          .collection('saWords');

      // Step 4: Loop through the data and add each word to Firestore
      for (var wordData in wordsData) {
        await wordsCollection.add({
          'id': wordData['id'],
          'word': wordData['word'],
          'definition': wordData['definition'],
        });

        // Optional: Add a small delay to prevent overwhelming Firestore
        await Future.delayed(Duration(milliseconds: 100));
      }

      print(
        'Bulk upload completed! ${wordsData.length} marathi words uploaded to Firestore.',
      );
    } catch (e) {
      print('Error during bulk upload: $e');
    }
  }
}
