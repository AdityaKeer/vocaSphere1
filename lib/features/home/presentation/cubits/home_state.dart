import 'package:flutter/material.dart';

import 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {} // Represents loading or initial state

class LangSelected extends HomeState {
  final String selectedLanguage;
  final Widget page;

  LangSelected({required this.selectedLanguage, required this.page});
}

class LanguageListUpdated extends HomeState {
  final Map<String, Widget> languagePages;

  LanguageListUpdated({required this.languagePages});
}

class HomeLoading extends HomeState {}

class UserNameFetched extends HomeState {
  final String userName;
  // final List<double> langPercentage;
  final List<LangProgress> listOfLaves;
  UserNameFetched({required this.listOfLaves, required this.userName});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
